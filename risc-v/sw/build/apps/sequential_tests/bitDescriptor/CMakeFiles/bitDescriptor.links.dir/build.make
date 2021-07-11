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

# Utility rule file for bitDescriptor.links.

# Include the progress variables for this target.
include apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links.dir/progress.make

apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links: apps/sequential_tests/bitDescriptor/modelsim.ini
apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links: apps/sequential_tests/bitDescriptor/work
apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links: apps/sequential_tests/bitDescriptor/tcl_files
apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links: apps/sequential_tests/bitDescriptor/waves


apps/sequential_tests/bitDescriptor/modelsim.ini:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating modelsim.ini"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/bitDescriptor && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E create_symlink /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/vsim/modelsim.ini /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/bitDescriptor//modelsim.ini

apps/sequential_tests/bitDescriptor/work:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating work"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/bitDescriptor && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E create_symlink /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/vsim/work /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/bitDescriptor//work

apps/sequential_tests/bitDescriptor/tcl_files:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating tcl_files"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/bitDescriptor && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E create_symlink /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/vsim/tcl_files /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/bitDescriptor//tcl_files

apps/sequential_tests/bitDescriptor/waves:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating waves"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/bitDescriptor && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E create_symlink /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/vsim/waves /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/bitDescriptor//waves

bitDescriptor.links: apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links
bitDescriptor.links: apps/sequential_tests/bitDescriptor/modelsim.ini
bitDescriptor.links: apps/sequential_tests/bitDescriptor/work
bitDescriptor.links: apps/sequential_tests/bitDescriptor/tcl_files
bitDescriptor.links: apps/sequential_tests/bitDescriptor/waves
bitDescriptor.links: apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links.dir/build.make

.PHONY : bitDescriptor.links

# Rule to build all files generated by this target.
apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links.dir/build: bitDescriptor.links

.PHONY : apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links.dir/build

apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/bitDescriptor && $(CMAKE_COMMAND) -P CMakeFiles/bitDescriptor.links.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links.dir/clean

apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/sequential_tests/bitDescriptor /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/bitDescriptor /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/bitDescriptor/CMakeFiles/bitDescriptor.links.dir/depend
