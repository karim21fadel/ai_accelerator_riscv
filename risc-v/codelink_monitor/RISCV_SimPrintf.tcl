###########################################################################
#  
#                 Copyright (c) Mentor Graphics Corporation 2018
#  
#                          All Rights Reserved.
#  
#                     THIS WORK CONTAINS TRADE SECRET AND
#                 PROPRIETARY INFORMATION WHICH IS THE PROPERTY
#                    OF MENTOR GRAPHICS CORPORATION OR ITS
#                  LICENSORS AND IS SUBJECT TO LICENSE TERMS.
#
#############################################################################
#
# File: RISCV_SimPrintf.tcl
# Author: Lucien Murray-Pitts
# Description: RISCV ABI support for Dynamic Printf functionality for the Codelink Debugger
#
#############################################################################


# Override the $CODELINK_HOME/questa_debugger/lib/userware/codelink/cdldbg.tcl function cdlGetArgRegName
#
# description: Gets the register name for the parameter number, upto the point of a switch to Stack memory
# * arg_index : 0..N for the printf arguments
# * cpu_inst  : Instance name of the CPU
#
proc cdlGetArgRegName {arg_index cpu_inst} {
    global cdlGlobals

    set retValue ""
    set arch [cdlr_GetProcType $cpu_inst]

    # Register Names as extracted from XML, expects them to be in logical order
    #
    # FIXME: Slow to do this every arg (cache it), 
    # FIXME: also dangerous if index isnt in expected order X0->X1 but some fny order
    set _RISCV_REGISTER_LIST [cdlGetRegisterNames $cpu_inst]

    switch -regex $arch {
	mips {
                        set retValue "A$arg_index"
	}
	arm {
	    if {[cdlGetPcAttr $cpu_inst "width"] > 32} {
                                set retValue "XA$arg_index"
	    } else {
                                set retValue "XB$arg_index"
	    }
	}
	generic {
	    # Param index 0,1,2...., RISC-V calling convention is X10,11,12...17;, SP+(N-7)

	    # NOTE: Arg Index + 10 -> X10, but our list is PC, X0... so +1 again
	    set regNr [expr {$arg_index+10+1}]
	    set regName [lindex $_RISCV_REGISTER_LIST $regNr]
	    #set retValue "X$regNr"
	    set retValue "$regName"
	}
	default {
	    set retValue "X$arg_index"
	}
    }
        return $retValue
}

# Override the $CODELINK_HOME/questa_debugger/lib/userware/codelink/cdl_dprintf.tcl_ function for ABI decoding
#
# description: Gets the value of the parameter N for a printf funtion, internally the CPUs ABI must be understood
# * r         :  printf argument 0..N
# * reg_width :  width of register, 8 or 4
#
body cdl::dprintf::get_arg {r reg_width} {

    #FIXME: Needs work, however this is bare-minimum to fit basic ABI convenction of RISCV calling convention
    #       I epxect there is an issue when mixing int/long long types, and floating FAInn/Xnn registers are used
    #       along with XXX( int, long long ) resulting in X10=int, X11=unused, X12/13=long long
    #
    if {$reg_width == 8} {
        if { $r < 8} {
    	    set argreg "X$r"
            set data [codelink debug get register -cpu $instance_id $argreg]
            putsd "ARGWIDE: $argreg $data"
            return $data
        } else {
            set addr [expr {[codelink debug get register -cpu $instance_id SP] + (($r - 8) * 8)}]
            set data [get_memory_wide $addr]
            putsd "ARGWIDE: $r mem=$addr 0x$data"
            return 0x$data
    	}
    } else {
        if { $r < 8} {
    	    set argreg [cdlGetArgRegName $r $instance_id]
            set data [codelink debug get register -cpu $instance_id $argreg]
            putsd "ARG: $argreg $data"
            return $data
        } else {
            set addr [expr {[codelink debug get register -cpu $instance_id SP] + (($r - 8) * 4)}]
            set data [get_memory $addr]
            putsd "ARG: $r mem=$addr 0x$data"
            return 0x$data
        }
    }
}
