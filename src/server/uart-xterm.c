#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <strings.h>
#include <assert.h>
#include <string>

using std::string;

string dLineBuffer;

void errorFileOpen(
    const char *functionName, const char *fileName, const char *access )
{   char messageBuffer[1024];
    sprintf( messageBuffer,
        "%s: Cannot open file '%s' for %s access.\n",
        functionName, fileName, access );
    fprintf( stdout, "ERROR %s", messageBuffer ); }

int main(int argc, char *argv[]) {
    unsigned char c;
    int status;
    struct termios ti;
    unsigned i;

    int isCanonicalTermios = 0;
    int isOutputLogged = 0;
    int keepXterm = 0;

    FILE *infp;
    FILE *logFp = NULL;
    string logFileName;

    int infd, outfd;

    fd_set readFds;
    fd_set writeFds;

    assert (argc == 4);

    // Check for canonical termios mode to know if input character echo 
    // is required.
    if( argv[3][0] == '1' ) isCanonicalTermios = 1;

    if( (infp=fopen(argv[1], "w")) == NULL ) {
        errorFileOpen( "uart-xterm", argv[1], "w" );
        return -1;
    }
    if( (outfd=open(argv[2], O_RDWR)) < 0 ) {
        perror( "open(ptsname())" );
        errorFileOpen( "uart-xterm", argv[2], "r" );
        return -1;
    }

    if( getenv( "UART_LOG_OUTPUT" ) ){
        isOutputLogged = 1;
        logFileName = getenv( "UART_LOG_OUTPUT" );
    }

    // Inhibit's removal of xterm's when client sends EOT (^D)
    if( getenv( "UART_KEEP_XTERM" ) ) keepXterm = 1;

    if( isOutputLogged ) {
        if( logFileName == "YES"
                || logFileName == "TRUE" || logFileName == "1" )
            logFileName = "uart-xterm.log";
        logFp = fopen( logFileName.c_str(), "w" );
        if( logFp == NULL )
            errorFileOpen( "uart-xterm", logFileName.c_str(), "w" );
    }

    infd = fileno( infp );

    // Initialize read and write descriptor sets for use by select.
    FD_ZERO( &readFds );
    FD_SET( 0, &readFds );
    FD_SET( outfd, &readFds );

    FD_ZERO( &writeFds );
    FD_SET( 1, &writeFds );
    FD_SET( infd, &writeFds );

    // NOTE: 0  - stdin from xterm
    // NOTE: 1  - stdout to xterm
    // NOTE: fd - stdio to ptty to xterm client
    int flags;
    flags = fcntl(0, F_GETFL) | O_NONBLOCK;
    fcntl(0, F_SETFL, flags);

    flags = fcntl(outfd, F_GETFL) | O_NONBLOCK;
    fcntl(outfd, F_SETFL, flags);

    tcgetattr(1, &ti);
    cfmakeraw(&ti);
    tcsetattr(1, TCSANOW, &ti);
    tcgetattr(0, &ti);
    ti.c_iflag |= ICRNL;
    tcsetattr(0, TCSANOW, &ti);
    for (;;) {
      
        // NOTE: Lucien Murray-Pitts mods (prefixed by 'LMP:'). Fixes
        // due to issues found at customer X.

        // LMP: Addition of these here as select() corrupts the set upon
        // activation initialize read and write descriptor sets for use by
        // select.
        FD_ZERO( &readFds );
        FD_SET( 0, &readFds );
        FD_SET( outfd, &readFds );
      
        // LMP: fd=1 results in immediate triggering of select.
        FD_ZERO( &writeFds );

        // LMP: These arent used in either of the two IF statements below,
        // thus no requirement
        //    FD_SET( 1, &writeFds );
        //    FD_SET( infd, &writeFds );
      
        // We use the select() function so we can block on all fd's
        // until something is received from either the xterm or from
        // the xterm client. This avoids pegging a CPU core while doing
        // non-blocking access polling.

        // LMP: nfds should be highest fd+1 (so outfd+1)
        if( (status=select(outfd+1, &readFds, &writeFds, NULL, NULL)) == -1 ) {
            perror("select()");
            return -1;
        }

        if ( read(0, &c, 1) == 1 ) { // if( anything from xterm ) ...

            // In "canonical termios" mode (see man page for termios and
            // search for ICANON), whenever there is a '\n' detected,
            // we check to see if there is a pending batch of characters
            // collected from a line of input to be transmitted and
            // send them on to the ptty xterm client.
            //
            // NOTE: The xterm connected to this ptty driver
            // should inherently support ICANON mode however, it did
            // not seem to work at first attempt so, instead, we leave the
            // actual xterm connected to this ptty ddriver configured for
            // "raw mode" and emulate the equivalent of canonical mode in this
            // driver itself.
            //
            // In this particular implementation special processing of NL and CR
            // is done in a manner similar to termios. In particular,
            // NL's ('\n's) received from the xterm via the pty are translated
            // to CR's before passing on to the ptty xterm client. This is
            // similar INLCR mode in termios.
            //
            // Additionally, this xterm client helper utility supports
            // backspace and ^C. Backspace will remove characters from the
            // line buffer in canonical mode and as such, backspaced characters
            // will never be sent to DUT. Similarly, ^C kills the current
            // line buffer in canonical mode so if you enter a bunch of
            // characters and want to start all over again, all characters
            // entered so far on the line will be discarded and never sent to
            // the DUT if ^C is typed.
            //
            // This nicely allows for typing mistakes ! :-)

            if( isCanonicalTermios ) {

                // In canonical mode we locally echo input characters back
                // to the raw xterm immediately despite not sending them
                // to the ptty xterm client until a whole line is
                // collected.  We also translate to NL+CR for cannonical
                // mode only.
                write(1, &c, 1);
                if( c == '\n' ) {
                     c = '\r';
                     write(1, &c, 1);
                }
                dLineBuffer += c;

                // In canonical mode we collect characters into a line
                // buffer until NL (which was translated to CR above)
                // is detected.

                if( c == '\r' || c == 4 ) {
                    for( i=0; i<dLineBuffer.size(); i++ ){
                        c = dLineBuffer[i];
                        write(infd, &c, 1); // Pass to ptty xterm client.
                        if (c == 4) return 0;
                    }
                    dLineBuffer = "";
                }
                // Convert ^C to '\r' and kill the line buffer in progress.
                else if( c == 3 ) {
                    c = '^';  write(1, &c, 1);
                    c = 'C';  write(1, &c, 1);
                    c = '\r'; write(1, &c, 1);
                    write(infd, &c, 1); // Pass to ptty xterm client.
                    dLineBuffer = "";
                }
                // For ^H (0x7f DEL or '\b' character (a.k.a. Backspace) erase
                // characters from line buffer.
                else if( c == 0x7f || c == '\b' ) {
                    c = '\b'; write(1, &c, 1);
                    if( dLineBuffer.size() <= 1 ) dLineBuffer = "";
                    else dLineBuffer
                        = dLineBuffer.substr( 0, dLineBuffer.size()-2 );
                }
            }
            else { // Raw mode
                write(infd, &c, 1);        // Pass to ptty xterm client.
                if (c == 4) return 0;
            }
        }
        // if( anything from ptty xterm client ) ...
        //     Pass to xterm.
        if ( read(outfd, &c, 1) == 1 ) {
            write(1, &c, 1);
            if( isOutputLogged && c != '\r' ) {
                fputc( c, logFp );
                fflush( logFp );
            }
            if( keepXterm == 0 && c == 4 ) // Terminate on ^D (EOF)
                break;
        }
    }
    fclose( infp );
    if( logFp ) fclose( logFp );
    return 0;
}
