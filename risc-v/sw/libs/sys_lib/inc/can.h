#ifndef __CAN_H__
#define __CAN_H__

#include "pulpino.h"
#include "stdint.h"

#define CDR_ADDR             0x7c           /* Clock Divider Register */
#define ACR0_ADDR            0x40
#define ACR1_ADDR            0x44
#define ACR2_ADDR            0x48
#define ACR3_ADDR            0x4c
#define AMR0_ADDR            0x50 
#define AMR1_ADDR            0x54
#define AMR2_ADDR            0x58
#define AMR3_ADDR            0x5c
#define OCR_ADDR             0x20          /* output control register */
#define IER_ADDR             0x10    
#define MODE_ADDR            0x00          /* Mode register */    
#define BTR0_ADDR            0x18          /* Bus timing 0 register */ 
#define BTR1_ADDR            0x1c          /* Bus timing 1 register */ 
#define REC_ADDR             0x38          /* Receive Error Counter */  
#define TEC_ADDR             0x3c          /* Transmit Error Counter */  
#define STS_ADDR             0x08          /* Status register */ 
#define INT_ADDR             0x0c          /* Interrupt register */
#define IEN_ADDR             0x10          /* Interrupt enable register */
#define ALC_ADDR             0x0b          /* ALC Arbitration lost capture register */
#define ECC_ADDR             0x30          /* ECC Error Code Capture register */
#define EWLR_ADDR            0x0c          /* EWLR Error warning limit register */ 
#define RXERR_ADDR           0x38          /* RXERR Receive error counter register */
#define TXERR_ADDR           0x3c          /* TXERR Transmit error counter register */ 
#define RMC_ADDR             0x74          /* RMC Receive message counter register */
#define RBSA_ADDR            0x78          /* RBSA Receive buffer start address */

#define RCV_F_0_ADDR         0x4c
#define RCV_F_1_ADDR         0x50
#define RCV_F_2_ADDR         0x54
#define RCV_F_3_ADDR         0x58
#define RCV_F_4_ADDR         0x5c
#define RCV_F_5_ADDR         0x60
#define RCV_F_6_ADDR         0x64 
#define RCV_F_7_ADDR         0x68
#define CMD_ADDR             0x04          /* command register */

#define RCV_ID0_ADDR         0x44
#define RCV_ID1_ADDR         0x48


#define TX_F_0_ADDR          0x4c
#define TX_F_1_ADDR          0x50
#define TX_F_2_ADDR          0x54
#define TX_F_3_ADDR          0x58
#define TX_F_4_ADDR          0x5c
#define TX_F_5_ADDR          0x60
#define TX_F_6_ADDR          0x64 
#define TX_F_7_ADDR          0x68

#define TX_ID0_ADDR          0x40
#define TX_ID1_ADDR          0x44 
#define TX_ID2_ADDR          0x48  

/* pointer to mem of register */
#define __RPINT__(a)  *(volatile uint32_t*)  (CAN_BASE_ADDR + a)

#define __RPCHAR__(a) *(volatile char*) (CAN_BASE_ADDR + a)

#define CDR  __RPINT__(CDR_ADDR)
#define ACR0 __RPINT__(ACR0_ADDR)
#define ACR1 __RPINT__(ACR1_ADDR)
#define ACR2 __RPINT__(ACR2_ADDR)
#define ACR3 __RPINT__(ACR3_ADDR)
#define AMR0 __RPINT__(AMR0_ADDR)
#define AMR1 __RPINT__(AMR1_ADDR)
#define AMR2 __RPINT__(AMR2_ADDR)
#define AMR3 __RPINT__(AMR3_ADDR)
#define OCR  __RPINT__(OCR_ADDR)
#define IER  __RPINT__(IER_ADDR)
#define MODE __RPINT__(MODE_ADDR)
#define BTR0 __RPINT__(BTR0_ADDR)
#define BTR1 __RPINT__(BTR1_ADDR)
#define REC  __RPINT__(REC_ADDR)
#define TEC  __RPINT__(TEC_ADDR)

#define STS  __RPINT__(STS_ADDR)

#define INT  __RPINT__(INT_ADDR)
#define ECC  __RPINT__(ECC_ADDR)

#define RCV_F_0 __RPCHAR__(RCV_F_0_ADDR)
#define RCV_F_1 __RPCHAR__(RCV_F_1_ADDR)
#define RCV_F_2 __RPCHAR__(RCV_F_2_ADDR)
#define RCV_F_3 __RPCHAR__(RCV_F_3_ADDR)
#define RCV_F_4 __RPCHAR__(RCV_F_4_ADDR)
#define RCV_F_5 __RPCHAR__(RCV_F_5_ADDR)
#define RCV_F_6 __RPCHAR__(RCV_F_6_ADDR)
#define RCV_F_7 __RPCHAR__(RCV_F_7_ADDR)

#define CMD __RPINT__(CMD_ADDR)

#define RCV_ID0 __RPCHAR__(RCV_ID0_ADDR)
#define RCV_ID1 __RPCHAR__(RCV_ID1_ADDR)

#define TX_F_0 __RPINT__(TX_F_0_ADDR)
#define TX_F_1 __RPINT__(TX_F_1_ADDR)
#define TX_F_2 __RPINT__(TX_F_2_ADDR)
#define TX_F_3 __RPINT__(TX_F_3_ADDR)
#define TX_F_4 __RPINT__(TX_F_4_ADDR)
#define TX_F_5 __RPINT__(TX_F_5_ADDR)
#define TX_F_6 __RPINT__(TX_F_6_ADDR)
#define TX_F_7 __RPINT__(TX_F_7_ADDR)

#define TX_ID0 __RPINT__(TX_ID0_ADDR)
#define TX_ID1 __RPINT__(TX_ID1_ADDR)
#define TX_ID2 __RPINT__(TX_ID2_ADDR)


#define CMD_CLEAR_RECV_BUFFER   0x04
#define CMD_TX_DATA_READY       0x01

#define CAN_PAYLOAD_SIZE      8
uint8_t getCanStatus(void);
void initializeCanController (void);
void waitForReceivedMessage (void);
void receiveCanMessage(uint8_t canFrame[CAN_PAYLOAD_SIZE], uint16_t *frameID);
void sendCanMessage(uint8_t canFrame[CAN_PAYLOAD_SIZE], uint16_t frameID);
#endif
