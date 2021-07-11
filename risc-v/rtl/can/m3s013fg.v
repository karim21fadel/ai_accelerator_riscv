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
// m3s013fg.v
// Error Management Logic
//
// Handles error conditions
//
// tx errors are : bit error
//                 : ack error
//                 : overload error
//                 : bit error DURING error frame OR overload frame
//
// rx errors are : stuff error
//                 : crc error
//                 : form error
//                 : overload error
//                 : bit error DURING error frame OR overload frame
// Revision history
//
// $Log: m3s013fg.v,v $
// Revision 1.4  2005/01/17
// ECN02374 RTL lint warning fix
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
module m3s013fg (xtal1_in, nrst, tx_error_input, rx_error_input, beie, val, rd, wdata, addr, error_time,
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
                 error_time_update, rm, lom, dominant_bit_occurred,
                 bei, bs, es, epi, epie, ei, eie, rx_error_next_state, tx_error_next_state,
                 txerr, rxerr, state, sl_rxerr, sl_txerr,
                 ecc, ewlr, error_passive, bus_off_reset, bus_free, clear_tr, receive_ok,
                 stuff_error_exception, increase_error_count
                );
input        xtal1_in;
input        nrst;
input        beie;                            // bus error interrupt enable
input        val;                             // chip select input
input        rd;                              // read/not-write strobe - can perform cpu update of txerr and rx_err registers
input        error_time;                      // enable for error processing
input        error_time_update;               // enable for error updating
input        rm;                              // reset mode -- unit must be in reset mode before txerr, rx_err can be updated
input        lom;                             // listen only mode - causes device to be error passive
input        epie;                            // error passive interrupt enable
input        eie;                             // error warning interrupt enable
input        bus_free;                        // 11 recessive bit times have been detected
input        clear_tr;                        // successfull transmission has occurred
input        receive_ok;                      // sucessfull reception has occurred
input        stuff_error_exception;           // don't increment tx error in this special case
input        increase_error_count;            //increment tx/rx error by 8 due to dominant bits after error flag
input        dominant_bit_occurred;           // incr rxerr count by 8 because dom bit is first bit after rx error flag
input        sl_rxerr;                        // synchronized strobe pulse for RXERR register
input        sl_txerr;                        // synchronized strobe pulse for TXERR register
input  [5:0] state;                           // internal state of device
input  [7:0] tx_error_input;
input  [7:0] rx_error_input;                  // error codes from trans/receiver modules
input  [7:0] wdata;                           // data input from cpu
input  [7:0] addr;                            // address
input  [7:0] ewlr;                            // error warning limit register
output       bei;                             // bus error interrupt
output       bs;                              // bus status bit, 1= bus off, 0 = bus on
output       es;                              // error status -- at least one of the error counters >= EWLR
output       epi;                             //error passive interrupt
output       ei;                              // error warning interrupt
output       error_passive;                   // flag to show device is error passive state
output       bus_off_reset;                   // put into reset mode because device is BUS-off
output [5:0] rx_error_next_state;
output [5:0] tx_error_next_state;
output [7:0] txerr;                           // tx error counter
output [7:0] rxerr;                           // rx error counter
output [7:0] ecc;                             // error code capture register
reg          error_passive;
reg          ei;
reg          epi;
reg          bei;
reg          bs;
reg          es;
reg          bus_off_reset;
reg          bei_1;
reg          bei_2;
reg          bei_3;                           // intermediate signals in bus error interrupt (BEI) signal generation
reg          epi_1;
reg          epi_2;
reg          epi_3;                           // intermediate signals in error passive interrupt (EPI) signal gen
reg          ei_1;
reg          ei_2;
reg          ei_3;                            // intermediate signals in error warning (EI) interrupt generation
reg          tx_bus_off;                      // flag when tx error count has gone to bus off level
reg          tx_error_passive;                // signal when device should go error passive because of tx errors
reg          rx_error_passive;                // signal when device should go error passive because of rx errors
reg          es_prev;                         // last value of es
reg          bs_prev;                         // last value of bs
reg          ecc_update;                      // flag to enable update of the ecc register
reg          ecc_update_toggle_latched;       // used to disable ecc_update
reg          ecc_update_q;                    // used to generate ecc_update signal
reg          ecc_update_qbar;                 // used to generate ecc_update signal
reg          error_active;                    // flag used to control active error flag sent OR passive error flag sent
reg          reset_both_error_counts;         // when recovery from bus-off rx/tx error counts are set zero
reg          tx_error_passive_plus_ack_error; // flag when tx is error passive and ack error occurs
reg          no_ack_and_error_passive;        // flags when no ack has occurred while error passive
reg          overload_flag;                   // detect overload flag should be sent and error count unchanged
reg          tx_error_exception;              // transmission errors where error count is not changed
reg          passive_previously;              // this flags if core was passive previously and now is error active
reg          bus_off_recovery;                // last bus free required before recover from bus-off
reg          cpu_forced_bus_off;              // force device bus-off from CPU
reg          rdcyc_ir;                        // flag read of IR taking place
reg [5:0]    rx_error_next_state;
reg [5:0]    tx_error_next_state;
reg [7:0]    ecc;
reg [7:0]    txerr;
reg [7:0]    rxerr;
reg [7:0]    tx_error, rx_error;
`pragma protect begin_protected
`pragma protect author = "MED"
`pragma protect author_info = "VirtuaLAB"
`pragma protect encrypt_agent = "RTLC VELOCE", encrypt_agent_info = "1.5"
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VERIF-SIM-RSA-1"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
DhFM3/+BD8RjUAycK857z3OzoISakTCjD/P8qknHyxKdRp2uaudgkLUwIS2CWkHu
+uofqMQZYglMRekDk7PQW6l8qZDUg01UZIe2ixMvlNAORhbVgAA8XmD4Nm2cGFMk
8A5zUXODWIAqXAUd/PDP6f02kSkvKVSJD7ONJIEjsbo=
`pragma protect key_keyowner = "Mentor Graphics Corporation"
`pragma protect key_keyname =  "MGC-VELOCE-RSA"
`pragma protect key_method = "rsa"
`pragma protect encoding = ( enctype =  "base64")
`pragma protect key_block
CfIGtvHXQwlo0jwDpq8UR/Gcw9czjnGFJkRDfyH7IH4Pj7Ao4nILzjmJPgO4J0t1
CazvpttSvTPUhqpUuwhdTCPjKA78z2H4Qa6aOU5x0gx8Mo64xbVdToNPf9hVswGT
zYiRIPF7lDjuIYuklCCuELbFG8Xqc8WCpjQ+mBdI1GE=
`pragma protect data_method =  "aes128-cbc"
`pragma protect encoding = ( enctype =  "base64" )
`pragma protect data_block
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
`pragma protect end_protected
endmodule
