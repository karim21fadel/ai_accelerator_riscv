# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake

# The command to remove a file.
RM = /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build

# Utility rule file for perfbench.fft.vsim.boot.

# Include the progress variables for this target.
include apps/bench/fft/CMakeFiles/perfbench.fft.vsim.boot.dir/progress.make

apps/bench/fft/CMakeFiles/perfbench.fft.vsim.boot:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running perfbench.fft in ModelSim"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fft && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E remove stdout/*
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fft && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E remove FS/*
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fft && tcsh -c env\ VSIM_DIR=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/vsim\ USE_ZERO_RISCY=0\ RISCY_RV32F=0\ ZERO_RV32M=0\ ZERO_RV32E=0\ PL_NETLIST=\ TB_TEST=""\ /tools/med_tools/software/Questa/2020.4/questasim/bin/vsim\ \ -64\ -do\ 'source\ tcl_files/run_boot.tcl\;'

perfbench.fft.vsim.boot: apps/bench/fft/CMakeFiles/perfbench.fft.vsim.boot
perfbench.fft.vsim.boot: apps/bench/fft/CMakeFiles/perfbench.fft.vsim.boot.dir/build.make

.PHONY : perfbench.fft.vsim.boot

# Rule to build all files generated by this target.
apps/bench/fft/CMakeFiles/perfbench.fft.vsim.boot.dir/build: perfbench.fft.vsim.boot

.PHONY : apps/bench/fft/CMakeFiles/perfbench.fft.vsim.boot.dir/build

apps/bench/fft/CMakeFiles/perfbench.fft.vsim.boot.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fft && $(CMAKE_COMMAND) -P CMakeFiles/perfbench.fft.vsim.boot.dir/cmake_clean.cmake
.PHONY : apps/bench/fft/CMakeFiles/perfbench.fft.vsim.boot.dir/clean

apps/bench/fft/CMakeFiles/perfbench.fft.vsim.boot.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fft /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fft /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fft/CMakeFiles/perfbench.fft.vsim.boot.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/bench/fft/CMakeFiles/perfbench.fft.vsim.boot.dir/depend

