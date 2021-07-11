#!/bin/tcsh

if (! $?VSIM_PATH ) then
  setenv VSIM_PATH      `pwd`
endif

if (! $?PULP_PATH ) then
  setenv PULP_PATH      `pwd`/src/hdl/risc-v
endif

setenv MSIM_LIBS_PATH ${VSIM_PATH}/modelsim_libs

setenv IPS_PATH ${PULP_PATH}/ips

source ${PULP_PATH}/veloce/vcompile.sim/colors.csh

echo ""
echo "${Green}--> Compiling zero-riscy core... ${NC}"

source ${PULP_PATH}/veloce/vcompile.sim/ips/vcompile_zero-riscy.csh || exit 1

echo "${Green}--> zero-riscy core compilation Complete! ${NC}"
echo ""
