//----------------------------------------------------------------------------//
// Unpublished work. Copyright 2021 Siemens                                   //
//                                                                            //
// This material contains trade secrets or otherwise confidential             //
// information owned by Siemens Industry Software Inc. or its affiliates      //
// (collectively, "SISW"), or its licensors. Access to and use of this        //
// information is strictly limited as set forth in the Customer's applicable  //
// agreements with SISW.                                                      //
//----------------------------------------------------------------------------//

#include <link.h>
#include <systemc.h>
#include <string>
#include "svdpi.h"

#include "uvmc.h"
#include "XlRemoteTlmConduitPkg.h"

#include "ConvertVpiSimTime.h"

#include "XlSyscTlmResetGenerator.h"
#include "XlSyscTimeAdvancer.h"
#include "BrakingSystemInterfaceModel.h"

using namespace uvmc;

// This function is usefull for setting breakpoints on in gdb prior to
// elaboration or anything else happening.
extern "C" { extern char *acc_product_version(void); };

//____________________                                         _______________
// class FabricServer \_______________________________________/ johnS 8-8-2017
//----------------------------------------------------------------------------

// ---------------------------------------------------------------------------
// Title: class FabricServer: Top level SC_MODULE on TLM fabric server side
// ---------------------------------------------------------------------------
//
// The ~class FabricServer~ is the top-level SC_MODULE of the HVL-side
// testbench.
//
// | XlTlmResetGenerator  # Open-kit reset generator (TLM flavored one)
// | XlSyscTimeAdvancer   # Open-kit time advancer
//----------------------------------------------------------------------------

class FabricServer : public sc_module {

  private:
    XlSyscTlmResetGenerator *resetGenerator;

    BrakingSystemInterfaceModel *brakingSystemInterfaceModel;

    SC_HAS_PROCESS(FabricServer);

    //---------------------------------------------------------
    // Error handlers                          -- johnS 1-24-18
    //---------------------------------------------------------
    //
  public:

    enum { QUANTUM_RATIO = 1000 };

    //---------------------------------------------------------
    // Constructor/destructor
    //---------------------------------------------------------

    FabricServer( sc_module_name name ) : sc_module(name) {

        SC_THREAD( mainTestThread );
        SC_THREAD( rtosTimerThread );
   //   SC_THREAD( watchdogThread );

        fprintf( stdout,
            "\n\n+=+ INFO: ::FabricServer(): ModelSim Version: %s\n\n",
            acc_product_version() );

        resetGenerator = new XlSyscTlmResetGenerator( "resetGenerator" );

        brakingSystemInterfaceModel = new BrakingSystemInterfaceModel(
            "brakingSystemInterfaceModel", "Top.SOC");
    }

    ~FabricServer(){
        delete resetGenerator;
        delete brakingSystemInterfaceModel;
    }

    void end_of_simulation() {
    }

    void start_of_simulation(){
        // Establish connection to 'remoteSession' client.
        //XlRemoteTlmConduit::connectToClient( "remoteSession" );
        //XlRemoteTlmConduit::listenForAllClients();
        //fprintf( stdout, "+=+ INFO: FabricServer::start_of_simulation() "
        //    "Waiting for client connections ...\n" );
        //fflush( stdout );

        // Create quantum keeper (required for SystemC 2.3 clients only).
//      XlRemoteTlmConduit::createQuantumKeeper( "Top.quantumKeeper" );

        // You only need one of these and it's access methods are static so
        // this pointer is never needed again.
        resetGenerator->connect( "Top.tlmResetGenerator" );

        brakingSystemInterfaceModel->onStartOfSimulation();
    }

  private:
    void mainTestThread();
    void rtosTimerThread();

    void watchdogThread()
    {
        const unsigned long long WATCHDOG_TIMEOUT
            = 20200000000 / FabricServer::QUANTUM_RATIO;

        // Expire after 10 seconds / quantum ratio.
        // We use a quantum ratio to help sim performance when using fast
        // clocks on HDL side in conjunction with very infrequent analog
        // model step size of 10 ms.
        XlSyscTimeAdvancer::advanceNs( WATCHDOG_TIMEOUT );
        printf( "+=+ @%lld ns FabricServer::watchdogThread() "
            "Time expired after %g seconds / %d quantum ratio ! "
            "Stopping simulation now ...\n", convert.timeInNs(),
            WATCHDOG_TIMEOUT * FabricServer::QUANTUM_RATIO / 1e9,
            FabricServer::QUANTUM_RATIO );

        sc_stop();
    }
};

//----------------------------------------------------------------------------
// Method: ::mainTestThread()
//
// This is the top level thread that initiates all subservient "worker threads"
// fo the server-side process of this ~system-of-systems~ simulation.
//
// The purpose of this thread is pretty straightforward,
//
// - Configure the CAN bridge to RTL
// - Fork the ~::mainThread()~ process in ~class BrakingSystemInterfaceModel~
//   to control the interactions with the ~BrakingSystem~ FMU model and the
//   sending and receiving of CAN frames to/from the remote client ECU CAN
//   model.
//----------------------------------------------------------------------------

void FabricServer::mainTestThread() {
  try {
    // Ok, now wait for initial reset from reset generator before enabling
    // transaction traffic generation.
    printf( "Server: @%lld ns +=+ INFO: Awaiting reset ...\n", convert.timeInNs() );
    resetGenerator->waitForReset();
    printf( "Server: @%lld ns +=+ INFO: ... got it!\n", convert.timeInNs() );
    //XlRemoteTlmConduit::disconnectFromClient( "remoteSession" );
  }
  catch( string message ) {
    cerr << message << endl;
    cerr << "Fatal Error: Program aborting." << endl;
  }
  catch(sc_report message) {
    cout << "Error: SystemC report:" << endl;
    cout << "Type: "        << message.get_msg_type() << endl;
    cout << "Message: "     << message.get_msg() << endl;
    cout << "Severity: "    << message.get_severity() << endl;
    cout << "Where: line #" << message.get_line_number()
           << " in "          << message.get_file_name() << endl;
    cout << "Fatal Error: Program aborting." << endl;
  }
  catch(sc_exception message) {
    cerr << "Error: SystemC exception:" << endl;
    cerr << message.what() << endl;
    cerr << "Fatal Error: Program aborting." << endl;
  }
  catch(...) {
    cerr << "Error: Unclassified exception." << endl;
    cerr << "Fatal Error: Program aborting." << endl;
  }
}

//----------------------------------------------------------------------------
// Method: ::rtosTimerThread()
//
// This thread implements the function of a very simple RTOS timer that
// fires at regular intervals and then notifies one more more modules
// that wish to be interrupted on these RTOS alarms.
//
//----------------------------------------------------------------------------

// (begin inline source)

// Set the RTOS timeout for 0.1 seconds, expressed in NS, and adjusted by
// the ~QUANTUM_RATIO~ we're using in this simulation.
const unsigned long long RTOS_TIMEOUT_IN_NS
    = 0.1 * /*ns-per-sec=*/1e9 / FabricServer::QUANTUM_RATIO;

void FabricServer::rtosTimerThread() {
    while( 1 ) {
        XlSyscTimeAdvancer::advanceNs( RTOS_TIMEOUT_IN_NS );
    }
}

// (end inline source)
