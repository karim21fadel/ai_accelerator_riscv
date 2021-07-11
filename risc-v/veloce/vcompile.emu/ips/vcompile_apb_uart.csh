#!/bin/tcsh
source ${PULP_PATH}/veloce/vcompile.emu/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=apb_uart

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
set IP_PATH="${IPS_PATH}/apb/apb_uart"
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

echo "${Green}Compiling component: ${Brown} apb_uart ${NC}"
echo "${Red}"
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/apb_uart.vhd || goto error
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/slib_clock_div.vhd || goto error
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/slib_counter.vhd || goto error
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/slib_edge_detect.vhd || goto error
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/slib_fifo.vhd || goto error
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/slib_input_filter.vhd || goto error
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/slib_input_sync.vhd || goto error
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/slib_mv_filter.vhd || goto error
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/uart_baudgen.vhd || goto error
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/uart_interrupt.vhd || goto error
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/uart_receiver.vhd || goto error
velanalyze -hdl vhdl -quiet -work ${LIB_NAME}   ${IP_PATH}/uart_transmitter.vhd || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
