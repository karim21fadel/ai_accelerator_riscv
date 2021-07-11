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

# Utility rule file for perfbench.conv2d.links.

# Include the progress variables for this target.
include apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links.dir/progress.make

apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links: apps/bench/conv2d/modelsim.ini
apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links: apps/bench/conv2d/work
apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links: apps/bench/conv2d/tcl_files
apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links: apps/bench/conv2d/waves


apps/bench/conv2d/modelsim.ini:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating modelsim.ini"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/conv2d && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E create_symlink /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/vsim/modelsim.ini /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/conv2d//modelsim.ini

apps/bench/conv2d/work:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating work"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/conv2d && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E create_symlink /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/vsim/work /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/conv2d//work

apps/bench/conv2d/tcl_files:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Generating tcl_files"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/conv2d && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E create_symlink /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/vsim/tcl_files /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/conv2d//tcl_files

apps/bench/conv2d/waves:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Generating waves"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/conv2d && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E create_symlink /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/vsim/waves /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/conv2d//waves

perfbench.conv2d.links: apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links
perfbench.conv2d.links: apps/bench/conv2d/modelsim.ini
perfbench.conv2d.links: apps/bench/conv2d/work
perfbench.conv2d.links: apps/bench/conv2d/tcl_files
perfbench.conv2d.links: apps/bench/conv2d/waves
perfbench.conv2d.links: apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links.dir/build.make

.PHONY : perfbench.conv2d.links

# Rule to build all files generated by this target.
apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links.dir/build: perfbench.conv2d.links

.PHONY : apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links.dir/build

apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/conv2d && $(CMAKE_COMMAND) -P CMakeFiles/perfbench.conv2d.links.dir/cmake_clean.cmake
.PHONY : apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links.dir/clean

apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/conv2d /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/conv2d /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/bench/conv2d/CMakeFiles/perfbench.conv2d.links.dir/depend

