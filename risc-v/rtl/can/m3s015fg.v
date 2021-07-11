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
// m3s015fg.v
// Acceptance filter
//
// This module filters input RX data from CAN bus
// Revision history
//
// $Log: m3s015fg.v,v $
// Revision 1.8  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.7  2003/07/30
// ECN01958
//
// Revision 1.6  2003/07/30
// ECN01953: VN-CHeck code issues
//
// Revision 1.5  2001/09/25
// Unused signals/registers removed.
//
// Revision 1.4  2001/09/25
// Tidying RTL files for review.
//
// Revision 1.3  2001/06/26
// Change state and associated signals to 6 bits
//
// Revision 1.2  2001/06/20
// changed 8'h01 to 3h'1
//
// Revision 1.1  2001/06/14
// New files
//
//
// V1.0 - synchronous interface
//
// Include MCAN2 states
`include "mcan2_state.v"
module m3s015fg (xtal1_in, rx_frame, rx_ident1, rx_ident2, rx_ident3, rx_ident4,
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
                 rx_data1, rx_data2, acr0, acr1, acr2, acr3, amr0, amr1, amr2, amr3,
                 nrst, state, rx_control, tx_control, afm, srr, tr, accept_ok
                );
input        xtal1_in;                        // clock input
input        nrst;                            // hardware reset
input        afm;                             // afm = 1 = single filter mode, afm = 0 dual filter mode
input        srr;                             // self reception mode
input        tr;                              // transmission request - srr and tr determine if self reception active
input  [2:0] rx_control;                      // reception control bits
input  [2:0] tx_control;                      // transmission control bits
input  [5:0] state;                           // internal state of the CAN device
input  [7:0] rx_frame;
input  [7:0] rx_ident1;
input  [7:0] rx_ident2;
input  [7:0] rx_data1;
input  [7:0] rx_data2;
input  [7:0] rx_ident3;
input  [7:3] rx_ident4;
input  [7:0] acr0;
input  [7:0] acr1;
input  [7:0] acr2;
input  [7:0] acr3;
input  [7:0] amr0;
input  [7:0] amr1;
input  [7:0] amr2;
input  [7:0] amr3;                            // acceptance filter registers
output       accept_ok;                       // received message passes acceptance filter
wire         eff;                             // extended frame format
wire         rtr;                             // remote transmission frame
wire[3:0]    dlc;                             // received data length
wire[27:0]   acrn_sff;                        // acceptance code reg for SFF format
wire[27:0]   acrn_sff_rec;                    // message identifier bits
wire[27:0]   amrn_sff;                        // acceptance mask reg for SFF format
wire[29:0]   acrn_eff;                        // acceptance code reg for EFF format
wire[29:0]   acrn_eff_rec;                    // message identifier bits for EFF format
wire[29:0]   amrn_eff;                        // acceptance mask reg for EFF format
reg          accept_ok;
reg          single_filter_mode_result;       // filter result for single filter mode
reg          dual_filter_mode_result ;        // filter result for dual filter mode
reg          dual_filter1_result;
reg          dual_filter2_result;             // dual filter is OR of filter 1 and filter 2
reg          filter_result;                   // overall filter result
reg          no_data_bytes;                   // flag to show rec message has no data bytes
reg [15:0]   dual_filter2;                    // dual filter mode, filter 2
reg [19:0]   dual_filter1;                    // dual filter mode, filter 1
reg [19:0]   rec_dual_filter;                 // received message bits for comparison to filter
reg [19:0]   mask_dual_filter1;               // mask for filter 1
reg [15:0]   mask_dual_filter2;               // mask for filter2
reg [19:0]   dual_filter_acrn_result_filter1; // and acrn with id bits (dual filter mode)
reg [19:0]   dual_filter_acrn_result_filter2; // and acrn with id bits (dual filter mode)
reg [29:0]   single_filter_acrn_result;       // and acrn with id bits
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
cuklnBmvMAGSns4SXG0Mjjtf4ZXMtotJ8JJDtZJsvLTm90SwiHKPJWH+QIBBkIlZ
HNZhyM12cYzsRN3qWvcD7i4GDK8hKmPp80ODMcSVhxeD7DvS3SIw7ZeoYeoa5A8K
DRIoIZsnOFisdy3W7mxieuhq+nSKWnwGAlNvH02jfXI=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
JzOOTu6qVqKdZmEMCrQEkUCqR2gFTJAIc/HeTUblIZ63EIy6hub2QiSmFqFLGovo
ixgd7X4SmCbrq61kt1wyB25CvPDz8/2ml/25JLr3T0dPlmSL9GjbX4YSBc9NaX8F
9XWncf1BhgvV3RkO0+5q5mzytRVikr/cbJ5q48DM5k8=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
endmodule
