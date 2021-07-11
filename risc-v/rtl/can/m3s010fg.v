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
// ms3010fg.v
// Can Baud rate generator
//
// Bit rate is fixed number of Time Quantum in CAN protocol
// Time quantum is a fixed number of external oscillator clocks (xtal1_in)
// Baud rate is the bit time for each transmitted bit sent on the CAN bus
// Bus timing register 0 (btr0) and Bus timing register 1 (btr1) setup here
// Revision history
//
// $Log: m3s010fg.v,v $
// Revision 1.11  2005/01/21
// Clean synthesis warnings
//
// Revision 1.10  2005/01/17
// ECN02374 RTL lint warning fix
//
// Revision 1.9  2003/07/30
// ECN01953: VN-CHeck code issues
//
// Revision 1.8  2003/07/29
// ECN01953: VN-Check code issues
//
// Revision 1.7  2002/09/27
// Changes made to U10 to reject bus noise, testbenches updated
//
// Revision 1.6  2001/09/25
// Tidying RTL files for review.
//
// Revision 1.5  2001/07/31
// Changed edge_time_quanta width for consistancy
//
// Revision 1.4  2001/06/26
// Change state and associated signals to 6 bits
//
// Revision 1.3  2001/06/20
// Add reset to flip-flops
//
// Revision 1.2  2001/06/14
// Files tidied up
//
// Revision 1.1  2001/06/14
// New files
//
//
// V1.0 - synchronous interface
//
// Include MCAN2 states
`include "mcan2_state.v"
module m3s010fg (xtal1_in, nrst, wdata, addr, val, rd, rm, tx_clock, tx_enable, state, btr0, btr1,
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
                 sl_btr, sync_pulse_in, sample_time, sample_time2, error_time, error_update_time,
                 sample_time_ab, sample_time_d, current_state
                );
input        xtal1_in;
input        nrst;
input        rd;
input        val;
input        rm;                           // reset mode asserted
input        sync_pulse_in;                // synchronization pulse for hard synch or re-synch
input        sl_btr;                       // NWR strobe signal for BTR registers sychronized to xtal1_in clock
input  [5:0] state;                        // current_state of the can
input  [7:0] wdata;                        // input data
input  [7:0] addr;                         // address
output       tx_clock;                     // Baud rate, fires each bit_time period
output       tx_enable;                    // tx enable for tx_clock in xtal1_in domain
output       sample_time;                  // when to sample the CAN bus
output       sample_time2;                 // when to sample the CAN bus
output       error_time;                   // when to flag bus error interrupts 1 Time quantum (TQ) after sample time
output       error_update_time;            // when to update error count , 1 clock cycle after sample time
output       sample_time_ab;               // sample times used in triple sample mode
output       sample_time_d;                // delayed sample pulse
output [5:0] current_state;                // current state of the device latched for an entire bit time
output [7:0] btr0;                         // the bus timing register 0 contents
output [7:0] btr1;                         // the bus timing register 1 contents
wire         pe_gt_sjw;                    // Phase error greater than SJW
wire [2:0]   sjw;                          // Synchronisation jump width
wire [2:0]   tseg2;                        //tseg 2 value
wire [3:0]   tseg1;                        //tseg 1 value
wire [5:0]   brp;                          // baud rate prescaler value
wire [5:0]   nominal_bit_time_quanta;      // nominal bit time length in quanta
wire [5:0]   nominal_sample_time_quanta;   // nominal sampling point in quanta
wire [5:0]   nominal_sample_time_quanta_m; // nominal sampling point in quanta -1
reg          tx_clock;
reg          tx_enable;
reg          sample_point;
reg          sample_time;
reg          sample_time2;                 // sample time delayed by 1 TQ
reg          error_time;
reg          error_update_time;
reg          sample_time_ab;               // first and second RXO sample
reg          sample_time_d;                // sample time delayed by 1 clock cycle
reg          tx_count_reset;               // reset for tx count if h/w reset or write to btr1
reg          scl_enable;                   // fires 1 xtal1_in clock before SCL high
reg          adjust_bit_ok;                // flag to show latched edge time correct
reg          sync_wait;
reg          sync_enable;                  // there can only be 1 synchronization per bit time
reg          sync_pulse;                   // RX0 synchronization pulse which is enabled by sync_enable signal
reg          transmission_state;           // the current_states where device is sending something on the CAN bus
reg          hard_sync_state;
reg          hard_sync_enable;
reg          re_sync_enable;               // enable for a re-sync signal
reg          hard_sync_signal;             // if hard sync pulse occurs latch it
reg          re_sync_signal;               // if a re-sync pulse occurs latch it
reg          current_bit_adjust;           // bit time shortening/lengthening can occur in bit time
reg          edge_in_sync ;                // flag to show re-sync/hard sync edge was in sync bit
reg          edge_in_tseg1;                // flag to show re-sync/hard sync edge was in tseg1 bits
reg          edge_in_tseg2;                // flag to show re-sync/hard sync edge was in tseg2 bits
reg          tx_count_restart;             // restart the tx (transmit clock counter)
reg          tx_enable_internal;
reg          sample_count_restart;         // flag to generate a restart of the sample counter
reg          force_restart;                // force shortening of bit time due to re-sync/hard sync
reg          force_sample;                 // force sampling point assertion
reg          error_update_time_i;
reg          now_at_sample;
reg          now_in_tseg2sjw;
reg          now_in_tseg2;
reg          now_in_ipt;
reg          wait_for_sjw;
reg          now_tseg2_endable;
reg          tx_enable_test;
reg          inhibit_tx_enable;
reg [5:0]    current_state;                // latch STATE value for entire bit time
reg [5:0]    edge_time_quanta;             // latched number of time Quanta when re-sync/hard sync occurs
reg [5:0]    phase_error;                  // the amount bit time must be adjusted by
reg [5:0]    tx_count;                     // tseg counter for baud rate (tx_clock)
reg [5:0]    tx_endcount;                  // sum of tseg1 + tseg2 + 2 + 1 (extra scl needed for SYNC bit)
reg [5:0]    tx_count_adjustment;          // adjusted count when re-sync/hard sync occurs
reg [5:0]    sample_end_count_p;           //number of scl clocks (time quantums TQ) to count before sampling
reg [5:0]    sample_end_count_m;           //
reg [5:0]    carry_over;                   // amount subsequent bit time is shortened
reg [6:0]    scl_endcount;                 // needs to be 7 bits because = brp + 1
reg [6:0]    scl_count;                    // brp counter for scl, quantum periods
reg [7:0]    btr0;                         // bus timing reg 0
reg [7:0]    btr1;                         // bus timing reg 1
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
lxZHv6yc1vDKApGW+Rty2CcgJCuATtmSbno4bWByLwLZ9C3LtvhtoXN1UXIVfLcb
nnkq5w/ytZh98Gx2OyIUhxhVMZLOiFZT219NUMI1ykv1fB//Pe1RZ1zWLzmmulTW
eIrHCIgjR/jR5xgSWwhcGLDlaDrYnjrjkTmZGgWwzBI=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
cwLzSVSp83EjLySm7AM23g9pA6y33bnXK9MpVj8TftTRkamuKZt4YETjgAOQ+OEt
/EkySBDaMnbeL+JU7On0r1vUAk4iEACisqReNSzwUvoJOuU1y3eOVV4hux62hSnM
kbSBN1VH+s9QqY2F7VLL6/sm3RL2JFkPAGa/+/W4L3s=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
endmodule
