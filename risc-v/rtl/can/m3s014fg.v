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
// m3s014fg.v
// Power-Down Control
// Revision history
//
// $Log: m3s014fg.v,v $
// Revision 1.8  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.7  2001/09/25
// Unused signals removed.
//
// Revision 1.6  2001/09/25
// Tidying RTL files for review.
//
// Revision 1.5  2001/08/30
// xtal1_enable inverted, becomes 'nxtal1_enable'
//
// Revision 1.4  2001/08/24
// Internally gated clock removed. Created 'xtal1_enable'.
//
// Revision 1.3  2001/06/26
// Change xtal1 to posedge
//
// Revision 1.2  2001/06/21
// Invert xtal1_out
//
// Revision 1.1  2001/06/14
// New files
//
//
// V1.0 - synchronous interface
//
module m3s014fg (xtal1, nrst, sm, xtal1_in, tx_enable, rx0,
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
                 sm_exit, wakeup_int_en, nint_in, nxtal1_enable
                );
input        xtal1;
input        nrst;
input        sm;            // sleep mode
input        xtal1_in;      // Xtal1 OR'ed with nxtal1_enable
input        tx_enable;     // Transmit clock, fires each bit time
input        rx0;           // CAN bus input
input        sm_exit;       // exit sleep mode
input        nint_in;       // NINT output fed back into core to cause wakeup from sleep mode
output       wakeup_int_en; // signal to produce wakeup interrupt
output       nxtal1_enable; // turns xtal1_in on or off
reg          nxtal1_enable; // En/Disable Xtal1_in clock
reg          wakeup_int_en;
reg          standby;       // after assertion of SM bit , oscillator continues for at least 15 bit times
reg          f_gate1;
reg          f_gate2;
reg          f_gate3;       // signals used in external clock gating
reg [3:0]    standby_count; // 16 bit times must elapse before oscillator turned off
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
RWJ4ZEZjeOF627/BtkFBrEA8mNTnGo8DVboyCZFvpB+l3zAgXVwzasxtzFiVvs10
dp/POuwWDH07MTjZ8qsFF9cRDcQ9l6RDeha7I0PwrU11LMmg1dQde4NVM0EPsdiI
UMQPA8QTj8wX0ClVnQ7dp+0HcvXwHRfMzDMYrDgF+6w=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
KqlFSpls8kHZI+g9ALLHyvrJrXlhpw2Oz1kzq9ibBc2L2wJGKaeEyVYU4qHXt9w3
AgG5QXL8nPqkZ9DuwTz2dgTDlUUV2y2gMit+kjSohYmS3s+8O/GiMVR9aUtjs0sF
8BM+XuP+dBAaewwygQkwu5nOHqeTbUVDHYiPy86fg3I=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
rmW4CNTKrj86Ez82IiQzZO1j8kqAfNZ+rEZ4pebsPhRoMEVDRYlkVp765/5bi188
7F+L0y9sePvNWsNR161Xs9S1vwkBgS2nJV7j+HXiJPQbvaFzU4HEzbZbWXarwLra
2ABMefgbMe80mPKVsarccQVKj6RoBFUZpvs/QTLrX2HfDw0vG37xZ/IHyq5CXJIj
ijgvQO0mODTDcnG9nPnSK75m39HL5aM91YLivOdgej4Xck7sAyHTwqdqXCr0/FxI
TzvMlF1pCTzj2PIFsS2ESqWuhzdyV0bnJrEVLnCtQbZlpgQ1VXx7K/jdkWEwXI4g
QofwTnaq7pWxn8GLwpyIdukp/eWRwx+p7qi/JqmSK2K5N/YlX6LtB0BEgGuj/0lw
QvPIOVnKZUJ2PDNVl+h9AL6sz5VDBGoBFIEW1rgSJG+IMfi+Eu3aAwTAj3ax4TdZ
PEAY2GezYL0mnRvKjCa2jLvJZu4mR6XmE0EQARRzWpxe54+eatFLcPo091jLNuCc
w0J+1VotdVehsr4IVpMuo0Dc9okbzG4olns5/8Y86tp4lWYnw7J+5uXKBQ8lvX4o
XBTfb7scPQZLBKXVK6A/q0GExO+iugHJjTXXUR2a6fQcUBjeurts8Iy0xmON60V+
PnKDqptE/txyLYSDnystuSnpIqDX1aY5bUpvbZWeWXrn7q0miHVTx9sdyYh9UO5y
Q4x8psQS+bmHgUsUkA6px4dCVvs6MtVzelTV8OxfeVo59RtoSbRbKdxPW15ccyGR
fz1Iymm16quYEEE7xXUQoVZoKQT+xqdJ6e6yHeFJtKiNxZ4bbY6rbwf6QsKcuIWF
a/tzS9E69AON/FbvYExfcR9WjHXf37ER1fwLxVFLX4LYX8NgbBrWugb4Ryw3gxfk
4+jnw3PktRrxuNIzs3fgFN60GsQtfTP3Om2gUbhJEKyC1zipVJqHfOxv9gNs7rcn
j8GfsxAP/K9/Q74mgMaN119TtvDkEKa0+s1HWDhQHGs7wFhDqk7AxsmxSiYpGAny
+TDLOqZ6ifa4+4Jt+9HGHMTFQhXYhJnm+AuNclPyv02WStFqZ96E7PIZyEenCOEv
4E6pGRRBnCCFgazZuwWsQWRU9xo5TUW/a5i/148dQ5Cf5G9wtYllAk07XaiQlhsb
Rl50h2AGL/IqNEj7m+nzjMwKmJExeYnoHk+fvd9vGC4PKZT75Bpwe4wyTa+fZMjw
B19T6V7YErGGcjXyU905yQN/n0erxI2Y7A/+uAi7G1T12OivLdsYaX/WSu3DUJvK
C2rOiPaSG0jcj1sYbVEnpfJCvRn6yspP0JtDNpAE7OooxFrTIybCP2aHU9fI2Esr
yDUXXPsC5vU1OQeSp2ypkDGPJAxv9Zfeg47VaqjJsBr8SKoUgx8dAJBvNKtVwG7g
7Ba/y6pMXDIotuqWFskL2su9OxSdXg/BpPxcY3unScn1+yUBv6j0/KnMDIbUT6n9
z/aAi1UUi7euUxbwxApm58Fk+dwFVD0oYj/tPK63mV4SqyCMciCz7K1rY1NCm+gU
5ZJQp4WTAKpdJMDWeb7wbdBCiVqZxWrqUdXb/aeUGMqj63ilY1qm+Rua7SguWvPH
8FpP58LzcenRwXljE0dG5jFVkrekBd/iRTtq0vuxPq4wSn6R9EhMqeqY0LR5u8H6
2sDayazjxDYIfVXZaBLMZmmUm6HcXlLJee9Rq8KjhP4xHbuq369mNuJbL34GYA+L
NNuCgK/NCUCDYwJOI6tw9BDE6X4XOfd/Tb+0VNLsRua05J5kmw68sOxogZo67m58
9V7PxFJ+I3BqsAdeFEZOqWNco+oYuKqdVXA79tmd3ErOfFa+TMR3PFNYl8CTE20r
sFuGXJiQTdnPeXGevvovNclMDj8norvwB2Yz8/o/Fesv5cefyKyohe56O1cDve/5
d4ix4/dS0TlWSCnsMKPcR2LUKUxZFXFiz76EF1nftaaGN+c/ANLJXHbYEErF785h
ZU+ZeHQdo3GVYS1j+n/sns1Wla9w1hnlh93KuwzupsSihNPjk0A3nO+6Kj5ltXGs
4iUqe/7BdWRDnwtkDck4COLuXcXTwZm/5SI8pK+grwoWdIQhBFzTDRunvVTGCCbo
xpVzY/atpFkWpQcI4gMBYSaiXOZD8/AGFtybW0hY14JYzm3AMlB5SX/efxHDCh5W
NCEB6H0014Or5B9ool5WCIoE95ZoQy0CLMe6x2p3W5g=
`pragma protect end_protected
endmodule
