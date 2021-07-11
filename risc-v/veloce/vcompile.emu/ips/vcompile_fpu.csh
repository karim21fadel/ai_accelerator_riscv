#!/bin/tcsh
source ${PULP_PATH}/veloce/vcompile.emu/setup.csh

##############################################################################
# Settings
##############################################################################

set IP=fpu

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
set IP_PATH="${IPS_PATH}/fpu"
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

echo "${Green}Compiling component: ${Brown} fpu ${NC}"
echo "${Red}"
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_utils/fpu_ff.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_v0.1/fpu_defs.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_v0.1/fpexc.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_v0.1/fpu_add.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_v0.1/fpu_core.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_v0.1/fpu_ftoi.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_v0.1/fpu_itof.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_v0.1/fpu_mult.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_v0.1/fpu_norm.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_v0.1/fpu_private.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_v0.1/riscv_fpu.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_v0.1/fp_fma_wrapper.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_div_sqrt_tp_nlp/fpu_defs_div_sqrt_tp.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_div_sqrt_tp_nlp/control_tp.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_div_sqrt_tp_nlp/fpu_norm_div_sqrt.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_div_sqrt_tp_nlp/iteration_div_sqrt_first.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_div_sqrt_tp_nlp/iteration_div_sqrt.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_div_sqrt_tp_nlp/nrbd_nrsc_tp.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_div_sqrt_tp_nlp/preprocess.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_div_sqrt_tp_nlp/div_sqrt_top_tp.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/fpu_defs_fmac.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/preprocess_fmac.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/booth_encoder.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/booth_selector.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/pp_generation.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/wallace.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/aligner.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/CSA.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/adders.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/LZA.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/fpu_norm_fmac.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH}    +incdir+${IP_PATH}/. ${IP_PATH}/hdl/fpu_fmac/fmac.sv || goto error

echo "${Cyan}--> ${IP} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
