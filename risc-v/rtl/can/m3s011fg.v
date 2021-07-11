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
// ms3011fg.v
// Clock Divider
//
// Divides the input clock by (M+1)*2.
//
// The input bus , ad, contains the divider values:
// Bits 2-0: M (3-bits)
// M    divide by
// 0    2
// 1    4
// 2    6
// 3    8
// 4   10
// 5   12
// 6   14
// 7    1
//
// clkout has 50:50 duty cycle ratio
//
// Special (nrst & test) reset to initialise clockout generator
// as this needs to run during reset. This special reset is only
// required for simulation initialisation, the clock generator
// circuit is self initialising.
// Revision history
//
// $Log: m3s011fg.v,v $
// Revision 1.7  2005/01/21
// Clean synthesis warnings
//
// Revision 1.6  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.5  2003/07/30
// ECN01953: VN-CHeck code issues
//
// Revision 1.4  2001/09/25
// Tidying RTL files for review.
//
// Revision 1.3  2001/07/31
// Corrected verilog construct
//
// Revision 1.2  2001/07/30
// Negedge statements re-written as Posedge
//
// Revision 1.1  2001/06/14
// New files
//
//
// V1.0 - synchronous interface
//
module m3s011fg (xtal1_in, nrst, wdata, addr, val, rd, cdr, clockout, test
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
                );
input         xtal1_in;
input         nrst;
input         rd;
input         val;
input         test;     // input test pin to increase fault cover
input  [3:0]  wdata;    // input divide number
input  [7:0]  addr;     // input address
output       clockout;
output [3:0] cdr;       // cdr register contents from read back
wire         cdclk;     // signal to flag neg edge on ncdclk
reg          clkout1;
reg          clkout;
reg          clkoff;    // set this bit to turn clock off
reg          cdrwr;     //Address decode
reg          cntzero;   //Count terminate decode
reg          cntseven;  //Divide by 1
reg          divby1;    //Synchronised divide by 1
reg          clockout;
reg          ncdclk;    //Special clock CCT reset for simulation
reg [2:0]    count;
reg [2:0]    cdri;      // divider values
reg [3:0]    cdr;       // latched cdr
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
QcWfw1+hxXrg/8e9h5WcFymoxkZ2IlWB8QHcxZ0coiUg18AlYfWa/ciZTSZMonTu
vvN1n31X7BIoTFYFEofpJ7svqvEWgNf0YwYEybi7CjIHHHydq3pplM3OPyWmMlNM
QEgNxEo8LmQiG4HRCeuhPKuyck4PIRd8y78u12Co8kw=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
P5Y5TDS4XLoHbFh5X3ritvu8VHq+h8zIY+itKpjbJipzwssxxTLWdzdQ/+TLw3oY
sfL+tl+HMUK1xUs35C76C46xES5BpBeViUtGTEP8YV1QaUCxrQ9H/QoqMuVGxVNx
Ia1yIbZTzbtKFzB6dwqohJDPYwBWL75NRkCvEHNsKOg=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
endmodule
