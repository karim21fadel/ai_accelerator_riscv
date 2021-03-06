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
include apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/depend.make

# Include the progress variables for this target.
include apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/flags.make

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/flags.make
apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o: ../apps/bench/fir/fir.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/perfbench.fir.elf.dir/fir.c.o   -c /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fir/fir.c

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/perfbench.fir.elf.dir/fir.c.i"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fir/fir.c > CMakeFiles/perfbench.fir.elf.dir/fir.c.i

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/perfbench.fir.elf.dir/fir.c.s"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fir/fir.c -o CMakeFiles/perfbench.fir.elf.dir/fir.c.s

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o.requires:

.PHONY : apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o.requires

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o.provides: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o.requires
	$(MAKE) -f apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/build.make apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o.provides.build
.PHONY : apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o.provides

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o.provides.build: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o


apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/flags.make
apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o: ../apps/bench/fir/fir_test.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o   -c /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fir/fir_test.c

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/perfbench.fir.elf.dir/fir_test.c.i"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fir/fir_test.c > CMakeFiles/perfbench.fir.elf.dir/fir_test.c.i

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/perfbench.fir.elf.dir/fir_test.c.s"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fir/fir_test.c -o CMakeFiles/perfbench.fir.elf.dir/fir_test.c.s

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o.requires:

.PHONY : apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o.requires

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o.provides: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o.requires
	$(MAKE) -f apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/build.make apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o.provides.build
.PHONY : apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o.provides

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o.provides.build: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o


# Object files for target perfbench.fir.elf
perfbench_fir_elf_OBJECTS = \
"CMakeFiles/perfbench.fir.elf.dir/fir.c.o" \
"CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o"

# External object files for target perfbench.fir.elf
perfbench_fir_elf_EXTERNAL_OBJECTS = \
"/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/bench/fir/perfbench.fir.elf: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o
apps/bench/fir/perfbench.fir.elf: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o
apps/bench/fir/perfbench.fir.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/bench/fir/perfbench.fir.elf: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/build.make
apps/bench/fir/perfbench.fir.elf: apps/bench/libperfbench.core.a
apps/bench/fir/perfbench.fir.elf: apps/bench/libperfbench.extras.a
apps/bench/fir/perfbench.fir.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/bench/fir/perfbench.fir.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/bench/fir/perfbench.fir.elf: libs/bench_lib/libbench.a
apps/bench/fir/perfbench.fir.elf: libs/string_lib/libstring.a
apps/bench/fir/perfbench.fir.elf: libs/sys_lib/libsys.a
apps/bench/fir/perfbench.fir.elf: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable perfbench.fir.elf"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/perfbench.fir.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/build: apps/bench/fir/perfbench.fir.elf

.PHONY : apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/build

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/requires: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir.c.o.requires
apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/requires: apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/fir_test.c.o.requires

.PHONY : apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/requires

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir && $(CMAKE_COMMAND) -P CMakeFiles/perfbench.fir.elf.dir/cmake_clean.cmake
.PHONY : apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/clean

apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/bench/fir /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/bench/fir/CMakeFiles/perfbench.fir.elf.dir/depend

