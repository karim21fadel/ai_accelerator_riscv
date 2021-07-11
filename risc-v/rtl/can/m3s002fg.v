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
// m3s002fg.v
//
// 64 byte RX FIFO
//
// This module stores input RX data from CAN bus in 64 byte FIFO
// Revision history
//
// $Log: m3s002fg.v,v $
// Revision 1.14  2005/01/21
// Clean synthesis warnings
//
// Revision 1.13  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.12  2003/07/30
// ECN01953: VN-CHeck code issues
//
// Revision 1.11  2003/07/29
// ECN01953: VN-Check code issues
//
// Revision 1.10  2001/09/25
// Tidying RTL files for review.
//
// Revision 1.9  2001/09/24
// Tidying for Review.
//
// Revision 1.8  2001/09/03
// Comment changed
//
// Revision 1.7  2001/08/30
// Ctrl-M removed
//
// Revision 1.6  2001/08/24
// Changes made to FIFO reset/inti.
//
// Revision 1.5  2001/06/20
// Unregister wdata and sl signals
//
// Revision 1.4  2001/06/20
// change to fifo_index_addr
//
// Revision 1.3  2001/06/15
// Registered wdata and sl_rx_fifo
//
// Revision 1.2  2001/06/14
// Files tidied up
//
// Revision 1.1  2001/06/14
// New files
//
//
// V1.0 - synchronous interface
// V1.1 - Added reset to rx_fifo 6/27/01
//
module m3s002fg (rx_ident1, rx_ident2, rx_ident3, rx_ident4,
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
                 rx_data1, rx_data2, rx_data3, rx_data4, rx_data5, rx_data6, rx_data7, rx_data8,
                 xtal1_in, rx_frame, write_strobe, rx_data, addr, val, rd, wdata, nrst, rrb, cdo,
                 rbs, dos, dos_int, rm, rmc, rbsa, sl_rbsa, sl_rx_fifo_in, rx_fifo_address,
                 start_load_fifo, ri_int
                );
input        xtal1_in;                // clock input
input        write_strobe;            // enables new received data to be stored in RX FIFO from CAN bus
input        start_load_fifo;         // signal to write received data to the rx-fifo
input        val ;
input        nrst;
input        rd;                      // read/not-write strobe
input        rrb;                     // release receive buffer command
input        cdo;                     // clear data overrun command
input        rm;                      // reset mode active
input        sl_rbsa;                 // sync signal for CPU write to RBSA register
input        sl_rx_fifo_in;           // sync signal for CPU write to rx-fifo
input  [5:0] rx_fifo_address;         // internal rx fifo address (0 -> 63) to be written to by CPU
input  [7:0] rx_frame;
input  [7:0] rx_ident1;
input  [7:0] rx_ident2;
input  [7:0] rx_data1;
input  [7:0] rx_data2;
input  [7:0] rx_data3;
input  [7:0] rx_data4;
input  [7:0] rx_ident3;
input  [7:0] rx_ident4;
input  [7:0] rx_data5;
input  [7:0] rx_data6;
input  [7:0] rx_data7;
input  [7:0] rx_data8;
input  [7:0] addr;                    // input address
input  [7:0] wdata;                   // input data for CPU write to RBSA register
output       dos;                     // data overrun status
output       dos_int;                 // data overrun status interrupt
output       ri_int;                  // receive interrupt signal
output       rbs;                     // Receive buffer status, high when at least 1 message available
output [7:0] rx_data;                 // data return to CPU mux
output [7:0] rmc;                     // rx message counter
output [5:0] rbsa;                    // rx buffer start address register
wire         eff;                     // extended frame format
wire         rtr;                     // remote transmission frame
wire [7:0]   rx_fifo_data;            // returned data from rx-fifo
wire [5:0]   rbsa;                    // rx buffer start address register
wire [7:0]   rx_frame_data;           // rx frame information at read pointer location
reg          dos;
reg          dos_int;
reg          rbs;
reg          fifo_full;               // not enough storage for message
reg          ri_int;                  // receive interrupt signal
reg          write_enable;            // enable signal for data writes to rx-fifo
reg [3:0]    rx_count;                // counter for strobing received bytes into rx-fifo
reg [5:0]    read_ptr;                // position in fifo where data can be read from
reg [5:0]    fifo_index_addr;         // index into rx-fifo depending on ADDR
reg [5:0]    fifo_index_wr_addr;      // index into rx-fifo for rx-fifo write operation
reg [5:0]    write_ptr;               // position in fifo where data can be written to
reg [5:0]    rbsa_int;                // internal rx buffer start address register
reg [5:0]    released_message_length; // number of bytes released in fifo
reg [6:0]    free_bytes;              // keep a record of free bytes available in fifo
reg [6:0]    free_bytes_var;          // variable used to calculate free_bytes_temp
reg [6:0]    free_bytes_temp;         // value for free bytes if RRB and write_strobe occur simultaneously
reg [7:0]    rx_data;
reg [7:0]    rx_fifo[63:0];           // 64 byte fifo
reg [3:0]    req_storage_space;       // how many bytes needed to store data
reg [7:0]    rmc;                     // rx message counter
reg [7:0]    data_to_write;           // data to be written to rx-fifo
wire          sl_rx_fifo;             // select rx_fifo for CPU write/read
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
O/KmM1pLELN5L+ZzY5Ro+gXCrxxc18MSZ4lMj5LZaXRREEhzoczsKxz8GM8n0FT8
gcxM/DGQ9v9DrEGBCpGYEaYtIeHsPqrmk+QH9XYamjd/M+SoC6T6natLcID5NImR
lEiKMDKK4dX5KgvJ3G7g7Qh/DeIVnDTlQTwQDRAqgIQ=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
p5bHejJLwM/N2r11cuxXtukUOa8rfvgfoQzjrUJc7pn6fRzSQYRqZp4+YZ8vdtl2
x5DK1qrMsiqYHMj9zM5QZpC7wvt5FBOn9AloL/GRLr8TW2G84dOPqdmaxQ1nZPx7
6bB3DVe3QutrJrPxYvD26oyZfcJh4ZTPdAtL6tVdCiM=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
endmodule
