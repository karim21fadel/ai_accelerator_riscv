#!/bin/tcsh
source ${PULP_PATH}/veloce/vcompile.emu/colors.csh

##############################################################################
# Settings
##############################################################################

set IP=pulpino
set IP_NAME="PULPino"


##############################################################################
# Check settings
##############################################################################

# check if environment variables are defined
if (! $?MSIM_LIBS_PATH ) then
  echo "${Red} MSIM_LIBS_PATH is not defined ${NC}"
  exit 1
endif

if (! $?RTL_PATH ) then
  echo "${Red} RTL_PATH is not defined ${NC}"
  exit 1
endif

# If this variable is not explicitly set, set CAN error injection to 0 by default.
if (! $?CAN_ERROR_INJECTED ) then
    set CAN_ERROR_INJECTED=0
endif

if ( $CAN_ERROR_INJECTED == 1 ) then
    set ERROR_INJECTION_DEF=+define+CAN_RX_ERROR_INJECTED
else
    set ERROR_INJECTION_DEF=
endif

set LIB_NAME="${IP}_lib"
set LIB_PATH="${MSIM_LIBS_PATH}/${LIB_NAME}"

##############################################################################
# Preparing library
##############################################################################

echo "${Green}--> Compiling ${IP_NAME}... ${NC}"

rm -rf $LIB_PATH

vellib $LIB_PATH
velmap $LIB_NAME $LIB_PATH

echo "${Green}Compiling component: ${Brown} ${IP_NAME} ${NC}"
echo "${Red}"

##############################################################################
# Compiling RTL
##############################################################################

# decide if we want to build for riscv or or1k
if ( ! $?PULP_CORE) then
  set PULP_CORE="riscv"
endif

if ( $PULP_CORE == "riscv" ) then
  set CORE_DEFINES=+define+RISCV
  echo "${Yellow} Compiling for RISCV core ${NC}"
else
  set CORE_DEFINES=+define+OR10N
  echo "${Yellow} Compiling for OR10N core ${NC}"
endif

# decide if we want to build for riscv or or1k
if ( ! $?ASIC_DEFINES) then
  set ASIC_DEFINES=""
endif

# components
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} ${RTL_PATH}/components/cluster_clock_gating.sv    || goto error
velanalyze -hdl verilog -sv -quiet -sv -work ${LIB_PATH} ${RTL_PATH}/components/pulp_clock_gating.sv       || goto error
velanalyze -hdl verilog -sv -quiet -sv -work ${LIB_PATH} ${RTL_PATH}/components/cluster_clock_inverter.sv  || goto error
velanalyze -hdl verilog -sv -quiet -sv -work ${LIB_PATH} ${RTL_PATH}/components/cluster_clock_mux2.sv      || goto error
velanalyze -hdl verilog -sv -quiet -sv -work ${LIB_PATH} ${RTL_PATH}/components/pulp_clock_inverter.sv     || goto error
velanalyze -hdl verilog -sv -quiet -sv -work ${LIB_PATH} ${RTL_PATH}/components/pulp_clock_mux2.sv         || goto error
velanalyze -hdl verilog -sv -quiet -sv -work ${LIB_PATH} ${RTL_PATH}/components/generic_fifo.sv            || goto error
velanalyze -hdl verilog -sv -quiet -sv -work ${LIB_PATH} ${RTL_PATH}/components/rstgen.sv                  || goto error
velanalyze -hdl verilog -sv -quiet -sv -work ${LIB_PATH} ${RTL_PATH}/components/sp_ram.sv                  || goto error


# files depending on RISCV vs. OR1K

velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/mcan2_state.v     || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s006fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s001fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s002fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${ERROR_INJECTION_DEF} ${RTL_PATH}/can/m3s003fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s004fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s005fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s007fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s008fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s009fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s010fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s011fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s012fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s013fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s014fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/m3s015fg.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/mcan2.v           || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/mcan2_io.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/apb2pvci.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/ahb2pvci.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/mcan2_ahb_pvci_wrapper.v        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/can/mcan2_apb_pvci_wrapper.v  || goto error

velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/core_region.sv        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/random_stalls.sv      || goto error

velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/boot_rom_wrap.sv      || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/boot_code.sv          || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/instr_ram_wrap.sv     || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/sp_ram_wrap.sv        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/ram_mux.sv            || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/axi_node_intf_wrap.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/pulpino_top.sv        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/peripherals.sv        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/periph_bus_wrap.sv    || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/axi2apb_wrap.sv       || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/axi_spi_slave_wrap.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/axi_mem_if_SP_wrap.sv || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/clk_rst_gen.sv        || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/axi_slice_wrap.sv     || goto error
velanalyze -hdl verilog -sv -quiet -work ${LIB_PATH} +incdir+${RTL_PATH}/includes ${ASIC_DEFINES} ${CORE_DEFINES} ${RTL_PATH}/core2axi_wrap.sv      || goto error

echo "${Cyan}--> ${IP_NAME} compilation complete! ${NC}"
exit 0

##############################################################################
# Error handler
##############################################################################

error:
echo "${NC}"
exit 1
