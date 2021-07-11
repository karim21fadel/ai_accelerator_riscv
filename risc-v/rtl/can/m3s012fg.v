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
// ms3012fg.v
// Interrupt Controller
// Revision history
//
// $Log: m3s012fg.v,v $
// Revision 1.4  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.3  2001/09/25
// Tidying RTL files for review.
//
// Revision 1.2  2001/06/15
// minor PVCI fix
//
// Revision 1.1  2001/06/14
// New files
//
//
// V1.0 - synchronous interface
//
module m3s012fg (xtal1_in, nrst, val, addr, rd, rm, ri_int, dos_int,
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
                 ier, status, bei, nint, nint_en, ir, epi, ei, interrupt_time,
                 arbit_lost, tx_enable, wakeup_int_en, illegal_sm_set
                );
input        xtal1_in;
input        nrst;
input        val;
input        rd;               // chip select and read strobe
input        bei;              // bus error interrupt bit
input        epi;              // error passive interrupt bit
input        ei;               // error warning interrupt
input        interrupt_time;   // time when interrupt flags can be set
input        arbit_lost;       // flag to show when arbitration has been lost
input        tx_enable;
input        wakeup_int_en;    // wakeup interrupt
input        illegal_sm_set;
input        rm;               // device entered reset mode
input        ri_int;           // receive interrupt
input        dos_int;          // data overrun interrupt signal
input  [7:0] addr;             // address bus
input  [7:0] ier;
input  [7:0] status;
output       nint;
output       nint_en;
output [7:0] ir;
wire         tbs;              // transmit buffer status
wire         alie;             // Interrupt Enable Register (IER) bits - Arbitration lost Int enable
wire         wuie;             // wake-up int enable
wire         doie;             // data overrun int enable
wire         tie;              // transmit int enable
wire         rie;              // receive int enable
wire         ri;               // Receive buffer status - receive interrupt
wire         bs;               // bus status bit
wire [7:0]   ir;               // iterrupt register
reg          nint_i;           // intermediate signal used to generate nint
reg          nint;
reg          nint_en;
reg          ti;               // transmit interrupt
reg          tx_locked;        // tx buffer locked
reg          flag_ti_int;      // flag a ti interrupt
reg          clear_ti_int;     // clear flag_ti_int flag
reg          ti_1;             // signals for ti interrupt circu
reg          ti_2;             // signals for ti interrupt circu
reg          ti_3;             // signals for ti interrupt circuit
reg          doi;              // data overrun interrupt
reg          doi_1;            // signals for doi interrupt circuit
reg          doi_2;            // signals for doi interrupt circuit
reg          doi_3;            // signals for doi interrupt circuit
reg          ali;              // arbitration lost interrupt
reg          ali_1;            // signals for ali interrupt circuit
reg          ali_2;            // signals for ali interrupt circuit
reg          ali_3;            // signals for ali interrupt circuit
reg          arbit_lost_latch; // latch 'arbit_lost' flag for use later
reg          wui;              // wake-up interrupt
reg          wui_1;            // signals for WUI interrupt circuit
reg          wui_2;            // signals for WUI interrupt circuit
reg          wui_3;            // signals for WUI interrupt circuit
reg          rdcyc_ir;         // detect when read of IR reg takes place
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
lomFhqjGBShuO+LWc0lvWi3kwnybsvIn+Y7JFkzrRvLzzsXWvq/TNzKd0E6Yyhle
fXt8fCFVNHviW6a2gWeSLTeuHTlwgmZr6mxQdsCj4xb8KQd/WFHptsOGjsVquCNE
uZDAZjjJ7XgRfs5lCe7YfQjj929SHzsdRhEGrCS+BNo=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
YyZRLXNKsiuMMD/m6R7qqj6uCO03u71P1mcW/sOvaGdPz+oeFDV3qSsnm93MvRCi
2A2v2ECjwzJLxSLzgb/6QvErBspBNxVKbBu4BHneiFajCUvbilZZEHcMu89KR1rn
98Kx7Mawf1BkIXR2ZAsI0KNaBx/T81aX3aJftWClj0I=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
endmodule
