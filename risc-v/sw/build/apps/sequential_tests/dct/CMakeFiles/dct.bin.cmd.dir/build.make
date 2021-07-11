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

# Utility rule file for dct.bin.cmd.

# Include the progress variables for this target.
include apps/sequential_tests/dct/CMakeFiles/dct.bin.cmd.dir/progress.make

apps/sequential_tests/dct/CMakeFiles/dct.bin.cmd: apps/sequential_tests/dct/dct.bin


apps/sequential_tests/dct/dct.bin: apps/sequential_tests/dct/dct.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating dct.bin"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/dct && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-objcopy -R .debug_frame -R .comment -R .stack -R .heapsram -R .heapscm -R .scmlock -O binary /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/dct/dct.elf dct.bin

dct.bin.cmd: apps/sequential_tests/dct/CMakeFiles/dct.bin.cmd
dct.bin.cmd: apps/sequential_tests/dct/dct.bin
dct.bin.cmd: apps/sequential_tests/dct/CMakeFiles/dct.bin.cmd.dir/build.make

.PHONY : dct.bin.cmd

# Rule to build all files generated by this target.
apps/sequential_tests/dct/CMakeFiles/dct.bin.cmd.dir/build: dct.bin.cmd

.PHONY : apps/sequential_tests/dct/CMakeFiles/dct.bin.cmd.dir/build

apps/sequential_tests/dct/CMakeFiles/dct.bin.cmd.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/dct && $(CMAKE_COMMAND) -P CMakeFiles/dct.bin.cmd.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/dct/CMakeFiles/dct.bin.cmd.dir/clean

apps/sequential_tests/dct/CMakeFiles/dct.bin.cmd.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/sequential_tests/dct /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/dct /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/dct/CMakeFiles/dct.bin.cmd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/dct/CMakeFiles/dct.bin.cmd.dir/depend

