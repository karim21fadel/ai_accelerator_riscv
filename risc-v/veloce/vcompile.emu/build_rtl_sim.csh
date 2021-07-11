#!/bin/tcsh

if (! $?VSIM_PATH ) then
  setenv VSIM_PATH      `pwd`
endif

if (! $?PULP_PATH ) then
  setenv PULP_PATH      `pwd`/risc-v
endif

setenv MSIM_LIBS_PATH ${VSIM_PATH}/modelsim_libs

setenv IPS_PATH       ${PULP_PATH}/ips
setenv RTL_PATH       ${PULP_PATH}/rtl
setenv TB_PATH        ${PULP_PATH}/tb

clear
source ${PULP_PATH}/veloce/vcompile.emu/colors.csh

rm -rf modelsim_libs

echo ""
echo "${Green}--> Compiling PULPino Platform... ${NC}"
echo ""

# IP blocks
source ${PULP_PATH}/veloce/vcompile.emu/vcompile_ips.csh  || exit 1

source ${PULP_PATH}/veloce/vcompile.emu/rtl/vcompile_pulpino.sh  || exit 1

echo ""
echo ""
echo "${Green}--> PULPino Codelink installed! ${NC}"
echo ""

if (  $?CODELINK_ENABLE ) then
source ${PULP_PATH}/codelink_monitor/vcompile_codelink.csh    || exit 1
endif

echo ""
echo "${Green}--> PULPino platform compilation complete! ${NC}"
echo ""
