//----------------------------------------------------------------------------//
// Unpublished work. Copyright 2021 Siemens                                   //
//                                                                            //
// This material contains trade secrets or otherwise confidential             //
// information owned by Siemens Industry Software Inc. or its affiliates      //
// (collectively, "SISW"), or its licensors. Access to and use of this        //
// information is strictly limited as set forth in the Customer's applicable  //
// agreements with SISW.                                                      //
//----------------------------------------------------------------------------//

//===========================================================================
// Top.v                                                       mabdels 7-2-08
//
// The Top module is the top level netlist which connects the Transactors
// and DUT together.
//===========================================================================

`timescale 1ns/1ns

module Top ( ); // {

// pragma attribute Top partition_module_xrtl

    localparam NUM_RESET_CYCLES = 20;

    localparam CLOCK_HALF_PERIOD_UART  = 50;          
    localparam CLOCK_HALF_PERIOD_SYS = 20;            

    localparam  USE_ZERO_RISCY = 0;
    localparam  RISCY_RV32F    = 0;
    localparam  ZERO_RV32M     = 1;
    localparam  ZERO_RV32E     = 0;	

    // Clock, reset
    reg          clockUART, clockSYS;
    wire         uart_rx, uart_tx, rts;

    wire Resetn;
    wire Reset;

    assign Resetn = ~Reset;

    XlTlmResetGenerator #( .NUM_RESET_CYCLES(NUM_RESET_CYCLES) )
        tlmResetGenerator(.clock(clockSYS), .reset(Reset));

    XlUartTransactor #(.CLOCK_RATE(10000000), .AUTO_BOOTSTRAP(1))
               uartTransactor (     clockUART,        1'b0, rts, uart_rx, uart_tx );
`ifdef CODELINK_ENABLE 
    cdlMonitor_PULPINO_0 monitor_0(clockSYS, Resetn);
`endif

  pulpino_top
  #(
    .USE_ZERO_RISCY    ( USE_ZERO_RISCY ),
    .RISCY_RV32F       ( RISCY_RV32F    ),
    .ZERO_RV32M        ( ZERO_RV32M     ),
    .ZERO_RV32E        ( ZERO_RV32E     )
   )
  SOC
  (
    .clk               ( clockSYS ),
    .rst_n             ( Resetn  ),

    .clk_sel_i         ( 1'b0       ),
    .testmode_i        ( 1'b0       ),
    .fetch_enable_i    ( 1'b1       ),
    .spi_clk_i         ( 1'b0       ),
    .spi_cs_i          ( 1'b1       ),
    .spi_mode_o        (  ),
    .spi_sdo0_o        (  ),
    .spi_sdo1_o        (  ),
    .spi_sdo2_o        (  ),
    .spi_sdo3_o        (  ),
    .spi_sdi0_i        (  ),
    .spi_sdi1_i        (  ),
    .spi_sdi2_i        (  ),
    .spi_sdi3_i        (  ),
    .spi_master_clk_o  (  ),
    .spi_master_csn0_o (  ),
    .spi_master_csn1_o (  ),
    .spi_master_csn2_o (  ),
    .spi_master_csn3_o (  ),
    .spi_master_mode_o (  ),
    .spi_master_sdo0_o (  ),
    .spi_master_sdo1_o (  ),
    .spi_master_sdo2_o (  ),
    .spi_master_sdo3_o (  ),
    .spi_master_sdi0_i (  ),
    .spi_master_sdi1_i (  ),
    .spi_master_sdi2_i (  ),
    .spi_master_sdi3_i (  ),

    .scl_pad_i         ( 1'b1       ),
    .scl_pad_o         (  ),
    .scl_padoen_o      (  ),
    .sda_pad_i         ( 1'b1       ),
    .sda_pad_o         (  ),
    .sda_padoen_o      (  ),


    .uart_tx           (uart_rx     ),
    .uart_rx           (uart_tx     ),
    .uart_rts          (  ),
    .uart_dtr          (  ),
    .uart_cts          ( 1'b0       ),
    .uart_dsr          ( 1'b0       ),

    .gpio_in           (  ),
    .gpio_out          (  ),
    .gpio_dir          (  ),
    .gpio_padcfg       (  ),

    .tck_i             ( 1'b0       ),
    .trstn_i           ( Resetn     ),
    .tms_i             ( 1'b0       ),
    .tdi_i             ( 1'b0       ),
    .tdo_o             (  ),
 
    .can_rx0           ( 1'b0       ),
    .can_tx0           (            ),
    .can_tx1           (            )	
  );

    // tbx clkgen
    initial begin
        clockSYS = 1'b0;
        #CLOCK_HALF_PERIOD_SYS;
        forever #CLOCK_HALF_PERIOD_SYS clockSYS = ~clockSYS;
    end

	// tbx clkgen
    initial begin
        clockUART = 0;
        #CLOCK_HALF_PERIOD_UART;
        forever #CLOCK_HALF_PERIOD_UART clockUART = ~clockUART;
    end

endmodule // }
