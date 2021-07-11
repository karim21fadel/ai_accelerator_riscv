 Steps to run helloworld on RISC-V:
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=
$   source Env.script
$>  cd risc-v/sw/
$>  mkdir build
$>  cd build
$>  cp ../cmake_configure.riscv.gcc.sh .
$>  ./cmake_configure.riscv.gcc.sh
$>  make vcompile
$>  make helloworld.vsimc

Changes w.r.t pulpino-master:
=+=+=+=+=+=+=+=+=+=+=+=+=+=+=

 rtl/boot_code.sv
 rtl/components/sp_ram.sv
 Added:
   - vsim/vcompile/ips directory
   - vsim/verilator/verilator_compile.csh
   - vsim/tcl_files/config/vsim_ips.tcl

 CHANGES needed to port build system to VELOCE
  - veloce/*

 CHANGES needed to add a new automotive application
   - sw/apps/CMakeLists.txt
   - sw/apps/automotive/*

 CHANGES needed to add a CAN Controller to APB Bus
 CHANGES needed to add a DAC Register to APB Bus 
   - rtl/includes/apb_bus.sv
   - rtl/periph_bus_wrap.sv
   - rtl/peripherals.sv
   - vsim/vcompile/vcompile_ips.csh
   - vsim/vcompile/ips/vcompile_apb_dac.csh
   - vsim/tcl_files/config/vsim_ips.tcl
   - sw/libs/sys_lib/CMakeLists.txt

 CHANGES needed to add a CAN & DAC Sw Driver
   - sw/libs/sys_lib/inc/pulpino.h
   - sw/libs/sys_lib/src/can.c
   - sw/libs/sys_lib/src/dac.c
   - sw/libs/sys_lib/inc/can.h
   - sw/libs/sys_lib/inc/dac.h
   - sw/libs/sys_lib/src/int.c
   - sw/libs/sys_lib/inc/int.h
   - sw/ref/crt0.riscv.S
   - sw/ref/crt0.riscv_E.S

TB_HDL_FILES   = Top.sv
TB_HDL_DEFINES =

