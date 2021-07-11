#include "dac.h"

void write_dac_ch1_data(int val) {
 DIRA = val;
}

int read_dac_ch1_data(void) {
 return DIRA;
}

void write_dac_ch1_ctrl(int val) {
 DPRA = val;
}

int read_dac_ch1_ctrl(void) {
 return DPRA;
}

void write_dac_ch1_cmp(int val) {
 DOCRA = val;
}

int read_dac_ch1_cmp(void) {
 return DOCRA;
}

void write_dac_ch2_data(int val) {
 DIRB = val;
}

int read_dac_ch2_data(void) {
 return DIRB;
}

void write_dac_ch2_ctrl(int val) {
 DPRB = val;
}

int read_dac_ch2_ctrl(void) {
 return DPRB;
}

void write_dac_ch2_cmp(int val) {
 DOCRB = val;
}

int read_dac_ch2_cmp(void) {
 return DOCRB;
}

