#ifndef __DAC_H__
#define __DAC_H__

#include "pulpino.h"

/** DAC registers */

#define DACA_ADDR         0x00
#define DACA_CTRL         0x04
#define DACA_OUPUT_CMP    0x08

#define DACB_ADDR         0x10
#define DACB_CTRL         0x14
#define DACB_OUPUT_CMP    0x18

/* pointer to mem of dac unit */
#define __DT__(a) *(volatile int*) (DAC_BASE_ADDR + a)

/** DAC CH1 register */
#define DIRA __DT__(DACA_ADDR)

/** DAC CH1 control register */
#define DPRA __DT__(DACA_CTRL)

/** DAC CH1 output compare register */
#define DOCRA __DT__(DACA_OUPUT_CMP)

/** DAC CH2 register */
#define DIRB __DT__(DACB_ADDR)

/** DAC CH2 control register */
#define DPRB __DT__(DACB_CTRL)

/** DAC CH2 output compare register */
#define DOCRB __DT__(DACB_OUPUT_CMP)

void write_dac_ch1_data(int val);
int read_dac_ch1_data(void);

void write_dac_ch1_ctrl(int val);
int read_dac_ch1_ctrl(void);

void write_dac_ch1_cmp(int val);
int read_dac_ch1_cmp(void);

void write_dac_ch2_data(int val);
int read_dac_ch2_data(void);

void write_dac_ch2_ctrl(int val);
int read_dac_ch2_ctrl(void);

void write_dac_ch2_cmp(int val);
int read_dac_ch2_cmp(void);

#endif
