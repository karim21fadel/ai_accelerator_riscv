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
// m3s008fg.v
// Bus Input Filter
//
// Filters and synchronises the CAN bus input
// Detects stuff bit also for receive and transmit operations
// Revision history
//
// $Log: m3s008fg.v,v $
// Revision 1.6  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.5  2004/10/12
// ECN02321
//
// Revision 1.4  2004/09/02
// ECN02305
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
module m3s008fg (nrst, xtal1_in, nxtal1_in, rx0, prev_bit, state, sam, sample_time,
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
                 sample_time_ab, sync_pulse, stuff_detected, get_sample, sl_btr
                );
input       nrst;
input       xtal1_in;
input       nxtal1_in;           // should be connected to the inverted xtal1_in clock signal
                                 // to operate on the negative edge
input       rx0;                 // CAN bus input
input       sam;                 // triple sampling mode if set, single sampling mode if low
input       sample_time;         // sampling time
input       sample_time_ab;      // sample time enable
input       sl_btr;
input [5:0] state;               // CAN state from state machine
output      prev_bit;            // used to deter if can use sync edge
output      sync_pulse;          // synchronization sync pulse for hard synch and re-sync
output      stuff_detected;      // flag stuff bit has been detected
output      get_sample;          // rx0 single or triple sampled at sample time
reg          sync_pulse;         // detected RX0 edge
reg          stuff_detected;     // flag stuff bit detected
reg          sample_a;           // triple sample mode RX0 samples
reg          sample_b;           // triple sample mode RX0 samples
reg          q1;
reg          q1a;
reg          q2;
reg          q1_bar;             // signals used to sync rx0 neg edge to xtal1_in clock
reg          prev_bit;           // prev bit sampled on CAN bus
reg          get_sample;         // rx0 single or triple sampled at sample time
reg [2:0]    stuff_counter;
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
Ms7hsG8dqUFDHUlpc4APFxoyw0dKDYpHSnGznRJFqfOTJep8rFbvSYOI9ZuOlfwH
LyUluetQnVlcbpTNdJHNE0RyAqNgepLx3ZrZMb/qnwyozfSVWQ3EXUf6jBxfguBx
v+jbZNfTzD7+U5vWkKvOhNyrkMuCMLKWDuqo9EsgAOs=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
PIbqgj5hYhW2NIKc6nFZUAU+8Govz3D0xoV/M18X/l8+gc+8eb1vDkS9NY1O+lSL
e/qgFtLWZO12bkt0UrIkkmiYtYwoQjdohLYPg8jagERqtpQfbGoVQ1NNwhC8i7xc
tbu79/yLs778Z8nweFPKpdlkauIK1idn+X9qPg/jeTY=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
w6Zt2ilhn9W15HsMuDIOMAeixLMLr7nmJZBqbfPpZrzRw1Qs2mvFLhLVyBnsgnoZ
XfMeycG9zci+XhPFrokkbbYuiBi8nTSGL1VuU8MUAuiRCP97cQVrfrWn3C5anjB8
8ODdi2AfR2Uq3B3RxjgdmcdL0btsgGHDbqNiWVb3UKW0L2FrWpJ9c/BFyg+5xbn5
FCK4siftwOxJ9aeX9ySKR8hYX5u4yQj1fXgJ1/fNzo92EaGqLgkB4UBlxXCRIWsS
9eCRSDjSpsmCwzOLmt0BbwNEvjr/+KMvFbxci/5YnCabqgkQGhK31j5zhxOOPB7k
61QJoU88b5Aw4n3Po//7OgJatEl62VtEHeP0Hf9bkGHma0/w0vmaY2owE38xHqje
dYOPe/6YXZGt09wgFP5tbRHAEZC7XsC0s0iwtoo394aVCuCahFe2wJh6dfn1wFyA
lhoQD0zLaWjvFiX5FOMz9YVI5FqUviaVWI3h0d/4KiCIwFMxfhgtc4mrQBvlmPt8
lTNTNPYRtC9g78boMU164As0YLFysUpQJa3gK1DNq3L37RI0g4ORvtMTj3worCkB
VnnrjEHSp6gUPvccfaKOn7mjAI6pBpu0UjDR/gr4v2cGZDYVbHFRphQI2uidX7yS
Tluzh3S5vgfJ5baxKT2qiXwYKGAVrDtcakdCIxoXM4fsesI43J61eiUzKAK/QxoQ
jdn2kLJPBQCo4Q7JkySYiOX6cF8rQpsb7yyEPvwyd46JRc2Y0Lsa/gukeU2WfRwd
asThaAMCJSoD1yJheVQWmf0k5mF2gBCAwHwZaNCOXRaCX9F6nARUrrqhEPXAJVg5
QUffBVgnzaYNgHo3ciStOKSIlnHZYNCMCj5pG6qt1z3d+D7J74VNNIrZux7Hr6Fj
sQFIubtMNnBLGDW0Kan8Nv8tn3VJ1TgEKJZig4iPYpjcfBJtG6qlMpjZUe2Vrnw9
lcFdpDItcuMoxyCXD0zrNcgPQ+uC1AK0b5FAYkaOZfZInawH/6HrXgdyWD8Oyp7w
9PfOMmeyjeW4CfyfCVGmDg7Y/UNwWaSLKW6FA2H8JyA0mnQ7Q0OqTOpDPoR60H3x
sO0atntVLg4pnl8yQyqCKB5wrvXDZJjMIXKz8eIFWJ7MIlF/OVqmLWjI5L0ODwD9
Kol3KHRyQGAthS3gDWkmQK9kTubTFoC29xxJzujSvHAnQ/wPabnu4wwUVzxwk0Sc
crquxfyOtPLYR5QPjNV5Ia7WcCBCM3x1crLTW6b24Ygdoa14odCJ9MKliTcMnEks
LZ61sEeqbfz+It/04VK1kp4steN7d+/hx4jM3vpo+PbAakw1uvaVTEJ0xs1fqNh+
lB1J2YP5XEDPqlLbH5ktdTEjKxXkuU6jGV6wf1mBx+M+E+HSehKyx7I81deLtFyJ
kBIKUy2cVeRGii+ynj6QQ9v28paLCX97BVlmmnOdaN8O7mof/Y7riBekrUdikZ5+
c8GBo6lwc4T77xIdeJbh1l72wtX94MDjoKnQX0U/MIiN82zmTOgRdmNNm+jz3565
84kbQnCqM03tNBX83ouvZnZPKPbRXspy0GzHe9ysHqhN86lBWbj3pTe1TQZJERg1
YS6yPhnT2NLCiWNzQ2m3k7mt7WdAukBNTosUiAzvBRXewhqQS6wefWZQjO96Z1DW
A7Mwzhpj7l35C1Gm/Uk7lDacNt/19ajsHuUZJpAjIdsHyQdsR1gmaJV5v/03nZWp
oXjBiuPib5YGz/EIiI01el+fECJLiX+TLknb5kzQg2k5YuYjqFZi8RQw/Lni0BgS
yakEuiZ1CTcZhpnW0Iua3bN07k/QEKTwYx4bpOpzMj3zJFWnv3J3GOlx2Wi3Ywjc
XpsCjH/dLwMDMlA5CjuUyvWdryQZRdty5lI6mBu5A1aSdwKWP+PTzeOlqPPDQv/q
nMpzAh04WQdUKYSwXoYW78yCnKHoeZS9+ZI6VUdUypZsyZSFqFhH287u357ehbLR
2UuLJwD5jUZGeOz3GhAdmMPJTLkUE2+1ZMbC3wqBvKGHS58h6CsfkuBoPLbWmI29
KA1jxL17aJ3k9rT4BQZvHVU7anzZyFEB/mSczOxeannppZhKtCAOI1m6o2hJBcwI
0ZCNSyPRSNkwqXE11ss+PstWwlbIuKeHJX0ZpVeD1BYPEyDZy9MYnCdfuYM6W5Ug
w5NTonrOVRlg/kHpiNeK5osHYBA95dzWxDC5m4WEENehy/LRTLG2zx8wjiRr16vd
eL+1tkkVxlOkj9bvn/hkFjfndXy5ZZROrWkBIxccjoWp9r1uTn0RNJKbDSz4GazX
LD8keK6X42I0jIHapZ1kvccbGGcqZbu9Cx3QUHY5YXIlBwj3RWrvWj2gUJ3XjOda
+UDgrYBUAnIoHrm3HVLFApKPGO85qPgoi0zQwrG1VKSaxGxWeZc3D82mduyMTt7r
TQaHR+XxFJCrKcOYECsy+NEJNhBaeQIVJu0Yt9L0bSt7HiApNzEjv/XQoCfaqZ16
I5fgpf6G4gF3m+23j7jWT3ALGsbKyrNxrX42ZV+301l03sUCmOFvb5H8WoO+lI7J
kp8JR6QqLUV7/dAjKpPKEEU+pjbQurZE5Zu5L0sA5NgXOfb/Ic23NNxnGHPVBYLg
8UZRXy+XJ3I6N/9OJva8p26am0gjn+fXecbZ7Vo1zluXJqwNgYkl7h3G6SG72H9j
w3nPXI4WcNrgnzw5HCrA6cOvwwTZ7axNU/M87gzI0buv0dsWrTXMqaBZOtxY0GBF
7DkcAis17K1UJfF9dz8d6MwKZRxLb/YUQzuwdF0SfcxeQ7DDpXNMXowrcc0+Ad1w
eQMgf4VG/UqYHShttETxqZ0uoFwMLc1xXKio7EtUgJbsXhyMNf1ijfg7REB30UTH
KlT83ujQwTe0nK0jdm8grFro3H1vSuOj/rOnxhL6btGu7+S0ALCH1ATweNrV467K
/k3avaWs4S/xXgX0kJ20e1l30Crpda6gNbEA8HxwFmUeMhnInGdx7fopYLZ+uP/m
7MrM+Ei0GnYwtksPq8+h6IktDegLeT6f1eEItUr9Nqo/H657jAheFNnVAM/iM4XB
PyITXR8ae1xvuFcfXPlSFnf0RMV0cTXWbDBpPE7y6lGmNPiFwwBfzUeX0gXVNifK
biAUoDJCicQdP3JdPyEAh4mERxW1NCz29H9294Bd+BTBsOqOIV2xjiG3kdRGc7Db
Jtr59cFrLLeQBrB+IlbRHd5QeLAmwRjvD2nGycxiFAoPh8nkigGGxmFUm+3wRbNm
dhKwpD9hq3dCT1HmJyJiEvgjZKYyRw9nA4Kr8L81qhQPjwMMlCDn0Dut29TrpQm8
D+bdys3JW4F2h68iw36c+DGXsnkq0wsopSY5Fa8IXztwcC1w6L2wvh00XMW/2RUl
x/2pUlDh5uNPy/xGcEOl3n3y8aNRJ85KQKCz4ONQ9UGFUmZaOO7ytjOWc+RnvImR
OSQEHiMBlTh1sPfGxiQyledmWYSTCjr84OSedBB9J56cN1Gj11fUuLgA0GWF9h7B
ejzVoinmqfxzYQIEn7FLuSc8Te65IoSxlOXT8zh7NPa5lYA0nQGQkk3rbkXbps9b
XmduZc0N56Ute8b8O6eAQY6BPihRPrsgsiP2uMRxsy23mBRHLrD6j3JDYSwx9dL3
H4pFX7YE+FC4Vml1+xlMZwccWwfGT5igk1/AuXmg1QCx0E+2fxjwrfeZD4oy2Z1s
qEpBbJcNQbrUJuUI+XIs5Ga1aURPUoJo5+tG3xcLGWKU2s8U+PMZpnGQASqbSIiY
4AJtyHB+8bETfKvR/DWi2yZAdv8pynoafMXFuy1JiS4v5ueqvZS70OYUjduxaaSS
DfIXdIM1hYWA8RyUUODJ87AVMKWBgFKRo+WCei/CGBNO9aLI3YTY/XaH2iubsRA8
1dyl5fJs20MLkouglYvNAV53vorzQEHOBGdzaVs2nZey4H4uvSXFQt51B4lLRw+r
EPE6QGDgroEVBrcC0u3wjscZ+LAlykHMwbKatJ6WTSmJT3koX0DlGEb3EC657tqq
NSkONjuA02pezBwMzYq2PMgMWhS/+x9xwODyVUC6J1bFkjJTAt1nTgMgrRP9t/N5
sFymKniRy8uyjQY9hQjaS96Aajwa5yA/HHXDKpUeIs7JgRmHJNfxlIDpJHfBgkbT
kJPUm4lVB0tJOdrlYt4WrNkI5xNCeLd+T3gR5PN8MvQtdexH4u1naUUqCXmP9DUl
7j8NYHtDcTAfnQQ/KLxp6w51V15hHB/CeXgS+xGB1xQ8cNEgWY3qXAXWTYgKHbe/
`pragma protect end_protected
endmodule
