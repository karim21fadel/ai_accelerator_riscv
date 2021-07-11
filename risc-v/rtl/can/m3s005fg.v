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
// m3s005fg.v
// TX Buffer Registers
// Revision history
//
// $Log: m3s005fg.v,v $
// Revision 1.4  2001/09/25
// Unused signals/registers removed.
//
// Revision 1.3  2001/09/25
// Tidying RTL files for review.
//
// Revision 1.2  2001/09/24
// Tidying for Review.
//
// Revision 1.1  2001/06/14
// New files
//
//
// V1.0 - synchronous interface
//
module m3s005fg (xtal1_in, rm, wdata, rdata, addr, val, rd, tx_frame, tx_ident1,
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
                 tx_ident2, tx_ident3, tx_ident4, tx_data1, tx_data2, tx_data3, tx_data4,
                 tx_data5, tx_data6, tx_data7, tx_data8
                );
input        xtal1_in;   // input clock
input        rd;         // Read (NOT Write)
input        val;        // Chip select
input        rm;         // reset mode
input  [7:0] wdata;      // input data
input  [7:0] addr;       // address
output [7:0] rdata;      // register contents from read back
output [7:0] tx_frame;   // tx_frame information byte
output [7:0] tx_ident1;  // tx_identifier 1
output [7:0] tx_ident2;  // tx_identifier 2
output [7:0] tx_ident3;  // tx_identifier 3 - identifier 3,4 used in extended frame format
output [7:0] tx_ident4;  // tx_identifier 4
output [7:0] tx_data1;   // tx data byte 1
output [7:0] tx_data2;   // tx data byte 2
output [7:0] tx_data3;   // tx data byte 3
output [7:0] tx_data4;   // tx data byte 4
output [7:0] tx_data5;   // tx data byte 5
output [7:0] tx_data6;   // tx data byte 6
output [7:0] tx_data7;   // tx data byte 7
output [7:0] tx_data8;   // tx data byte 8
wire         eff;        // signal to flag an Extended frame format is being sent
reg [7:0]    tx_frame;
reg [7:0]    tx_ident1;
reg [7:0]    tx_ident2;
reg [7:0]    tx_ident3;
reg [7:0]    tx_ident4;
reg [7:0]    tx_data1;
reg [7:0]    tx_data2;
reg [7:0]    tx_data3;
reg [7:0]    tx_data4;
reg [7:0]    tx_data5;
reg [7:0]    tx_data6;
reg [7:0]    tx_data7;
reg [7:0]    tx_data8;
reg [7:0]    tx_buf0;
reg [7:0]    tx_buf1;
reg [7:0]    tx_buf2;
reg [7:0]    tx_buf3;
reg [7:0]    tx_buf4;
reg [7:0]    tx_buf5;
reg [7:0]    tx_buf6;
reg [7:0]    tx_buf7;
reg [7:0]    tx_buf8;
reg [7:0]    tx_buf9;
reg [7:0]    tx_bufA;
reg [7:0]    tx_bufB;
reg [7:0]    tx_bufC;
reg [7:0]    rdata;
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
mF5qfy64IpnKorG2exRkwe/ykTHfX6zj000v6Ei+17jUqCXyfi+EiCtEVE4S5yMq
nIhNZKCk+RsPv7NorGB5Q82RRNDYtZ1ckDhYaosuqQi1H4BxWoSEoq/+1/kjxnoc
v9nGk/QMSVo7cEE92rfvVrj6cb7MakCScdgeVXHa06c=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
LG4ob3L6ixh/eiZ5+snlLchFr2rFMRWuZcoSegTgPE8nQifrzNNczQSNutlxtVOL
AK7NwTIP/nj9Wj4s4PzNYWzeGKw7q29Dc8D4A0BqIOGttELWMHQHTxiwkIzQGRTA
FXKwR7bJAeC4ypBdXPox/cDaJpgLLFc4uc66JpT7nBc=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
endmodule
