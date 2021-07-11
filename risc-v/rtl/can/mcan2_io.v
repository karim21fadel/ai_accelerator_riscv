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
//////////////////////////////////////////////////////////////////////////////////////////////
//
//************************************************************************
//
// mcan2_io.v
//
// description of code.
//
// io ring for mcan2 functional verification
// this allows the mcan2 to be fitted to the
// original testbench
//
// (c) copyright mentor graphics corporation and licensors 2001.
//
// revision history
// $Log: mcan2_io.v,v $
// Revision 1.8  2004/10/12
// ECN02321
//
// Revision 1.7  2001/09/21
// Fixing Review Errors.
//
//
//************************************************************************
//
// hierarcy record                         : mcan2_io
// this module is called by                : mcan2_tb
//
// this module calls the following module  : mcan2.v
//
//************************************************************************
//
// library declarations
// entity declaration
module mcan2_io (addr, wd, valid, read, rdata, xtal1, xtal1_in, nxtal1_in, nxtal1_enable, rx0, nrst,
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
                 clkout, nint, tx0, tx1, test);
   input        valid;
   input        read;
   input        xtal1;
   input        xtal1_in;
   input        nxtal1_in; // should be connected to the inverted xtal1_in clock signal
   input        rx0;
   input        nrst;
   input        test; // test pin for scan insertion ,  disabled in normal operation
   input [7:0]  addr;
   input [7:0]  wd;
   
   inout        nint; // nint is bi-directional port
   output       clkout;
   output       tx0;
   output       tx1;
   output       nxtal1_enable;
   output [7:0] rdata;
   //-----------------------------------------------------------------
   //---------------------------------------------------------------
   wire              val,rd,nrst;
   wire              rx0;
   wire              nint;
   wire              nint_i; // macro nint
   wire              nint_in; // interrupt input to core to provide wakeup
   wire              nint_en;
   wire              rst; // negedge on nrst (hardware reset signal)
   wire              tx1, tx0; // CAN outputs
   wire              tx0_en, tx1_en;
   wire              tx0_macro, tx1_macro;
   wire              nxtal1_enable;
   wire [7:0]        RDATA;
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
jvy7ClpS+td6doUFkYwhyHVHVc7MmgfkV+iHWPo5p0SZFkXtyENye37tEDbnChhF
daFO+7idynLkL0F93WZhCyNnpD3CDa8Fo57FS/GKr4Q/srAZXEa2CdqjiNdq+urn
Ic/josxpwIVg8vZsFyzSzx77sSYTVSKoUp+IctL14/Q=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
FfJDWlU6eDOGlc4jtTUBbKBwjofzjMzjVbXaXlIbniJ8MHgD/THTbmzcB6Rm9vb3
jNfQQHUZNIksUj6v5L1jrVfzB2xXfvtQmCQZtrPhzb4IWNhEVinr13UpdmyfPK+v
Z053PEhStKegrEIr4KaL3F9eWxobQkZThI7/ELgOIgI=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
biM1Br2Exz8TOA0csRrnPjfPyPpZ+/i3PC/lafSn2JBIPYzhMSCFPZENx829SNmH
eKTnCin048Tq35hcp+D10v5LWwhlakGh4E4EaH/QfMsujsqU0R2VJ9jPpOA7mS41
FaSVb5YwmuXs8paCNM8cYIz/ksz4jOYGp9adw8Y5TryAmhE0i8OomvEuhVIfnSy3
vdjNQjMQzYx2kxOwqZ4aGGEqF+UsIHO4gV+FvygDdzNsN7GWKrTRAD4HvItBIJSY
FQTXfSykku9Z7lOAIHNbjFPZrn1oj07OJ3JkknyeU1rK/YADSNNe3g/n3bqZanVx
sULPHNJuaToxHyHBJXHmUrBx+Kv0BEBG+Vrv4nC26b5ZIv1k7Wuq01DJm6Cp6P1t
HwwADqGoOaXeq2V+EYngVo9nRZAUYCqbicpbV3BBrvJ1Q322TMWbaJ5hA+lyqPfB
HYtZ6cZ41HfI5uMfgNYzY21R0r9ILWMhPFJ8Zs2oMM78Uifll3dJW1QKgDhEozVc
E2/zlMKFYWT7uLDEoyK/qrv8zHlEqqru8kN6cUagYu5WQU+Uzcz9M2V5ROfomqNo
dk3iz6MAVaj32gfKhzGi30PE6owGpctPw7zmRTlTS8V8UpYXNpzNIFlqcm/nyDyK
rg99xJ2wSgd/1hwGjgiQI4NuZXYSmQUUAp2cVe3gFog=
`pragma protect end_protected
   // instantiate mcan2 core
   mcan2 u1 (.xtal1(xtal1), .nrst(nrst), .val(valid), .rd(read), .wdata(wd),
        .xtal1_in(xtal1_in), .nxtal1_in(nxtal1_in), .nxtal1_enable(nxtal1_enable), .nint_in(nint_in), .test(test),
        .address(addr), .rx0(rx0), .rdata(rdata), .clkout(clkout), .nint(nint_i),
        .nint_en(nint_en), .tx0(tx0_macro), .tx0_en(tx0_en), .tx1(tx1_macro), .tx1_en(tx1_en));
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
nabTnpTSodJufAfNtkNOvZ2PDciGd/z7r8DT5CMGQi4NGXG2rnOw13fRjE2pSCgu
LBmNErcEZ92M/fW0dxt70QW6ShsteX8QmnLqlEfh/LzD6Yos9KUVYr+XtZKIB5QS
bpxLjlYRk1O2D+wUzGlWgZrvPBjQjbYt2N5ivYRnhAQ=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
bOruXKK0GePdZDOZY8aJAoICdtCi1aLvlCEOyJeG465t7rDSho+kl61DH2RllRb1
KPkxOZe3RftVKIUXmINJWsF1ofeqKFwL6OfVrUQj7HrEVVDOBxXVvK2n4qLNhoda
ZO65Vkxdx4l1jNK66V2pzCXsqUffAxXXdJgx+X9XKyI=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
bjoAWKVVreDDhO1MIucquA==
`pragma protect end_protected
