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
include apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/depend.make

# Include the progress variables for this target.
include apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/flags.make

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/flags.make
apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o: ../apps/bench/fdctfst/fdctfst.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fdctfst && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o   -c /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fdctfst/fdctfst.c

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.i"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fdctfst && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fdctfst/fdctfst.c > CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.i

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.s"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fdctfst && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fdctfst/fdctfst.c -o CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.s

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o.requires:

.PHONY : apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o.requires

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o.provides: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o.requires
	$(MAKE) -f apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/build.make apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o.provides.build
.PHONY : apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o.provides

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o.provides.build: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o


apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/flags.make
apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o: ../apps/bench/fdctfst/fdctfst_test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fdctfst && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o   -c /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fdctfst/fdctfst_test.c

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.i"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fdctfst && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fdctfst/fdctfst_test.c > CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.i

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.s"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fdctfst && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fdctfst/fdctfst_test.c -o CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.s

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o.requires:

.PHONY : apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o.requires

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o.provides: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o.requires
	$(MAKE) -f apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/build.make apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o.provides.build
.PHONY : apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o.provides

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o.provides.build: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o


# Object files for target perfbench.fdctfst.elf
perfbench_fdctfst_elf_OBJECTS = \
"CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o" \
"CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o"

# External object files for target perfbench.fdctfst.elf
perfbench_fdctfst_elf_EXTERNAL_OBJECTS = \
"/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/bench/fdctfst/perfbench.fdctfst.elf: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o
apps/bench/fdctfst/perfbench.fdctfst.elf: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o
apps/bench/fdctfst/perfbench.fdctfst.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/bench/fdctfst/perfbench.fdctfst.elf: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/build.make
apps/bench/fdctfst/perfbench.fdctfst.elf: apps/bench/libperfbench.core.a
apps/bench/fdctfst/perfbench.fdctfst.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/bench/fdctfst/perfbench.fdctfst.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/bench/fdctfst/perfbench.fdctfst.elf: libs/bench_lib/libbench.a
apps/bench/fdctfst/perfbench.fdctfst.elf: libs/string_lib/libstring.a
apps/bench/fdctfst/perfbench.fdctfst.elf: libs/sys_lib/libsys.a
apps/bench/fdctfst/perfbench.fdctfst.elf: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable perfbench.fdctfst.elf"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fdctfst && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/perfbench.fdctfst.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/build: apps/bench/fdctfst/perfbench.fdctfst.elf

.PHONY : apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/build

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/requires: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst.c.o.requires
apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/requires: apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/fdctfst_test.c.o.requires

.PHONY : apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/requires

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fdctfst && $(CMAKE_COMMAND) -P CMakeFiles/perfbench.fdctfst.elf.dir/cmake_clean.cmake
.PHONY : apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/clean

apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fdctfst /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fdctfst /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/bench/fdctfst/CMakeFiles/perfbench.fdctfst.elf.dir/depend

