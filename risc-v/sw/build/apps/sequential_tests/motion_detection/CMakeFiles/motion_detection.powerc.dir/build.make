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

# Utility rule file for motion_detection.powerc.

# Include the progress variables for this target.
include apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.powerc.dir/progress.make

apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.powerc:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running motion_detection in ModelSim (post layout)"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/motion_detection && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E remove stdout/*
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/motion_detection && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E remove FS/*
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/motion_detection && tcsh -c env\ VSIM_DIR=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/vsim\ USE_ZERO_RISCY=0\ RISCY_RV32F=0\ ZERO_RV32M=0\ ZERO_RV32E=0\ PL_NETLIST=\ TB_TEST=""\ /tools/med_tools/software/Questa/2020.4/questasim/bin/vsim\ \ -c\ -64\ -do\ 'source\ tcl_files/run_power.tcl\;\ run\ -a\;\ exit'

motion_detection.powerc: apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.powerc
motion_detection.powerc: apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.powerc.dir/build.make

.PHONY : motion_detection.powerc

# Rule to build all files generated by this target.
apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.powerc.dir/build: motion_detection.powerc

.PHONY : apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.powerc.dir/build

apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.powerc.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/motion_detection && $(CMAKE_COMMAND) -P CMakeFiles/motion_detection.powerc.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.powerc.dir/clean

apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.powerc.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/sequential_tests/motion_detection /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/motion_detection /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.powerc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/motion_detection/CMakeFiles/motion_detection.powerc.dir/depend
