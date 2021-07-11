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
include apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/depend.make

# Include the progress variables for this target.
include apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/progress.make

# Include the compile flags for this target's objects.
include apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/flags.make

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o: apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/flags.make
apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o: ../apps/Arduino_tests/PWM_test/PWM_test.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/PWM_test && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o -c /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/Arduino_tests/PWM_test/PWM_test.cpp

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.i"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/PWM_test && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/Arduino_tests/PWM_test/PWM_test.cpp > CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.i

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.s"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/PWM_test && /med/pave360/tools/risc-v/setup/install/ri5cy_gnu_toolchain/bin/riscv32-unknown-elf-gcc $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/Arduino_tests/PWM_test/PWM_test.cpp -o CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.s

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o.requires:

.PHONY : apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o.requires

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o.provides: apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o.requires
	$(MAKE) -f apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/build.make apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o.provides.build
.PHONY : apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o.provides

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o.provides.build: apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o


# Object files for target PWM_test.elf
PWM_test_elf_OBJECTS = \
"CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o"

# External object files for target PWM_test.elf
PWM_test_elf_EXTERNAL_OBJECTS = \
"/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles/crt0.dir/ref/crt0.riscv.S.o"

apps/Arduino_tests/PWM_test/PWM_test.elf: apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o
apps/Arduino_tests/PWM_test/PWM_test.elf: CMakeFiles/crt0.dir/ref/crt0.riscv.S.o
apps/Arduino_tests/PWM_test/PWM_test.elf: apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/build.make
apps/Arduino_tests/PWM_test/PWM_test.elf: libs/Arduino_lib/separate_libs/libArduino_separate.a
apps/Arduino_tests/PWM_test/PWM_test.elf: libs/Arduino_lib/core_libs/libArduino_core.a
apps/Arduino_tests/PWM_test/PWM_test.elf: libs/bench_lib/libbench.a
apps/Arduino_tests/PWM_test/PWM_test.elf: libs/string_lib/libstring.a
apps/Arduino_tests/PWM_test/PWM_test.elf: libs/sys_lib/libsys.a
apps/Arduino_tests/PWM_test/PWM_test.elf: apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable PWM_test.elf"
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/PWM_test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/PWM_test.elf.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/build: apps/Arduino_tests/PWM_test/PWM_test.elf

.PHONY : apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/build

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/requires: apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/PWM_test.cpp.o.requires

.PHONY : apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/requires

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/clean:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/PWM_test && $(CMAKE_COMMAND) -P CMakeFiles/PWM_test.elf.dir/cmake_clean.cmake
.PHONY : apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/clean

apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/depend:
	cd /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/apps/Arduino_tests/PWM_test /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/PWM_test /home/mabdels/egc-med-heliopolis_training/ai_accelerator_riscv/risc-v/sw/build/apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/Arduino_tests/PWM_test/CMakeFiles/PWM_test.elf.dir/depend

