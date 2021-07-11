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

# Utility rule file for testVecCmp.stim.txt.

# Include the progress variables for this target.
include apps/riscv_tests/testVecCmp/CMakeFiles/testVecCmp.stim.txt.dir/progress.make

apps/riscv_tests/testVecCmp/CMakeFiles/testVecCmp.stim.txt: apps/riscv_tests/testVecCmp/vectors/stim.txt


apps/riscv_tests/testVecCmp/vectors/stim.txt: apps/riscv_tests/testVecCmp/testVecCmp.s19
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating vectors/stim.txt"

apps/riscv_tests/testVecCmp/testVecCmp.s19: apps/riscv_tests/testVecCmp/testVecCmp.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating testVecCmp.s19"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/testVecCmp && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-objcopy --srec-len 1 --output-target=srec /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/testVecCmp/testVecCmp.elf testVecCmp.s19

testVecCmp.stim.txt: apps/riscv_tests/testVecCmp/CMakeFiles/testVecCmp.stim.txt
testVecCmp.stim.txt: apps/riscv_tests/testVecCmp/vectors/stim.txt
testVecCmp.stim.txt: apps/riscv_tests/testVecCmp/testVecCmp.s19
testVecCmp.stim.txt: apps/riscv_tests/testVecCmp/CMakeFiles/testVecCmp.stim.txt.dir/build.make

.PHONY : testVecCmp.stim.txt

# Rule to build all files generated by this target.
apps/riscv_tests/testVecCmp/CMakeFiles/testVecCmp.stim.txt.dir/build: testVecCmp.stim.txt

.PHONY : apps/riscv_tests/testVecCmp/CMakeFiles/testVecCmp.stim.txt.dir/build

apps/riscv_tests/testVecCmp/CMakeFiles/testVecCmp.stim.txt.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/testVecCmp && $(CMAKE_COMMAND) -P CMakeFiles/testVecCmp.stim.txt.dir/cmake_clean.cmake
.PHONY : apps/riscv_tests/testVecCmp/CMakeFiles/testVecCmp.stim.txt.dir/clean

apps/riscv_tests/testVecCmp/CMakeFiles/testVecCmp.stim.txt.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/riscv_tests/testVecCmp /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/testVecCmp /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/testVecCmp/CMakeFiles/testVecCmp.stim.txt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/riscv_tests/testVecCmp/CMakeFiles/testVecCmp.stim.txt.dir/depend

