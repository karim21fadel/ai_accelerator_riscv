//----------------------------------------------------------------------------//
// Unpublished work. Copyright 2021 Siemens                                   //
//                                                                            //
// This material contains trade secrets or otherwise confidential             //
// information owned by Siemens Industry Software Inc. or its affiliates      //
// (collectively, "SISW"), or its licensors. Access to and use of this        //
// information is strictly limited as set forth in the Customer's applicable  //
// agreements with SISW.                                                      //
//----------------------------------------------------------------------------//

#ifndef _BrakingSystemInterfaceModel_h
#define _BrakingSystemInterfaceModel_h

#include "systemc.h"
#include "svdpi.h"

using std::string;

//___________________________________                              __________________
// class BrakingSystemInterfaceModel \____________________________/ mabdels 7-3-2018
//-----------------------------------------------------------------------------------

class BrakingSystemInterfaceModel : public sc_module {

  public:

    enum { QUANTUM_RATIO = 100 };

  private:

  public:

    //-------------------------------------------
    // Constructors/Destructors

    BrakingSystemInterfaceModel( sc_module_name name, string pulpinoTopHdlPath = string());
    ~BrakingSystemInterfaceModel();

    void onStartOfSimulation();

  private:

    string hdlPath;

    //---------------------------------------------------------
    // Error handlers                          -- johnS 1-24-18
    //---------------------------------------------------------
    //

    void errorCallFailed( const char *functionName,
        const char *callName, int line, const char *file ) const
    {   char messageBuffer[1024];
        sprintf( messageBuffer,
            "Error in function '%s', call to '%s' failed "
            "[line #%d of '%s'].\n",
            functionName, callName, line, file );
        SC_REPORT_FATAL( "FMI-FATAL", messageBuffer ); }

};

#endif // _BrakingSystemInterfaceModel_h
