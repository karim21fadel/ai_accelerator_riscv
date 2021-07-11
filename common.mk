TESTS = \
	ai_accelerator_riscv

#SOCKET_DOMAIN = AF_INET
SOCKET_DOMAIN = AF_UNIX

CC = gcc
CXX = g++

OPT=-O3
CDEFINES += \
	-DXML_STATIC -DFMI_XML_QUERY -DZLIB_STATIC -DFMILIB_BUILDING_LIBRARY

CFLAGS += \
	$(OPT) -fPIC -Wall $(CDEFINES) \
	-Wno-unused-function -DSC_INCLUDE_DYNAMIC_PROCESSES

LDFLAGS = 

INCL = \
	-Isrc/include -Isrc/server \
	-I$(VLAB_UTIL)/inc \
	-I$(UVMC_HOME)/src/connect/sc -I$(UVMC_HOME)/src/connect/rawc -I$(XL_VIP) \
	-I$(TBX_HOME)/include 

XL_VIP_LIBS = \
	$(XL_VIP_OBJ)/xl_vip_open_kit.so \
	$(XL_VIP_OBJ)/xl_vip_tlm_xactors.so \
	$(XL_VIP_OBJ)/xl_vip_open_kit_stubs.so

ifeq ($(CODELINK_ENABLE),1)
CDL_MONITOR_LIB   = ./risc-v/codelink_monitor/cdl_monitor.so
CDL_MONITOR       = -sv_lib ./risc-v/codelink_monitor/cdl_monitor
CDL_DEF_FLAG      = +define+CODELINK_ENABLE
else
CDL_MONITOR_LIB   = 
CDL_MONITOR       = 
CDL_DEF_FLAG      = 
endif

#----------------------------------------------------
# UVM and UVMC (XL-UVM-Connect) libraries are needed to support
# XLerated and trans-language TLM conduits.
UVMC_LIB_SO = \
	$(UVMC_LIB_OBJ)/uvmc.so \
	$(UVMC_LIB_OBJ)/uvmc_tlm_fabric.so \
	$(UVMC_LIB_OBJ)/uvmc_stubs.so

#----------------------------------------------------
HDL_VHDL = \
	$(RISCV_CAN_VHDL)

HDL_VLOG = \
	$(UVMC_HOME)/src/connect/sv/XlTlmConduitIfs.sv \
	$(XL_VIP)/XlClockAdvancer.sv \
	$(XL_VIP)/XlTimeAdvancer.sv \
	$(XL_VIP)/XlTlmResetGenerator.sv \
	$(XL_VIP)/XlTlmTimeAdvancer.sv \
	$(XL_VIP)/XlUartTransactor.sv 

TB_VLOG = \
	risc-v/rtl/can/pa_can.sv \
	Top.sv 

#----------------------------------------------------
TBXSemaphores.cxx: $(VELOCE_XACTOR_HOME)/common/systemc/TBXSemaphores.cxx
	cp -p $^ $@

COBJS=$(CSRCS:%.c=%.o)
CDEPS=$(CSRCS:%.c=%.d)
OBJS=$(SRCS:%.cxx=%.o)
DEPS=$(SRCS:%.cxx=%.d)
TOBJS=$(TSRCS:%.cxx=%.o)
TDEPS=$(TSRCS:%.cxx=%.d)

uart-xterm: src/server/uart-xterm.c
	$(CXX) $(CFLAGS) $(INCL) -o $@ $<

%.d: %.c
	rm -f $@
	$(CC) -M $(CFLAGS) $(DEFS) $(INCL) -c $< | sed -e 's+^.*\.o: \(.*\).cxx+\1.o: \1.cxx+' > $@

%.o: %.c
	$(CC) $(CFLAGS) $(DEFS) $(INCL) -c $< -o $@

%.d: %.cxx
	rm -f $@
	$(CXX) -M $(CFLAGS) $(DEFS) $(INCL) -c $< | sed -e 's+^.*\.o: \(.*\).cxx+\1.o: \1.cxx+' > $@

%.o: %.cxx
	$(CXX) $(CFLAGS) $(DEFS) $(INCL) -c $< -o $@

fix_modelsim_ini:
	#-----------------------------------------------------------
	# First create proper modelsim.ini, check for proper tool env.
	xlfix-modelsim-ini
	xlcheck

#-----------------------------------------------------------------------------
guivis:
ifeq ($(XL_SIM_MODE),puresim)
	#visualizer +designfile +wavefile +project+mysession.ses
	visualizer +designfile +wavefile +sigfile+Wave0.sig
else
	# Do it this way for conventional .stw database (in contrast to .crd db) ...
	#     # # NOTE: -fullt1t2 is needed to force it to load full range.
	vis -tracedir veloce.wave/waves.stw -fullt1t2 +sigfile+Wave0.sig
endif

#-----------------------------------------------------------------------------
clean:
	\rm -f $(TOBJS) $(TDEPS) $(OBJS) $(DEPS) FabricServer uart-xterm
	\rm -f TBXSemaphores.cxx TbxMainOsci*.cxx 
	\rm -f runLocalServer.csh .qemu_config 
	\rm -rf work can_lib dut_lib dutwork modelsim_libs *.transcript modelsim.ini *.vstf *.m *.log *.cmp tmp cluster_libs
	\rm -rf qwave.db design.bin .visualizer visualizer.log transcript codelink_replay.rlf codelink_print_riscv_core.txt
	\rm -f libtbx.a veloce.config tb tb.log dpiheader.h dconn-* inpts.* qmp*.socket
	\rm -rf veloce.log veloce.med veloce.wave veloce.map dutwork velrunopts.ini
	\rm -rf tbxbindings.h dmslogdir ECTrace.log dmTclClient.log DEBUG_All* TRACE.txt PHBDebugInfo.txt
	\rm -f vsim.wlf .codelink_out .cdl_riscv_core.jdb
	\rm -f $(CDL_MONITOR_LIB) risc-v/codelink_monitor/cdl_monitor.o

clean_codelink:
	\rm -f codelink.ini goCodelink.sh pulpino.xml automotive.elf RISCV_SimPrintf.tcl launch_debugger.do breakpoints.do

copy_codelink:
	cp risc-v/codelink_monitor/codelink.ini .
	cp risc-v/codelink_monitor/goCodelink.sh .
	cp risc-v/codelink_monitor/pulpino.xml .
	cp risc-v/sw/build/apps/automotive/automotive.elf .
	cp risc-v/codelink_monitor/RISCV_SimPrintf.tcl .
	cp risc-v/codelink_monitor/launch_debugger.do .
	cp risc-v/codelink_monitor/breakpoints.do .

