#!/bin/tcsh
source ${PULP_PATH}/veloce/vcompile.emu/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=axi2apb

##############################################################################
# Check settings
##############################################################################

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

if (! $?IPS_PATH ) then
  echo "${Red} IPS_PATH is not defined ${NC}"
  exit 1
endif

set LIB_NAME="${IP}_lib"
set LIB_PATH="${MSIM_LIBS_PATH}/${LIB_NAME}"
set IP_PATH="${IPS_PATH}/axi/axi2apb"
set RTL_PATH="${RTL_PATH}"

##############################################################################
# Preparing library
##############################################################################

echo "${Green}--> Compiling ${IP}... ${NC}"

rm -rf $LIB_PATH

vellib $LIB_PATH
velmap $LIB_NAME $LIB_PATH

##############################################################################
# Compiling RTL
##############################################################################

echo "${Green}Compiling component: ${Brown} axi2apb ${NC}"
echo "${Red}"
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}     ${IP_PATH}/AXI_2_APB.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}     ${IP_PATH}/AXI_2_APB_32.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}     ${IP_PATH}/axi2apb.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}     ${IP_PATH}/axi2apb32.sv || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
