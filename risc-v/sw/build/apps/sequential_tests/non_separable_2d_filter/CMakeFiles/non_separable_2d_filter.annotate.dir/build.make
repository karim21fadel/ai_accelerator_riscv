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

# Utility rule file for non_separable_2d_filter.annotate.

# Include the progress variables for this target.
include apps/sequential_tests/non_separable_2d_filter/CMakeFiles/non_separable_2d_filter.annotate.dir/progress.make

non_separable_2d_filter.annotate: apps/sequential_tests/non_separable_2d_filter/CMakeFiles/non_separable_2d_filter.annotate.dir/build.make
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/non_separable_2d_filter && /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/utils/annotate.py non_separable_2d_filter.read
.PHONY : non_separable_2d_filter.annotate

# Rule to build all files generated by this target.
apps/sequential_tests/non_separable_2d_filter/CMakeFiles/non_separable_2d_filter.annotate.dir/build: non_separable_2d_filter.annotate

.PHONY : apps/sequential_tests/non_separable_2d_filter/CMakeFiles/non_separable_2d_filter.annotate.dir/build

apps/sequential_tests/non_separable_2d_filter/CMakeFiles/non_separable_2d_filter.annotate.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/non_separable_2d_filter && $(CMAKE_COMMAND) -P CMakeFiles/non_separable_2d_filter.annotate.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/non_separable_2d_filter/CMakeFiles/non_separable_2d_filter.annotate.dir/clean

apps/sequential_tests/non_separable_2d_filter/CMakeFiles/non_separable_2d_filter.annotate.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/sequential_tests/non_separable_2d_filter /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/non_separable_2d_filter /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/non_separable_2d_filter/CMakeFiles/non_separable_2d_filter.annotate.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/non_separable_2d_filter/CMakeFiles/non_separable_2d_filter.annotate.dir/depend
