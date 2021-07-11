
//----------------------------------------------------------------------------//
// Unpublished work. Copyright 2021 Siemens                                   //
//                                                                            //
// This material contains trade secrets or otherwise confidential             //
// information owned by Siemens Industry Software Inc. or its affiliates      //
// (collectively, "SISW"), or its licensors. Access to and use of this        //
// information is strictly limited as set forth in the Customer's applicable  //
// agreements with SISW.                                                      //
//----------------------------------------------------------------------------//

#include "ConvertVpiSimTime.h"
#include "XlSyscTimeAdvancer.h"
#include "BrakingSystemInterfaceModel.h"

//___________________________________                            _________________
// class BrakingSystemInterfaceModel \__________________________/ mabdels 7-3-2018
//--------------------------------------------------------------------------------

void BrakingSystemInterfaceModelKey() {}

BrakingSystemInterfaceModel::BrakingSystemInterfaceModel(
    sc_module_name name, string pulpinoTopHdlPath )
  : sc_module( name ),
    hdlPath(string())
{
    if(!pulpinoTopHdlPath.empty())
        hdlPath = pulpinoTopHdlPath + ".peripherals_i.dac_i.DAC_GEN[0].dac_i";
}

BrakingSystemInterfaceModel::~BrakingSystemInterfaceModel(){ }

void BrakingSystemInterfaceModel::onStartOfSimulation()
{
    svScope brakingSystemScope = svGetScopeFromName(hdlPath.c_str());
    if(!brakingSystemScope)
        errorCallFailed(string("BrakingSystemInterfaceModel::onStartOfSimulation(" + hdlPath + ")").c_str(),
                               "svGetScopeFromName()", __LINE__, __FILE__);
    svPutUserData(brakingSystemScope, (void*)(&BrakingSystemInterfaceModelKey), this);
}

//---------------------------------------------------------------------------
// Imported DPI Function declarations.
//---------------------------------------------------------------------------
extern "C"{

 void writeToDACshadowRegister(svBitVecVal* dacDataReg)
 {
   svScope callerScope = svGetScope();
   BrakingSystemInterfaceModel* brakingSystemInterfaceModel = (BrakingSystemInterfaceModel*)svGetUserData( \
                                                                           callerScope, \
                                                                           (void*)(BrakingSystemInterfaceModelKey));
   if(brakingSystemInterfaceModel == NULL)
       printf("Fail to get the BrakingSystemInterfaceModel instance for the path %s\n", \
                                          svGetNameFromScope(callerScope));
   else {

       //extract the register value
       u_int16_t       regVal;
       svBitVecVal     tmpReg = 0;
            
       svGetPartselBit(&tmpReg, dacDataReg, 0, 16);
       regVal = (u_int16_t)(tmpReg);
       printf("DAC Register changed to 0x%x\n", regVal);
  }
 }
}
