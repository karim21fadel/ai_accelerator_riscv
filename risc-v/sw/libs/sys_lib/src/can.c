#include "can.h"

uint8_t getCanStatus(void)
{
  return STS;
}

void initializeCanController (void)
{
    CDR  = 0xc3;
    ACR0 = 0xff;
    ACR1 = 0xff;
    ACR2 = 0xff;
    ACR3 = 0xff;
    AMR0 = 0xff;
    AMR1 = 0xff;
    AMR2 = 0xff;
    AMR3 = 0xff;
    OCR  = 0xdb;
    IER  = 0xfb;
    MODE = 0x09;
    BTR0 = 0x00;
    BTR1 = 0x25;
    REC  = 0x14;
    TEC  = 0x1E;
    MODE = 0x08;
}

void waitForReceivedMessage (void)
{
    uint8_t read_data = 0;
    do
    {
        /* The first bit of the status register is set to 1 if a message is available in the receive buffer. */
        read_data = getCanStatus();
    }while ((read_data & 0x00000001) == 0);
}

void receiveCanMessage(uint8_t canFrame[CAN_PAYLOAD_SIZE], uint16_t *frameID)
{
    waitForReceivedMessage();

    uint16_t id0, id1;

    /* Sequence to read registers  at the receiver side */
    canFrame[0] = RCV_F_0;
    canFrame[1] = RCV_F_1;
    canFrame[2] = RCV_F_2;
    canFrame[3] = RCV_F_3;
    canFrame[4] = RCV_F_4;
    canFrame[5] = RCV_F_5;
    canFrame[6] = RCV_F_6;
    canFrame[7] = RCV_F_7;

    id0 = RCV_ID0;
    id1 = RCV_ID1;

    /* Clear receive buffer */
    CMD = CMD_CLEAR_RECV_BUFFER;

    *frameID = ((id0 << 8) | (id1 & 0xe0)) >> 5;
}

void sendCanMessage(uint8_t canFrame[CAN_PAYLOAD_SIZE], uint16_t frameID)
{
    /* Set the CAN frame ID */
    TX_ID0 = 0x08;
    TX_ID1 = (frameID >> 3);
    TX_ID2 = (frameID << 5) & 0xff;

    /* Set the payload */
    TX_F_0 = canFrame[0];
    TX_F_1 = canFrame[1];
    TX_F_2 = canFrame[2];
    TX_F_3 = canFrame[3];
    TX_F_4 = canFrame[4];
    TX_F_5 = canFrame[5];
    TX_F_6 = canFrame[6];
    TX_F_7 = canFrame[7];

    /* Set the command register to indicate that Tx data is ready */
    CMD = CMD_TX_DATA_READY;
}
