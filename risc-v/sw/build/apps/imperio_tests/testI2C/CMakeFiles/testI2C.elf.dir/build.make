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
include apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/depend.make

# Include the progress variables for this target.
include apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/flags.make

apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o: apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/flags.make
apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o: ../apps/imperio_tests/testI2C/testI2C.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/imperio_tests/testI2C && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/testI2C.elf.dir/testI2C.c.o   -c /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/imperio_tests/testI2C/testI2C.c

apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/testI2C.elf.dir/testI2C.c.i"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/imperio_tests/testI2C && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/imperio_tests/testI2C/testI2C.c > CMakeFiles/testI2C.elf.dir/testI2C.c.i

apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/testI2C.elf.dir/testI2C.c.s"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/imperio_tests/testI2C && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/imperio_tests/testI2C/testI2C.c -o CMakeFiles/testI2C.elf.dir/testI2C.c.s

apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o.requires:

.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o.requires

apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o.provides: apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o.requires
	$(MAKE) -f apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/build.make apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o.provides.build
.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o.provides

apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o.provides.build: apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o


# Object files for target testI2C.elf
testI2C_elf_OBJECTS = \
"CMakeFiles/testI2C.elf.dir/testI2C.c.o"

# External object files for target testI2C.elf
testI2C_elf_EXTERNAL_OBJECTS = \
"/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/imperio_tests/testI2C/testI2C.elf: apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o
apps/imperio_tests/testI2C/testI2C.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/imperio_tests/testI2C/testI2C.elf: apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/build.make
apps/imperio_tests/testI2C/testI2C.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/imperio_tests/testI2C/testI2C.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/imperio_tests/testI2C/testI2C.elf: libs/bench_lib/libbench.a
apps/imperio_tests/testI2C/testI2C.elf: libs/string_lib/libstring.a
apps/imperio_tests/testI2C/testI2C.elf: libs/sys_lib/libsys.a
apps/imperio_tests/testI2C/testI2C.elf: apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable testI2C.elf"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/imperio_tests/testI2C && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/testI2C.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/build: apps/imperio_tests/testI2C/testI2C.elf

.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/build

apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/requires: apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/testI2C.c.o.requires

.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/requires

apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/imperio_tests/testI2C && $(CMAKE_COMMAND) -P CMakeFiles/testI2C.elf.dir/cmake_clean.cmake
.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/clean

apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/imperio_tests/testI2C /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/imperio_tests/testI2C /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/imperio_tests/testI2C/CMakeFiles/testI2C.elf.dir/depend

