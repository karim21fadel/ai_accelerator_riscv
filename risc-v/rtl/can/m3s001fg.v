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
// m3s001fg.v
// Controller
//
// Contains controllers for the following functions:
// m3s006fg - State machine
// Revision history
//
// $Log: m3s001fg.v,v $
// Revision 1.7  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.6  2001/09/26
// looked like a rouge comment
//
// Revision 1.5  2001/09/25
// Tidying RTL files for review.
//
// Revision 1.4  2001/09/24
// Tidying for Review.
//
// Revision 1.3  2001/06/26
// Change state and associated signals to 6 bits
//
// Revision 1.2  2001/06/14
// Files tidied up
//
// Revision 1.1  2001/06/14
// New files
//
//
// V1.0 - synchronous interface
//
// Include MCAN2 states
`include "mcan2_state.v"
module m3s001fg (xtal1_in, nrst, rm, sm, tr, test_bus_free_start, bus_free, status,
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
                 srr_transmit, tx_frame_format, tx_control, rx_control, start_of_frame,
                 clear_tr, rx_error_next_state, tx_error_next_state, error_passive,
                 passive_error_start, passive_error_end, state, nextstate,lom,
                 bs, receive_ok , crc_ok, zero_dlc , sample_dom_bit_while_idle
                );
input        xtal1_in;
input        nrst ;
input        rm;                       // reset mode
input        sm;                       // sleep mode
input        lom;                      // listen only mode
input        tr;                       // transmit request
input        bs;                       // bus status
input        bus_free;
input        crc_ok;                   // received crc is okay
input        zero_dlc;                 // received data length code is zero
input        srr_transmit;             // Self Reception Request
input        sample_dom_bit_while_idle;
input        tx_frame_format;          // EFF or SFF frame to be sent
input        passive_error_end;        // signal end of passive error flag
input        error_passive;            // signal to state machine that device is error passive
input        start_of_frame;           // start of frame detected
input  [2:0] tx_control;
input  [2:0] rx_control;
input  [5:0] rx_error_next_state;
input  [5:0] tx_error_next_state;
output       test_bus_free_start;
output       clear_tr;
output       receive_ok;               // received a message ok
output       passive_error_start;      // signal start of passive error flag
output [5:2] status;                   // assign these bits of status register
output [5:0] state;                    // ouput current state and next state
output [5:0] nextstate;
wire         passive_error_start;
wire [2:0]   tx_control;
wire [5:0]   state;
wire [5:0]   nextstate;
reg          receive_ok;
reg          clear_tr;                 // flag to reset transmission request
reg          receive_state;            // flag when device is receiver
reg          message_transmission;     // a message is being transmitted or waiting for transmission
reg [5:2]    status;
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
jXgti2Ngp0QyjLbzWkKhp8rt9iw1nn4CDXSqpw6G749w4r2FTLIHd6+0wjHiIsOs
Fp0yRXZbjnXsmzSlqfRJNjQp0AEHoUAvCQWZdkpmePeNvffH3odraZA7TKLr9cmm
TU9dpxAmzuIAooE7HxlfaX3UZPRj5m+lDCJ6gjXIfGo=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
VODNZ9Ay5FznuuPcvipm9F0VJWRZcWKc/ikY4OfMZVMC6do6u4fVdJ2iiA8D8Wj3
SMSFaELriQ4Pj5GpWH52HufU8OlDrM+2gaiV7mpdYYCnUMAM1eNetaQVZA16udTR
FCwBvNITQUNMzzwYt+ke7w2GHljGnD+Rxo6Az+wgub0=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
endmodule
