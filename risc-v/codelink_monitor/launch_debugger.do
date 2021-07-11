#
# Codelink Debugger Automated Launcher
#
# Automatically launches codelink, tidys up vsim windows and opens common windows
#


# Disable all non-coding windows
#view library
noview library
noview objects
noview processes

# Start debugger automatically
echo ========================== Launching Codelink Debugger
codelink launch

# WaitForCodelinkLaunchComplete
cdlBlockTillCommandDone
echo ========================== Launch complete, setting new folders for code


# Change root paths for code compiled in another location
#codelink debugger reset source root /some/path/to/your/moved/include/folder ./actual/path/in/elf/include
#eg. codelink debugger reset source root /disk1/patterns/shared/include/ ./inc

# This also works, and allows for more than one path - 
codelink debugger set source path -clear
codelink debugger set source path ./src/hdl/risc-v/sw/apps/automotive ./src/hdl/risc-v/sw/libs/sys_lib/inc ./src/hdl/risc-v/sw/libs/sys_lib/src

cdlBlockTillCommandDone

# Open CPU Registers window
codelink debugger open window Registers
cdlBlockTillCommandDone

# Import Custom-CPU printf over-rides
source RISCV_SimPrintf.tcl

# Set printf breakpoint
codelink debugger -cpu_label riscv_core  set breakpoint -symbol {puts} -continue -silent -always {sim_printf riscv_core}

do debug_signals.do
do breakpoints.do