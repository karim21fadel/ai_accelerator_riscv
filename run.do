mem load -infile src/slm_files/tcdm_bank0.slm -format hex /Top/SOC/core_region_i/data_mem/sp_ram_i/mem
mem load -infile src/slm_files/l2_stim.slm -format hex /Top/SOC/core_region_i/instr_mem/sp_ram_wrap_i/sp_ram_i/mem

# Log wave data only if Codelink is enabled. 
if {[info exists env(CODELINK_ENABLE)]} {
    if { $env(CODELINK_ENABLE) == "1"} {
        log -r /*;
    }
}

# Uncomment this for debugging in puresim mode if Codelink is disabled.
# log -r /*;
run -all; quit;

