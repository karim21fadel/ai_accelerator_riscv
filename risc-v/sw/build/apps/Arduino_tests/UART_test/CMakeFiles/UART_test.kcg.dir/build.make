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

# Utility rule file for UART_test.kcg.

# Include the progress variables for this target.
include apps/Arduino_tests/UART_test/CMakeFiles/UART_test.kcg.dir/progress.make

apps/Arduino_tests/UART_test/CMakeFiles/UART_test.kcg:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/UART_test && pulp-pc-analyze --rtl --input=trace_core_00.log --binary=UART_test.elf
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/UART_test && kcachegrind kcg.txt

UART_test.kcg: apps/Arduino_tests/UART_test/CMakeFiles/UART_test.kcg
UART_test.kcg: apps/Arduino_tests/UART_test/CMakeFiles/UART_test.kcg.dir/build.make

.PHONY : UART_test.kcg

# Rule to build all files generated by this target.
apps/Arduino_tests/UART_test/CMakeFiles/UART_test.kcg.dir/build: UART_test.kcg

.PHONY : apps/Arduino_tests/UART_test/CMakeFiles/UART_test.kcg.dir/build

apps/Arduino_tests/UART_test/CMakeFiles/UART_test.kcg.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/UART_test && $(CMAKE_COMMAND) -P CMakeFiles/UART_test.kcg.dir/cmake_clean.cmake
.PHONY : apps/Arduino_tests/UART_test/CMakeFiles/UART_test.kcg.dir/clean

apps/Arduino_tests/UART_test/CMakeFiles/UART_test.kcg.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/Arduino_tests/UART_test /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/UART_test /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/UART_test/CMakeFiles/UART_test.kcg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/Arduino_tests/UART_test/CMakeFiles/UART_test.kcg.dir/depend

