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
// mcan2.v
// MCAN2 Top Level
//
// The top level instantiates blocks for the CAN Bus Controller
// Revision history
//
// $Log: mcan2.v,v $
// Revision 1.14  2005/01/21
// Clean synthesis warnings
//
// Revision 1.13  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.12  2004/10/12
// ECN02321
//
// Revision 1.11  2003/07/30
// ECN01958
//
// Revision 1.10  2001/09/25
// Unused signals removed.
//
// Revision 1.9  2001/09/25
// Unused signals/registers removed.
//
// Revision 1.8  2001/09/25
// Tidying RTL files for review.
//
// Revision 1.7  2001/08/30
// xtal1_enable inverted, becomes 'nxtal1_enable'
//
// Revision 1.6  2001/08/24
// Removed 'xtal1_out', added 'xtal1_enable'.
//
// Revision 1.5  2001/06/26
// Change state and associated signals to 6 bits
//
// Revision 1.4  2001/06/21
// 'mod' re-named 'mode'
//
// Revision 1.3  2001/06/14
// Async file removed
//
//
// V1.0 - synchronous interface
//
module mcan2 (xtal1, xtal1_in, nxtal1_in, nxtal1_enable, nrst , val, rd, wdata, address, rx0,
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
              rdata, clkout, nint, nint_in, nint_en, tx0, tx0_en, tx1, tx1_en, test
             );
