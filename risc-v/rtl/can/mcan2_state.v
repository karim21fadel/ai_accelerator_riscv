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
// mcan2_state.v
// State Machine States
//
// Top level state machine states for the MCAN2
// Revision history
//
// $Log: mcan2_state.v,v $
// Revision 1.4  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.3  2001/09/25
// Tidying RTL files for review.
//
// Revision 1.2  2001/06/14
// Async file removed
//
//
// V1.0 - synchronous interface
//
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
OZPNbBoGEV1PWzvD97P+wEmowGZxA0cyBpUGFnY1bJ+01mHIkWPbWmgd/mCIwpBo
Xe6s4wjqiJkyYOKFQ+tQI/uppKNmmbT3gsCbPR9RE2lvrYZYkHsPWRoPRNbsEWZ4
EPYWi003LlqjftrtUnwdpB0nmp074Q9B2ThKnjq1YTI=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
W4U9aYUXf7wpaEv/ImVlSax7axCwIgRPN9lxFRCss+aJeY/JkIWgPENCWxjk+gUi
OPpnNgbr6C2dL7J5xlXQWTKi6hyBCxx1Wp5OcJERc8o1QyPIHQw5KxHok9eDRW2G
4xmHc0qG+OwS6K+935VkDGWR9NrnxSBGviVxwqYjy+o=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
