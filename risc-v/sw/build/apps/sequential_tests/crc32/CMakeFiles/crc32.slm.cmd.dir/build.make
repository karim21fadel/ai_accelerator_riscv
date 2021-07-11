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

# Utility rule file for crc32.slm.cmd.

# Include the progress variables for this target.
include apps/sequential_tests/crc32/CMakeFiles/crc32.slm.cmd.dir/progress.make

apps/sequential_tests/crc32/CMakeFiles/crc32.slm.cmd: apps/sequential_tests/crc32/slm_files/l2_ram.slm


apps/sequential_tests/crc32/slm_files/l2_ram.slm: apps/sequential_tests/crc32/crc32.s19
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating slm_files/l2_ram.slm"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/crc32/slm_files && /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/utils/s19toslm.py ../crc32.s19
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/crc32/slm_files && /med/pave360/tools/risc-v/setup/install/cmake-3.10.0-Linux-x86_64/bin/cmake -E touch l2_ram.slm

apps/sequential_tests/crc32/crc32.s19: apps/sequential_tests/crc32/crc32.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating crc32.s19"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/crc32 && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-objcopy --srec-len 1 --output-target=srec /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/crc32/crc32.elf crc32.s19

crc32.slm.cmd: apps/sequential_tests/crc32/CMakeFiles/crc32.slm.cmd
crc32.slm.cmd: apps/sequential_tests/crc32/slm_files/l2_ram.slm
crc32.slm.cmd: apps/sequential_tests/crc32/crc32.s19
crc32.slm.cmd: apps/sequential_tests/crc32/CMakeFiles/crc32.slm.cmd.dir/build.make

.PHONY : crc32.slm.cmd

# Rule to build all files generated by this target.
apps/sequential_tests/crc32/CMakeFiles/crc32.slm.cmd.dir/build: crc32.slm.cmd

.PHONY : apps/sequential_tests/crc32/CMakeFiles/crc32.slm.cmd.dir/build

apps/sequential_tests/crc32/CMakeFiles/crc32.slm.cmd.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/crc32 && $(CMAKE_COMMAND) -P CMakeFiles/crc32.slm.cmd.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/crc32/CMakeFiles/crc32.slm.cmd.dir/clean

apps/sequential_tests/crc32/CMakeFiles/crc32.slm.cmd.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/sequential_tests/crc32 /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/crc32 /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/crc32/CMakeFiles/crc32.slm.cmd.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/crc32/CMakeFiles/crc32.slm.cmd.dir/depend

