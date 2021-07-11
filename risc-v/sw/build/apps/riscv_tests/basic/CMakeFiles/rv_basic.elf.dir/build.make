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
include apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/depend.make

# Include the progress variables for this target.
include apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/flags.make

apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o: apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/flags.make
apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o: ../apps/riscv_tests/basic/basic.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/basic && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/rv_basic.elf.dir/basic.c.o   -c /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/riscv_tests/basic/basic.c

apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/rv_basic.elf.dir/basic.c.i"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/basic && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/riscv_tests/basic/basic.c > CMakeFiles/rv_basic.elf.dir/basic.c.i

apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/rv_basic.elf.dir/basic.c.s"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/basic && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/riscv_tests/basic/basic.c -o CMakeFiles/rv_basic.elf.dir/basic.c.s

apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o.requires:

.PHONY : apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o.requires

apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o.provides: apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o.requires
	$(MAKE) -f apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/build.make apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o.provides.build
.PHONY : apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o.provides

apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o.provides.build: apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o


# Object files for target rv_basic.elf
rv_basic_elf_OBJECTS = \
"CMakeFiles/rv_basic.elf.dir/basic.c.o"

# External object files for target rv_basic.elf
rv_basic_elf_EXTERNAL_OBJECTS = \
"/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/riscv_tests/basic/rv_basic.elf: apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o
apps/riscv_tests/basic/rv_basic.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/riscv_tests/basic/rv_basic.elf: apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/build.make
apps/riscv_tests/basic/rv_basic.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/riscv_tests/basic/rv_basic.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/riscv_tests/basic/rv_basic.elf: libs/bench_lib/libbench.a
apps/riscv_tests/basic/rv_basic.elf: libs/string_lib/libstring.a
apps/riscv_tests/basic/rv_basic.elf: libs/sys_lib/libsys.a
apps/riscv_tests/basic/rv_basic.elf: apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable rv_basic.elf"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/basic && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/rv_basic.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/build: apps/riscv_tests/basic/rv_basic.elf

.PHONY : apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/build

apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/requires: apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/basic.c.o.requires

.PHONY : apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/requires

apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/basic && $(CMAKE_COMMAND) -P CMakeFiles/rv_basic.elf.dir/cmake_clean.cmake
.PHONY : apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/clean

apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/riscv_tests/basic /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/basic /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/riscv_tests/basic/CMakeFiles/rv_basic.elf.dir/depend

