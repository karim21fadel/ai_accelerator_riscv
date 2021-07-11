//----------------------------------------------------------------------------//
// Unpublished work. Copyright 2021 Siemens                                   //
//                                                                            //
// This material contains trade secrets or otherwise confidential             //
// information owned by Siemens Industry Software Inc. or its affiliates      //
// (collectively, "SISW"), or its licensors. Access to and use of this        //
// information is strictly limited as set forth in the Customer's applicable  //
// agreements with SISW.                                                      //
//----------------------------------------------------------------------------//

#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <assert.h>
#include <termios.h> // connection out to the xterm itself.
#include <unistd.h>
#include <fcntl.h>

#include "svdpi.h"

using std::string;

const unsigned BAUD_RATE = 781250;

extern "C" {

// ---------------------------------------------
// Export "DPI-C" declarations

// Configuration functions:
//     baudRate        [32]
//     pollingInterval [32]
//     clocksPerBit    [32]
//     rts             [1]

void XlUartTransactorSetBaudRate( unsigned newBaudRate );
void XlUartTransactorSetPollingInterval( unsigned newPollingInterval );
void XlUartTransactorSetClocksPerBit( unsigned newClocksPerBit );
void XlUartTransactorSetRts( svBit newRts );

// Configuration query functions:
//     baudRate        [32]
//     pollingInterval [32]
//     clockRate       [32]
//     clocksPerBit    [32]
//     rts             [1]

unsigned XlUartTransactorGetBaudRate();
unsigned XlUartTransactorGetPollingInterval();
unsigned XlUartTransactorGetClockRate();
unsigned XlUartTransactorGetClocksPerBit();
svBit XlUartTransactorGetRts();

void XlUartInitiateTransmit( unsigned char txChar );

// These are the names of the standard input and output channels to the
// xterm program.
//
// The character output channel (to transmit characters received from
// the HDL-side transactor back to the xterm itself) uses a pseudo-terminal
// connection.
//
// However the input "pseudo-terminal" is actually implemented as a named pipe
// that must be created via mkfifo(1) before this program is run.
//
// It was changed from its original implementation using a pseudo-tty
// because of apparent character buffering issues that caused lost
// characters. As mentioned above, the original pseudo-terminal is still
// used for output.
static const char *inPtsName = "./inpts"; // Use named pipe for input
//static const char *outPtsName = "./outpts"; // Use named pipe for output
static const char *outPtsName = "/dev/ptmx"; // Use pseudo-terminal for output

//___________                                                _________________
// testbench \______________________________________________/ johnS 12-11-2011
//
// This small testbench demonstrates the "rawC HDL-centric" use model for
// TLM conduits. It is a variation of the SystemC "HVL-centric"
// ../SyscTlmXtermClientDceLoopback/ testbench. This version implements the
// entire UART xterm client loopback testbench completely without SystemC
// threads and with only 0-time ANSI-C import "DPI-C" calls.
//----------------------------------------------------------------------------

extern void XlUartBootstrapProxy();

//__________________________                                 _________________
// struct UartClientContext \_______________________________/ johnS 12-11-2011
//
// This is a small context class for handing the HDL-centric context object
// for the UART xterm client testbench.
//----------------------------------------------------------------------------

struct UartClientContext {
    FILE *inPtyFp;
    FILE *outPtyFp;

    svScope uartTransactorContext;
    svScope rootHdlContext;

    unsigned char dataPayload[256];

    unsigned totalNumTxChars;

    bool isCanonicalTermios;
    unsigned lineBufferNumChars;
    string lineBuffer;

    UartClientContext()
        : inPtyFp(NULL), outPtyFp(NULL), uartTransactorContext(NULL),
          rootHdlContext(NULL), totalNumTxChars(0),
          isCanonicalTermios(false), lineBufferNumChars(0) {}
};

//---------------------------------------------------------
// Error Handlers                           -- johnS 4-1-11
//---------------------------------------------------------

static void errorFileOpen(
    const char *functionName, const char *fileName, const char *access )
{   char messageBuffer[1024];
    sprintf( messageBuffer,
        "%s: Cannot open file '%s' for %s access.\n",
        functionName, fileName, access );
    printf( "UART-ERROR: %s", messageBuffer ); }

static void errorPseudoTerminalGrant(
    const char *functionName, const char *fileName )
{   char messageBuffer[1024];
    sprintf( messageBuffer,
        "%s: Cannot get access granted to slave pseudo-terminal, '%s'.\n",
        functionName, fileName );
    printf( "UART-ERROR: %s", messageBuffer ); }

static void errorPseudoTerminalUnlock(
    const char *functionName, const char *fileName )
{   char messageBuffer[1024];
    sprintf( messageBuffer,
        "%s: Cannot get access unlocked to slave pseudo-terminal, '%s'.\n",
        functionName, fileName );
    printf( "UART-ERROR: %s", messageBuffer ); }

//---------------------------------------------------------
// XlUartTransactorEotReceived()          -- johnS 12-11-11
//
// This was called due to an end-of-transmition (^D EOT) termination
// of a UART xterm.
//---------------------------------------------------------

void XlUartTransactorEotReceived() {

    UartClientContext *me = reinterpret_cast<UartClientContext *>(
        svGetUserData( svGetScope(), (void *)(&XlUartBootstrapProxy) ) );

    fprintf( stdout,
        "UART-INFO uartXtermTransportBw() "
        "... completed processing of xterm connection "
        "totalNumTxChars=%d.\n", me->totalNumTxChars );

    if( me->inPtyFp ) {
        fprintf( stdout,
            "UART-INFO uartXtermTransportBw() "
            "Closing TX pseudo-terminal file ...\n" );
        fclose( me->inPtyFp );
    }
    if( me->outPtyFp ) {
        fprintf( stdout,
            "UART-INFO uartXtermTransportBw() "
            "Closing RX pseudo-terminal file ...\n" );
        fputc( 4, me->outPtyFp ); // Send EOF (^D) to uart-xterm to tell it to
        fflush( me->outPtyFp );   // to terminate.
        fclose( me->outPtyFp );
    }
}

//---------------------------------------------------------
// XlUartTransactorSendRxChar()           -- johnS 12-11-11
//
// This function processes received characters from the UART
// transactor.
//
// Each character is sent via the pseudo-terminal to the xterm
// for display.
//---------------------------------------------------------

void XlUartTransactorSendRxChar( unsigned char rxChar ) {

    UartClientContext *me = reinterpret_cast<UartClientContext *>(
        svGetUserData( svGetScope(), (void *)(&XlUartBootstrapProxy) ) );

    // Convert NL or CR from DCE to NL-CR going back to the xterm.
    if( rxChar == '\n' || rxChar == '\r' ) {
        fputc( '\n', me->outPtyFp );
        fputc( '\r', me->outPtyFp );
    }
    else fputc( rxChar, me->outPtyFp );
    fflush( me->outPtyFp );
}

//---------------------------------------------------------
// XlUartTransactorPollTxChar()           -- johnS 12-11-11
//
// This function obtains the next transmit character from the
// xterm and passes it back to the HDL-side target.
//---------------------------------------------------------

void XlUartTransactorPollTxChar( unsigned char *newTxChar ) {

    UartClientContext *me = reinterpret_cast<UartClientContext *>(
        svGetUserData( svGetScope(), (void *)(&XlUartBootstrapProxy) ) );

    // DCE input direction: Poll next character from xterm,
    // Pass on to DCE ...
    int txChar;

    // Poll from xterm ...
    txChar = fgetc( me->inPtyFp ) & 0xff;

    if( feof(me->inPtyFp) ) txChar = 4 /*EOF*/;

    if( txChar != 0xff && txChar != 4 )
         me->totalNumTxChars++;

    *newTxChar = txChar;
}

//---------------------------------------------------------
// uartXtermClientInit()                    johnS 10-3-2011
//  
// Created the UART xterm pseudo tty ...
//---------------------------------------------------------

void uartXtermClientInit( UartClientContext *context ){

    // Open up a pseudo-terminal to which an 'xterm' will be connected ...
    context->outPtyFp = fopen( outPtsName, "r+" );
    int outfd = fileno( context->outPtyFp ); 
    if( context->outPtyFp == NULL ) {
        string message( "outPtsName " );
        message += outPtsName;
        errorFileOpen(
            "uartXtermClientInit()", message.c_str(), "r+" );
    }
    else if( grantpt(outfd) != 0 )
        errorPseudoTerminalGrant( "uartXtermClientInit()", outPtsName );
    else if( unlockpt(outfd) != 0 )
        errorPseudoTerminalUnlock( "uartXtermClientInit()", outPtsName );
    else {
        // Create input pipe with name unique to this PID and this context.
        char inPtsNameWithPidAndContext[1024];
        char command[1024];

		// Create a named pipe to act as "pseudo-terminal" for xterm input
        // only. This is to avoid lost characters typed quickly as input which
        // was happening when the pseudo-terminal, /tmp/ptmx was attempted.
		//
		// An actual pseudo-terminal is still used for output.

        sprintf( inPtsNameWithPidAndContext, "%s.%d.%p",
            inPtsName, getpid(), context );
        sprintf( command, "mkfifo %s", inPtsNameWithPidAndContext );
        system( command );

        // Fork an xterm and "xterm buddy" middleman connected to the input
        // pipe and the output pty.
        sprintf( command, "xterm -e ./uart-xterm %s %s %d &",
            inPtsNameWithPidAndContext,
            ptsname(outfd), context->isCanonicalTermios );
        fprintf( stdout,
            "UART-INFO uartXtermClientInit() "
            "Opening xterm for interactive character I/O which is accessible "
            "via pseudo-terminal,\n'%s' ...\n", ptsname(outfd) );
        if( context->isCanonicalTermios )
            fprintf( stdout,
                "UART-INFO uartXtermClientInit() "
                "This client is operating in CANONICAL mode "
                "(see man termios).\n" );
        else
            fprintf( stdout,
                "UART-INFO uartXtermClientInit() "
                "This client is operating in RAW mode "
                "(see man termios).\n" );
        system( command );

        // Open up the named pipe to which the 'xterm' was connected to
        // transmit input characters.
        context->inPtyFp = fopen( inPtsNameWithPidAndContext, "r" );
        int infd = fileno( context->inPtyFp );
        if( context->inPtyFp == NULL ){
            string message( "inPtsName " );
            message += inPtsNameWithPidAndContext;
            errorFileOpen( "::UartXtermClient()", message.c_str(), "r" );
        }
    
        // Set up pseudo-terminal for non blocking access.
        int flags = fcntl( outfd, F_GETFL ) | O_NONBLOCK;
        fcntl( infd, F_SETFL, flags );
// OK for blocking access to be used for output.
//      flags = fcntl( outfd, F_GETFL ) | O_NONBLOCK;
//      fcntl( outfd, F_SETFL, flags );

        // Set up pseudo-terminal to translate CR to newline on input.
        struct termios tios;
        tcgetattr( outfd, &tios );
    
        tios.c_lflag = 0;
        tios.c_iflag &= ~ICRNL;
        tios.c_oflag &= ~ONLCR;
    
        tcsetattr( outfd, TCSANOW, &tios );
    }
}

//---------------------------------------------------------
// uartXtermClientConfig()                  johnS 10-3-2011
//  
// Configure the UART's static configuration parameters ...
//---------------------------------------------------------

void uartXtermClientConfig( UartClientContext *context ){

    //---------------------------------------------------------
    // Query the initial transactor configuation ...

    unsigned baudRate, pollingIntervalInClocks, clockRate, clocksPerBit, rts;

    svSetScope( context->uartTransactorContext );
    baudRate        = XlUartTransactorGetBaudRate();

    svSetScope( context->uartTransactorContext );
    pollingIntervalInClocks = XlUartTransactorGetPollingInterval();

    svSetScope( context->uartTransactorContext );
    clockRate       = XlUartTransactorGetClockRate();

    svSetScope( context->uartTransactorContext );
    clocksPerBit    = XlUartTransactorGetClocksPerBit();

    svSetScope( context->uartTransactorContext );
    rts             = XlUartTransactorGetRts();

    fprintf( stdout,
        "UART-INFO uartXtermClientConfig() "
        "UART transactor INITIAL configuration: baudRate=%d "
        "pollingInterval=%d clockRate=%d clocksPerBit=%d rts=%d\n",
        baudRate, pollingIntervalInClocks, clockRate, clocksPerBit, rts );

    baudRate = BAUD_RATE;

    //---------------------------------------------------------
    // Configure the baud rate ...
    svSetScope( context->uartTransactorContext );
    XlUartTransactorSetBaudRate( baudRate );

    //---------------------------------------------------------
    // Configure the polling interval and clocks-per-bit rate.
    //
    // See detailed comments in $(XL_VIP_HOME)/lib/XlTlmUartTransactor.sv
    // rather than repeating them here.

    clocksPerBit = ( (clockRate - 1) / baudRate ) + 1;
    pollingIntervalInClocks = clocksPerBit * ( 8 + 3 + 2 ) * 20;
    // Factor 20 to increase concurrency time budget for each call.

    fprintf( stdout,
        "UART-INFO uartXtermClientConfig() "
        "Entering xterm polling loop pollingIntervalInClocks=%d "
        "clocksPerBit=%d ...\n",
        pollingIntervalInClocks, clocksPerBit );

    svSetScope( context->uartTransactorContext );
    XlUartTransactorSetPollingInterval( pollingIntervalInClocks );

    svSetScope( context->uartTransactorContext );
    XlUartTransactorSetClocksPerBit( clocksPerBit );

    fprintf( stdout,
        "UART-INFO uartXtermClientConfig() "
        "UART transactor FINAL configuration: baudRate=%d "
        "pollingInterval=%d clockRate=%d clocksPerBit=%d rts=%d\n",
        baudRate, pollingIntervalInClocks, clockRate, clocksPerBit, rts );

    svSetScope( context->uartTransactorContext );
    XlUartTransactorSetClocksPerBit( clocksPerBit );
}

//---------------------------------------------------------
// uartXtermClientConfig()                 johnS 12-11-2011
//  
// Kick off UART transmit FSM.
//---------------------------------------------------------

void uartXtermClientStartup( UartClientContext *context ){

    //---------------------------------------------------------
    // Ok, now that we're all configured, let's kick off the
    // UART transmit FSM using a TLM-2.0 non-blocking transport
    // (targetNbTransportFw()) operation which waits for it to terminate
    // due to EOT ...
    //

    // Set up first character as NULL to kick
    // transmit FSM off but not transmit anything.
    svSetScope( context->uartTransactorContext );
    XlUartInitiateTransmit( 0xff );
}

//---------------------------------------------------------
// XlUartBootstrapProxy()                  johnS 12-11-2011
//
// Imported DPI function.
// This is called at init time by the HDL-side XlUartTransactor
// to "self bootstrap" its own proxy.
//---------------------------------------------------------

void XlUartBootstrapProxy() {
    UartClientContext *context = new UartClientContext();

    if( getenv("UART_XTERM_ICANON") ) context->isCanonicalTermios = true;

    uartXtermClientInit( context );

    // Construct a TLM target conduit and register the backward
    // path callback and its context.
    context->uartTransactorContext = svGetScope();

    // Install this context into HDL scope as user context.
    // Use static function address as unique key.
    svPutUserData( context->uartTransactorContext,
        (void *)(&XlUartBootstrapProxy), context );

    // Now configure the UART's static configuration parameters ...
    uartXtermClientConfig( context );

    // And kick off the UART operation itself.
    uartXtermClientStartup( context );
}

};
