/* (C) Mentor Graphics */

`ifndef CDL_TOP_PATH
  `define CDL_TOP_PATH Top.transmissionCtrlEcuDigSubsystemDUT.core_region_i.CORE.RISCV_CORE
  // `Codelink_ERROR___CDL_TOP_PATH_is_not_defined__Plese_set_instance_path_to_the_target_cpu  // print error message
`endif

`ifndef MONITOR_NAME
 `define MONITOR_NAME cdlMonitor_PULPINO_0
 `define SNOOPER_NAME cdlSnooper_PULPINO_0
// `define CDL_CPU_PATH `CDL_TOP_PATH.u_XXX
// `include "cdlMonitor_XXX.sv"
// `undef MONITOR_NAME
// `undef SNOOPER_NAME
// `undef CDL_CPU_PATH
`endif
    

module `MONITOR_NAME(clock, reset_n); // pragma attribute  partition_module_xrtl

  input logic clock;
  input logic reset_n;

  import "DPI-C" function void codelink_monitor_initialize();
  import "DPI-C" function void codelink_monitor_terminate();
  import "DPI-C" function void codelink_monitor_log_reset_event();
  import "DPI-C" function void codelink_monitor_log_pc(int pc);
  import "DPI-C" function void codelink_monitor_log_register(int reg_no, int value);
  import "DPI-C" function void codelink_monitor_log_memory(int address, int byte_enable, int value);

  initial begin
    codelink_monitor_initialize();
  end

  final begin
    codelink_monitor_terminate();
  end

  logic [31:0]  pc_id;
  logic [31:0]  pc_ex;
  logic [31:0]  register_bank [31:0];
  logic [31:0]  register_enable;
  logic [31:0]  memory_address;
  logic [31:0]  memory_wdata;

  logic is_decoding;
  logic is_executing;
  logic reset_delayed;
  logic memory_req;
  logic memory_gnt;
  logic memory_we;
  logic [31:0] memory_be;

  genvar r;

  assign pc_id = `CDL_TOP_PATH.pc_id;
  assign is_decoding = `CDL_TOP_PATH.is_decoding;
  assign register_enable[0] = 1'b0;

  generate
    for (r=1; r<32; r++) begin
      assign register_bank[r] = `CDL_TOP_PATH.id_stage_i.registers_i.mem[r];
      assign register_enable[r] = `CDL_TOP_PATH.id_stage_i.registers_i.mem_clocks[r];
      
      always @(negedge clock) begin
        if (register_enable[r] == 1'b1) begin
          codelink_monitor_log_register(r, register_bank[r]);
        end 
      end

    end
  endgenerate

  initial memory_be[31:4] = 28'h0000000;

  assign memory_address = `CDL_TOP_PATH.load_store_unit_i.data_addr_o;
  assign memory_wdata   = `CDL_TOP_PATH.load_store_unit_i.data_wdata_o;
  assign memory_wreq    = `CDL_TOP_PATH.load_store_unit_i.data_req_o;
  assign memory_wgnt    = `CDL_TOP_PATH.load_store_unit_i.data_gnt_i;
  assign memory_we      = `CDL_TOP_PATH.load_store_unit_i.data_we_o;
  assign memory_be[3:0] = `CDL_TOP_PATH.load_store_unit_i.data_be_o;

  always @(posedge clock) begin
    pc_ex <= pc_id;
    is_executing <= is_decoding;
  end

  always @(posedge clock) begin
    reset_delayed <= reset_n;
    if ((reset_delayed == 1'b0) && (reset_n == 1'b1)) begin
      codelink_monitor_log_reset_event();
    end
  end

  always @(posedge clock) begin
    if ((reset_n == 1'b1) && (is_executing)) begin
      codelink_monitor_log_pc(pc_ex);
    end
  end

  always @(posedge clock) begin 
    if (memory_wreq && memory_wgnt && memory_we) begin
      //$display("logging memory %x %x ", memory_address, memory_wdata);
      codelink_monitor_log_memory(memory_address, memory_be, memory_wdata);
    end
  end

endmodule
