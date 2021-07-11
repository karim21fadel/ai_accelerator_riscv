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
// m3s007fg.v
// Bus Activity Detector
//
// Produces bus_free signal when CAN bus idle
// Produces signal to show passive error frame is over
// Produces signals to detect illegal number of dominant bits after error flag
// Revision history
//
// $Log: m3s007fg.v,v $
// Revision 1.4  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.3  2001/09/25
// Tidying RTL files for review.
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
module m3s007fg (xtal1_in, sample_time, nrst, state, prev_bit, get_sample, test_bus_free_start,
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
                 bus_free, passive_error_start, passive_error_end, increase_error_count
                );
input        xtal1_in;
input        nrst;
input        test_bus_free_start;
input        sample_time;
input        prev_bit;                  // prev value sampled on the CAN bus
input        get_sample;                // CAN bus sampled in triple sample mode or single sample mode
input        passive_error_start;       // start detecting 6 consequtive bits of equal polarity
input [5:0]  state;                     // state of device
output       bus_free;
output       passive_error_end;         // have detected 6 consequtive bits of equal polarity
output       increase_error_count;      // error count should be increased due to dominant bits
reg          passive_error_end;
reg          bus_free;                  // 11 consecutive recessive bit times detected
reg          passive_error_end_signal;  // signal impending end of passive error frame
reg          initial_count;             // flag to show first error bit time being tested
reg          enable_dominant_bit_count;
reg          increase_error_count;      // error count should be increased due to dominant bits
reg          enable_bus_free_count;     // enable counting of bit times until bus free
reg [2:0]    passive_error_count;
reg [3:0]    bus_free_counter;
reg [3:0]    dominant_bit_count;        // count how many dominant bits detected AFTER error flag
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
COJ2pk5Ic9Z+i0F5p8d5pw5zLrlyOqHZrVtC/NAWtQczwc2KaQmfLbCCML0pfSuD
U/7GbXP39krqEgTJ5+aSALXxm5aTsCYVW4EfmNMrXErPEZp4hG+mI7a338MkfCmm
MaszJFePYy+rH0Wqevf229pmpHBpqyA0TCmoiovH6ks=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
d7u9+VDQrEcZZhe1hAWcECX9Bug+222KT99fQ5+UZxzYAXzwn9MIi97wU+vxnTVm
PKdy/lPz6DpUbwODQhBvDmEP0mpXmYO+r+GeMqORsC42VGxjpxh2Ue5pZxBbQSZG
TSuUkyIWJ9Y46M6V058vFzpDXmDj8/TPmcIF3KEMk2g=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
endmodule
