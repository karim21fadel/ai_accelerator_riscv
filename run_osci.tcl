onerror exit

### START OF SCRIPT ###

set Emulator $::env(Emulator)
puts "Emulator is $Emulator"

# Turn xwave on only if Codelink is enabled. 
if {[info exists ::env(CODELINK_ENABLE)]} {
    if { $env(CODELINK_ENABLE) == "1"} {
        puts "Codelink enabled. Turning xwave on..."
        xwave on
        xwave select_all_groups
    }
}

memory init -instance /Top/SOC/core_region_i/data_mem/sp_ram_i/mem -content_file src/slm_files/tcdm_bank0.slm -format verilogHex
memory init -instance /Top/SOC/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/mem -content_file src/slm_files/l2_stim.slm -format verilogHex

run
waitfor runcomplete
quit
