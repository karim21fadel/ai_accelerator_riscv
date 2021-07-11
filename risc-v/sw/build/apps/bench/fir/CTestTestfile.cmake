# CMake generated Testfile for 
# Source directory: /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fir
# Build directory: /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(perfbench.fir.test "tcsh" "-c" "env VSIM_DIR=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/vsim USE_ZERO_RISCY=0 RISCY_RV32F=0 ZERO_RV32M=0 ZERO_RV32E=0 PL_NETLIST= TB_TEST=\"\" /tools/med_tools/software/Questa/2020.4/questasim/bin/vsim  -c -64 -do 'source tcl_files/run.tcl; run_and_exit;'")
set_tests_properties(perfbench.fir.test PROPERTIES  LABELS "perfbench" WORKING_DIRECTORY "/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir/")
