//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Use of these deliverables for the purpose of making silicon from an IC    //
//design is limited to the terms and conditions of your license agreement   //
//with Mentor Graphics If you have further questions please contact Mentor  //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (mcan2 v2005.020) was extracted on              //
//workstation hostid 838626cb Inventra                                      //
// Copyright Mentor Graphics Corporation and Licensors 2001.
//
// m3s003fg.v
// Receive Engine
// Revision history
//
// $Log: m3s003fg.v,v $
// Revision 1.8  2005/01/21
// Clean synthesis warnings
//
// Revision 1.7  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.6  2004/09/02
//
// CVS ECN02306
//
// Revision 1.5  2003/07/30
// ECN01953: VN-CHeck code issues
//
// Revision 1.4  2001/09/25
// Tidying RTL files for review.
//
// Revision 1.3  2001/09/24
// Tidying for Review.
//
// Revision 1.2  2001/06/26
// Change state and associated signals to 6 bits
//
// Revision 1.1  2001/06/14
// New files
//
//
// V1.0 - synchronous interface
//
// Include MCAN2 states
`include "mcan2_state.v"
module m3s003fg (xtal1_in, nrst, sample_time, state, nextstate, get_sample, rx_frame,
//*******************************************************************       //
//IMPORTANT NOTICE                                                          //
//================                                                          //
//Copyright Mentor Graphics Corporation 1996 - 1999.  All rights reserved.  //
//This file and associated deliverables are the trade secrets,              //
//confidential information and copyrighted works of Mentor Graphics         //
//Corporation and its licensors and are subject to your license agreement   //
//with Mentor Graphics Corporation.                                         //
//                                                                          //
//Use of these deliverables for the purpose of making silicon from an IC    //
//design is limited to the terms and conditions of your license agreement   //
//with Mentor Graphics If you have further questions please contact Mentor  //
//Graphics Customer Support.                                                //
//                                                                          //
//This Mentor Graphics core (mcan2 v2005.020) was extracted on              //
//workstation hostid 838626cb Inventra                                      //
                 rx_ident1, rx_ident2, rx_ident3, rx_ident4, rx_data1, rx_data2, rx_data3,
                 rx_data4, rx_data5, rx_data6, rx_data7, rx_data8, rx_control, srr, tr,
                 sample_dom_bit_while_intr, accept_ok, write_strobe, error, prev_bit, crc_ok,
                 sample_time_d, sync_pulse, stuff_detected, zero_dlc, start_load_fifo
                );
input        xtal1_in;
input        get_sample;                // RXO input triple or single sampled
input        nrst;
input        sample_time;
input        sample_dom_bit_while_intr; // sample a dom bit while in intermission
input        sample_time_d;
input        sync_pulse;                // detect if RE-sync edge occured during sample pulse
input        prev_bit;                  // previous sampled value of CAN bus
input        stuff_detected;            // flag when stuff bit detected
input        accept_ok;                 // accept received frame because it passed acceptance filter
input  [5:0] state;                     // current state of device
input  [5:0] nextstate;                 // next state of the device
input        srr;                       // self reception request
input        tr;                        // trans request
output       write_strobe;              // write strobe for received data - means received data is valid!
output       crc_ok;                    // received crc is incorrect
output       zero_dlc;                  // flag to show data length code is zero
output       start_load_fifo;           // flag to show when to commence writting received data to the fifo
output [2:0] rx_control;                // control bits for state machine from receiver
output [7:0] rx_frame;
output [7:0] rx_ident1;
output [7:0] rx_ident2;
output [7:0] rx_ident3;
output [7:0] rx_ident4;
output [7:0] rx_data1;
output [7:0] rx_data2;
output [7:0] rx_data3;
output [7:0] rx_data4;
output [7:0] rx_data5;
output [7:0] rx_data6;
output [7:0] rx_data7;
output [7:0] rx_data8;
output [7:0] error;                     // errors detected by receiver
wire         ide;                       // IDE bit, if set extended frame, if low standard frame
wire         eff;                       // flag to show frame is extended format if set
wire [3:0]   data_length;               // no of data bytes
wire [6:0]   databitcount;              // no of data bits to be received
wire [7:0]   rx_frame;
wire [7:0]   rx_data1;
wire [7:0]   rx_data2;
wire [7:0]   rx_data3;
wire [7:0]   rx_data4;
wire [7:0]   rx_data5;
wire [7:0]   rx_data6;
wire [7:0]   rx_data7;
wire [7:0]   rx_data8;
reg  [6:0]   math_tmp;
reg          write_strobe;
reg          next_write_strobe;
reg          start_load_fifo;
reg          crc_ok;
reg          zero_dlc;
reg          rtr;                       // RTR bit
reg          receive_finished;          // flag to show when rx bits have been received
reg          receiver_state;            // device receiving and storing data
reg [2:0]    rx_control;
reg [2:0]    next_rx_control;
reg [3:0]    rec_dlc_data;              // 4 dlc control bits
reg [3:0]    next_rec_dlc_data;         // 4 dlc control bits
reg [3:0]    databytecount;             // no of bytes to be received
reg [6:0]    bit_count;                 // general counter used for counting bits received
reg [6:0]    next_bit_count;            // general counter used for counting bits received
reg [6:0]    prev_bit_count;            // remember bit count from previous clock cycle
reg [6:0]    num_of_bits_to_rec;        // no of bits to be received for any given frame
reg [6:0]    max_index;                 // msb of bit_count index
reg [7:0]    rx_ident1;
reg [7:0]    rx_ident2;
reg [7:0]    rx_ident3;
reg [7:0]    rx_ident4;
reg [7:0]    error;
reg [7:0]    next_error;
reg [14:0]   rec_crc_data;              // 15 crc bits
reg [14:0]   next_rec_crc_data;         // 15 crc bits
reg [14:0]   crc_rg;                    // CRC contents
reg [14:0]   next_crc_rg;                    // CRC contents
reg [14:0]   prev_crc_rg;               // store previous CRC reg contents in case erroneously updated
reg [31:0]   next_rec_ident_data;       // 32 bit arbitration field
reg [31:0]   rec_ident_data;            // 32 bit arbitration field
reg [63:0]   rec_data_data;             // 64 bits (max) of transmission data
reg [63:0]   next_rec_data_data;             // 64 bits (max) of transmission data
   
assign ide = rec_ident_data[19];        // ide bit in extended frame
assign eff = ide;                       // use eff to show which format is being used
//get the Rx frame, identifier and data information
assign rx_frame     = {eff,rtr,1'b0,1'b0,rec_dlc_data[3:0]};
assign rx_data1     = rec_data_data[63:56];
assign rx_data2     = rec_data_data[55:48];
assign rx_data3     = rec_data_data[47:40];
assign rx_data4     = rec_data_data[39:32];
`ifdef CAN_RX_ERROR_INJECTED
assign rx_data5     = rec_data_data[23:16];//Error injection. Should be: rec_data_data[31:24];
`else
assign rx_data5     = rec_data_data[31:24];
`endif
assign rx_data6     = rec_data_data[23:16];
assign rx_data7     = rec_data_data[15:8];
assign rx_data8     = rec_data_data[7:0];
assign databitcount = {databytecount,3'b000}; // 4'h8; // no of data bits to receive
assign data_length  = rec_dlc_data[3:0];  // no of bytes to be received
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
Cs85vEIiWnSSwcXMy/nZl8vFDz9r7dVYtC4LG9s62unJaaKyRHyFYO7PdSpiLSjO
9sQ5b4on3a4t4efko1RbJN2aTsTGsRuD+aXpcMPcNMpMO54hVhXhGsvzafcYqjx2
PsNELEWu9IxjFQ5k0C2grHYfDwSch5fR1/qwOZQVfJg=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
H75btrDPlAg09xUKnf1sqsEpGG+r2fcpPVCR0Ed2iSnVhIg8WWah16wc0ZcyAmhk
mMikPQPRoDcoOD6WjZsIFO7N4pAX5Xy0pqgS84/WnN6qOHNKYbi9VOgg2Txwv9rq
abzMBqct/gk3WTHQStNnpClgGm+azW4QNwAgt7xQNl4=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
endmodule
