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

# Include any dependencies generated for this target.
include apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/depend.make

# Include the progress variables for this target.
include apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/flags.make

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/flags.make
apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o: ../apps/sequential_tests/matrixAdd/matrixAdd.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/matrixAdd && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o   -c /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/sequential_tests/matrixAdd/matrixAdd.c

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.i"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/matrixAdd && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/sequential_tests/matrixAdd/matrixAdd.c > CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.i

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.s"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/matrixAdd && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/sequential_tests/matrixAdd/matrixAdd.c -o CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.s

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o.requires:

.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o.requires

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o.provides: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o.requires
	$(MAKE) -f apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/build.make apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o.provides.build
.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o.provides

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o.provides.build: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o


# Object files for target matrixAdd8.elf
matrixAdd8_elf_OBJECTS = \
"CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o"

# External object files for target matrixAdd8.elf
matrixAdd8_elf_EXTERNAL_OBJECTS = \
"/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o
apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/build.make
apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf: libs/bench_lib/libbench.a
apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf: libs/string_lib/libstring.a
apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf: libs/sys_lib/libsys.a
apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable matrixAdd8/matrixAdd8.elf"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/matrixAdd && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/matrixAdd8.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/build: apps/sequential_tests/matrixAdd/matrixAdd8/matrixAdd8.elf

.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/build

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/requires: apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/matrixAdd.c.o.requires

.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/requires

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/matrixAdd && $(CMAKE_COMMAND) -P CMakeFiles/matrixAdd8.elf.dir/cmake_clean.cmake
.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/clean

apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/sequential_tests/matrixAdd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/matrixAdd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/sequential_tests/matrixAdd/CMakeFiles/matrixAdd8.elf.dir/depend