input        xtal1, xtal1_in, nxtal1_in, nrst; // nxtal1_in should receive the inverted xtal1_in signal externally
input        val; // CPU chip select
input        rd; // CPU synchronus read/not-write enable
input        rx0;
input        nint_in; // interrupt input, used to check if NINT forced low externally
input        test; // test pin added to increase fault cover
input  [7:0] wdata;
input  [7:0] address; // input address
output       clkout;
output       nint;
output       nint_en;
output       tx0;
output       tx1;
output       tx0_en;
output       tx1_en; // enable signals for TX0, TX1
output       nxtal1_enable;   // enable external clock
output [7:0] rdata;
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
Dq7iBByVnYBl8H5eBhynegTEow5XbaHk1RoK4l1KuoL0K//tCd7Z4uvtvQ4GFHL5
ajZ6cYW3MT0GxNfjMmmn530wCXppZ/SBrr8iJHZX621uQRHmskx1f4qjT0PUON/E
32WsaQiwREXPKFmuJ3bZ3fyIKy78/VuhjiN7PxhpbOY=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
b5+TkyIeCKbOM/dhrLIA7cgsObgBjLhflhiaurkNeHvmpd5zeQ0QeeotKmbdkz0c
mwOO+txwsENBlKKnAjmMonXYAgs4rnBU+ypTHl8n126jtSHNvckk3g+9vaUSJUri
MrkJYRDw+Tuzha87fN3dd+vqCFtTp4jDbHRr+ZKY4VQ=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
GeVcRyzcv0aImOf1ZaoSJx9S3/cUUgAXrstK8dKX0PLXbXg3gmtsYEzegZ3GXZEA
S5itchHAiLGtBuVqsV2e9yCCc95HMQSCccZxPzwUa3gw+W5QvXLJvGPueL2iwuT4
tl+B+EoK0ETaMIS0W9a1kXB114b4rZP6n33p6EWYkriGwJFeX083/65YlluC/Lih
lHSEIPR+HhzaINI5h6BJ6qHwyMdv2PqOmN5DtE+gCNPSf5wRgRSQnMllsjgjmYQ9
fGPSaluAkR7m5JHCv+ckn2tlcM+U4RKiH1O9Ft1DSypm1ieW3msbMEd3oh4S/dO2
9u0l3dPMfKXdqagR18SoDMNPaG6GHa6C/QRKzCmm8Kbg+toOzH+LycoUuOMAgvci
b9sKo2rk/lNtMrmBYHqbtQtnf4K+E4XlBSL7+iSbmjvz+jspjGTcFvYJnSiey9oW
2yttzmJfr9ioKejDXr6mdCmDL1nV5w/4yBuYpUXdfO5sGAJ4N1ximI7k5Cqzm4wQ
c9gpDw+6UyIteKxMy/WeXM3ztueXU4Yn7IsuaLNHhvtk6/JYQqa4OIDS0fAx4JCS
pPIWFEH5mKXLdqinyE+F/kPVnslna5eOFQqAy2j7Rr8lTxTOc43opqB/I4bjDS+y
iCtktZvCOswbecBHhtHZf4g5JbntZYyth9DHdTgxEpDhABfDlxyvEL48a+F0mIJa
+Tww6R3cJvL/BM2UfQfkzh39bk4N8E8p2qMAZ9VBODHYob1QJ5FjcNuyQ142uWF2
wNTD1+F9cIONXkmH/E+QNAYHluYhcaTulqsPXxFTQT1UYIk4El0I45sMKzedQGrC
BqyEg1woXyNtIAYhdwFtwvjdf6H9GBxTORgqZTbEKxkMr7Fh1JDo8c3fcC0qwtGP
CycuvV45R7x51yh5RNQ7KZRl/L3fS2dZXlHY29fUewamX0Y/huNoOI7sdMCY77o+
mrxuzkDyz8dJ1iTVOD8vAgPnf0DkovOfTm9b4LO9G/j3hr9rcgHZQ8igc4hx5bHJ
45om01Ikh5vAjB7AetNs9EAPLcxjr0c9JO1wFyiZ4FWOvyGLocCMWw+JHDAsgi9K
d38DBJ2+IjZpfDGj6RNfkd1sEgFbqJFSzl74Csm98JRcxpu4c11WgNsNRok4t9dw
POn5UJjxPkSYbrZl002n8y36i/v2/7MsNMmCjVrEWStZIM031VRxWfZbaNdsjQ08
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
`pragma protect end_protected
// Receive Engine
m3s003fg u3 (.xtal1_in(xtal1_in),
         .nrst(nrst), .sample_time(sample_time), .get_sample(get_sample),
         .state(state), .nextstate(nextstate), .rx_frame(rx_frame), .rx_ident1(rx_ident1),
         .rx_ident4(rx_ident4),
         .rx_ident3(rx_ident3), .srr(cmr[4]), .tr(cmr[0]), .stuff_detected(stuff_detected),
         .rx_ident2(rx_ident2), .rx_data1(rx_data1), .rx_data2(rx_data2), .rx_data3(rx_data3),
         .rx_data4(rx_data4), .rx_data5(rx_data5), .rx_data6(rx_data6), .rx_data7(rx_data7),
         .rx_data8(rx_data8), .rx_control(rx_control),
         .sample_dom_bit_while_intr(sample_dom_bit_while_intr),
         .write_strobe(write_strobe), .error(rx_error), .prev_bit(prev_bit), .crc_ok(crc_ok),
         .sample_time_d(sample_time_d), .sync_pulse(sync_pulse), .accept_ok(accept_ok),
         .zero_dlc(zero_dlc), .start_load_fifo(start_load_fifo));
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
ShwVzX0MMRrVbMEMLVT53b6YxQ9V0/zA7JUSrftlOwWMsjC3pA2pta8eKXxUM4hu
C1Ye/JW7UGf4wxbTih9dwz87+raE2rhRQsTTQDewu0qjalFJV9A95nFj0y83AiQY
jc7PjtPd5mm1vSb59cwBFzbSUzedBGdn4hxuEZLB/Qc=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
ZyJJG+0v4BvfTfi/Z9bzUx9+qo5W1YaPyRNGh+rWwwS5Did8aLh+wUvmd3+9RskL
ftikTikWGAt9t47MNXQqFb4urpDZUti9/XAzL7QUatfb7N8N5wLuqUZ0W0wTuyrw
FnPpQfLuNHAipcXtinjVC4pZAdo9yHKYjqHpxqjCFoo=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
75ZX53PoiNKbqLAP0Tox13qwP91q5S/iiefPRXY2yYAljYu9ogS8dMi+fRcUJg7G
bgwjpsY2kCevms3totMY1HbSTiQDj+RlGmCRJ9SP4naXVHSvY93nNFaiyUyjJWau
S6k7QiPN3Vs6WSf+aUq5ZwtW8xduxSlIiOzqF2JywU5CJQdSh+keUABFhWM/K6MS
9TX5v/LkDZlE/48IGdTFJIROSOLzpCCI+MavhnFlpzLNGdW9BKVg5C4+C++KdJHk
kiaajcSAICH03ZqufePoIG0Y7LCPwsKagdlaUayBmeuwU+avnnXPO3yghao+NUCS
3tWLCFCoXYkGYd4f5uvudeGmWqsJ+a0FWBuSP/N9OxDBRcWKdnOsY3cqkO6hMV4f
oVKJDqfLDgueDY9HaDZJQVHrfZSAMCjarg4yH9x1FO7ErjS7pBwQfBhN3eXmFjZ/
xsi3D8XSMea9P1Qtp14AIc8aLVg6wsTE1CtOmNdMBuwVY2j1AGlxV7Mnvgk/Njiu
mvDlv3oWf9UyXRPLAQ8ER4QUv28AALLcsbctuMdsRneKE7rpXgCMwP8CpO4FMv2h
/nI895a7/8wXzQWIBjS+7j6qhGof7KR22kJRtM8lfF5pxxg8t0Qqst/qAuqQm4oj
i2bvUGhnaDdM/aZ2NyD05zCkpJ9AAo6CY3IiSTptXBzTQrmkckp/1l8aW6eQQT9O
AjsZpjvBFg9NSUaU3fex3oB/sfIj0I1nMpiuuVJZkfsO0Jinh2noCT2adW3oCNrN
rNAy3VMBt+SKArVM1N7PYGbQBxBRxXQrdhPkG/2oBAMXz4ENS/YiyJV2n8ixxX6y
sLZ738g7M3dcPy0XrvRnWrpuxcNh1iLcS1qKojw/SGRBgnvuj2nGTAWg/ul3aNE0
XBxzYvaQBtkQHLWBenhlRInUW+nYek98zN+FzG7j4tu/TywsoaMdVTQUv7D6qe6C
+bWyMSLVSIJI6oAOvb86lQGU/J19yGn7bXsG6Tcj+6yJnp5MtdWJqYJRiw7Nj3y+
ZNMIt51u8qq+xbpNki3bjHhbUCgbyafKkyFMs/8BraCWbWdnfMyA72CL72G8a7yM
BoGakkiPN5GQo3KVnBAe+r6OLxEXkPNDy9BFSokzTcQbA3SxgAAy2/25vWm4JSO+
6cw+KRDZUPcYrQTv/T+HhDG+shdA7IQDkF4ZnzgBQEz+s5b1pDgLLnAGXWQueXLa
9A3oAtaOdJjPa+ZqIYYIjSZ/2zKqGn96claPuKFy6X7duE+nYZdEEpqviF5D5OMx
0EnDJXTp8BDa2xLljOi7gWLUus9NL3NuBPWQA/awalQK/fpBdUer4jYzQ3hKP8Q6
eb0a/Gi21wHk0oFOC8sh8OC2FSaUdTC1d5N/vRa/L5vTQz8mp2JcmbEKHVkrvQKU
pCpSnwa5rFAIa7yP5AAlx0aN6GTJypmVRXsm4/kWgDyhzabgr15y1mWdbmPfbX74
84J55FTBvZdPOunTvYaHt689cQ7r0KC7VIlrkfhrOVpbvF2cGZysFp/8K1tmgR5u
3beZrYPiYmlxa2XsC40qZ5kueZpsrTW8EbhiJUKqEXoVc3OnXDLdHLc9drVimerK
YXrgdSMKfvuZJNe5OCet5+75CE3ZbgSxHyHAni8nAQg=
`pragma protect end_protected
// TX Buffer Registers
m3s005fg u5 (.xtal1_in(xtal1_in), .rm(mode[0]), .wdata(wdata), .rdata(txdata), .addr(addr),
         .val(val), .rd(rd), .tx_frame(tx_frame), .tx_ident1(tx_ident1), .tx_ident2(tx_ident2),
         .tx_ident3(tx_ident3), .tx_ident4(tx_ident4),
         .tx_data1(tx_data1), .tx_data2(tx_data2), .tx_data3(tx_data3), .tx_data4(tx_data4),
         .tx_data5(tx_data5), .tx_data6(tx_data6), .tx_data7(tx_data7),
         .tx_data8(tx_data8));
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
V2l/5BqYuzNX55nvuFQtHqGBKu6fqT/2k69jZHUDjYhZCj0XkIajVZ0JEB6r8mUE
1cRJ5uGy8iHdOKXp2gdGvOPUIsvHZtNTsJLvMGeCYZRrV6GA7zRsYjTNw5+uxF3q
IepHoqVqbDatUq2q09N3SDnqdU6qt53sGN+/3Wa4vGM=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
pC0SH6khbmx6nevnGnyGE/0Um4KxBgmfHRRlbxSjpqTbQPt95bQWYHpCVJyEv1Mx
WCT8FV5RGptaU4Dq7U6UOXszAUwv/xn37Gd9+R8QfU4Yy9wNTBXp0nlTgqXcms/g
rOMIplLluZa68hqH60wNBuWTFUDDMrZ38XqDZZsjIeI=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
HPG1AxqhbXTeXCAfWfQtiuKbKGnOEtNaNtuOM61CwjAhpf1xm9l85fHNnJjdz8iT
ndRm2eSFXXevbxUNlTdGwB5KCS2+gPhsICyzn+39BLGyagw/0+/T4wNUHdukWOGE
KEZcUP8fIBs6wXImNPC816JDrRh33+4xFec3ffz2iG+x2HnBd1Nq4E9wgyEf6NHv
07LHGMTM/yCYtzMSxt/9DauM89/cCFGhzhs8K6UB/k7UPiGA7oCCeZHee6VfvtRA
2o8tgvm4UuZ1e2ier7RvdA9gmcZTS4S5f8P18Mfpr3721yFAKBLiTGiAExS3Pm8a
if11FRmuf/xOiuccOFT0LrSOf8RQU/F3bnQePtNost06/BK4HlGasfsu8AA8RwB8
JqzpkUG1KIpv6jn1Z8laNJ1T5A9r7CHx6Esh4iyledHE7q6VgIoWwI084Tq4IybJ
lVrFY7OZBgbNIWubAcmt+12ss4NltxwMNXsvzfpXm19pikFrTML+d4uqOOgxh5tl
6U0403sSkjz/RPl6BIOv0vcYSN+zBbH3ve+mM31v7Y2ZTbALDG2g6zmxHzxcrfde
NMtWGlD0+8+5evIcX9XxU5v37nXNTP6VAaTnGAg7r6KAXqYd4tzVlq3p0sRA047k
xLGnYUUsBxlnmrOdOYC1Qzt7FDg2L6UnQgxrOcLXjSknec98QJC+67imYWxCZtH6
ADWBD8B+YjfTtwcqM6bfMrp48HBMAjTnwj0qt4C67/eNP3icmLNp9Wo10mxY84lS
4+uuU0P5m2eoc3wj9lIB2mwUWW8Borwd/rVhmG3ctMGp60nWzkAtNpiDIV6S1b7X
SDJsSnh5ABR3d9zvw45nsIWAdz4V8UXPa8TloHqI6X3Jdx6zLz3RolAqKLylK2Dv
4RytC6WsKNXvjDG4Qjsxc5dTku780dCGe2Y3EIOYxzDwu8pDJ6KNHQnO49u2GmO4
OtwXtRhL0h4CVact8dmAZA==
`pragma protect end_protected
// Address decode, Register file & Output data
m3s009fg u9 (.xtal1(xtal1), .xtal1_in(xtal1_in), .wdata(wdata), .address(address), .rdata(rdata),
         .txdata(txdata), .rxdata(rxdata), .state(state), .nrst(nrst), .val(val),
         .tx_control(tx_control), .rd(rd), .monitor_can_bus(monitor_can_bus),
         .cdr(cdr), .btr0(btr0), .btr1(btr1), .status(status), .cmr(cmr[4:0]), .mode(mode),
         .ocr(ocr), .clear_tr(clear_tr), .ier(ier), .ir(ir), .txerr(txerr), .rxerr(rxerr),
         .ecc(ecc), .ewlr(ewlr), .arbit_lost(arbit_lost), .rmc(rmc), .rbsa(rbsa),
         .sl_rxerr(sl_rxerr), .sl_txerr(sl_txerr), .sl_btr(sl_btr), .sl_rbsa(sl_rbsa),
         .arbit_lost_position(arbit_lost_position) , .illegal_sm_set(illegal_sm_set),
         .bus_off_reset(bus_off_reset), .sm_exit(sm_exit), .wakeup_int_en(wakeup_int_en),
         .acr0(acr0), .acr1(acr1), .acr2(acr2), .acr3(acr3), .amr0(amr0), .amr1(amr1), .amr2(amr2),
         .amr3(amr3), .addr(addr), .sl_rx_fifo(sl_rx_fifo), .rx_fifo_address(rx_fifo_address));
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
Xs/DjBq7Vz+sttTG0PehycOmDsrw+83cwQlIPzdFM8dYhB7JwyheXMhxI+FKHq2T
bRQkxun9dvo1lzLJwn79/TERVUrYKs1y4whVATbxOX8/sUczq5yu93Wd+efeKmYu
StTcHOf/wUC9paUJAALiXuDkp6Ny9DLSmS8nXP4W7L0=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
dWsccgo0WiBel5Ay/z/bdbiQTlOAgiZf11c0AeeQSRTAxaoj6hxsaCe4KRpytN6H
hguaRQrI97U4otL8L4qtjmMFtSJ4S+F24U933AAuuS8+WMbuJ1MdMDbgPsmAPwtC
xr+M/zD86NEQJVz4l9mTref3HqwWBl9XHO0uAYMtLr8=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
