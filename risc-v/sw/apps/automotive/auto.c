#include <stdio.h>
#include "dac.h"
#include "can.h"

// Enable this for test mode
// #define ENABLE_RPM_SPEED_CALC

#define ENGINE_CMD_RECEIVE_FRAME_ID  		     0x01
#define SPEED_RPM_SEND_FRAME_ID       		     0x20 
#define BRAKE_ANGLE_RECEIVE_FRAME_ID_MANUAL      0x70 
#define BRAKE_ANGLE_RECEIVE_FRAME_ID_AUTOMATIC   0x71 

#define BRAKE_ANGLE_POS 0 
#define ACCEL_ANGLE_POS  1
#define COMMAD_POS 0

#define COMMAND_IDLE                   0
#define COMMAND_ACCELERATE             15
#define COMMAND_BREAK                  255

#define SPEED_ACCELERATE_STEP          300
#define SPEED_BRAKE_STEP               500
#define SPEED_IDLE_STEP                100

#define RPM_ACCELERATE_STEP            15
#define RPM_IDLE_STEP                  75
#define RPM_SWITCH_STEP                45

int main () {
    unsigned char  frameReceived[CAN_PAYLOAD_SIZE];  // data field of the received can frame
    unsigned short frameID;

    unsigned char  acc_angle;           // acceleration angle 
    unsigned char  engine_command;      // engine command 

    int            brake_angle;         // brake angle 

    unsigned short maxRpm = 0; 
    unsigned int   maxSpeed = 0;
    unsigned int   currentSpeed = 0;
    unsigned short currentRpm = 0;
    
    int i;

    unsigned char frameSent[CAN_PAYLOAD_SIZE];      //data field of the can frame to send   
    
    printf("Starting transmission control application... \n");
    initializeCanController();
    printf("CAN controller initialized... \n");

    write_dac_ch1_data(0x1);    /* write to DAC - test pattern */ 
    printf("Test DAC -> FMU ... \n");

    //-- TO-DO: move from polling mechanism to interrupt driven (CAN has already 4 interrupt lines defined) 
   
    while(1) {
        receiveCanMessage(frameReceived, &frameID);

        if(frameID == ENGINE_CMD_RECEIVE_FRAME_ID) {
#ifdef ENABLE_RPM_SPEED_CALC
            acc_angle          = frameReceived[ACCEL_ANGLE_POS];
            engine_command     = frameReceived[COMMAD_POS];

            switch(engine_command)
            {
                case COMMAND_IDLE :
                {
                    if(currentSpeed >= SPEED_IDLE_STEP)
                        currentSpeed -= SPEED_IDLE_STEP;
                    else
                        currentSpeed = 0;

                    if(currentRpm >= RPM_IDLE_STEP)
                        currentRpm -= RPM_IDLE_STEP;
                    else
                        currentRpm = 0;

                    break;
                }

                case COMMAND_ACCELERATE :
                {
                    maxRpm = acc_angle * 89;
                    maxSpeed = (maxRpm / 64) * 1000;

                    if(currentSpeed <= (maxSpeed - SPEED_ACCELERATE_STEP) && maxSpeed > 0)
                        currentSpeed += SPEED_ACCELERATE_STEP;
                    else
                        currentSpeed = maxSpeed;

                    if(currentRpm < maxRpm)
                        currentRpm += RPM_ACCELERATE_STEP;
                    else if(currentRpm > maxRpm)
                        currentRpm -= RPM_SWITCH_STEP;
                    else
                        currentRpm = maxRpm;

                    break;
                }

                case COMMAND_BREAK : 
                {
                    if(currentSpeed >= SPEED_BRAKE_STEP)
                        currentSpeed -= SPEED_BRAKE_STEP;
                    else
                        currentSpeed = 0;

                    if(currentRpm >= RPM_IDLE_STEP)
                        currentRpm -= RPM_IDLE_STEP;
                    else
                        currentRpm = 0;

                    break;
                }
            }

            for(i = 0; i < 8; i++)
            {
                frameSent[i] = 0;
            }
            frameSent[0] = currentSpeed & 0xff;
            frameSent[1] = (currentSpeed >> 8) & 0xff;
            frameSent[2] = (currentSpeed >> 16) & 0xff;
            frameSent[3] = currentRpm & 0xff;
            frameSent[4] = (currentRpm >> 8) & 0xff;
            
            sendCanMessage(frameSent, SPEED_RPM_SEND_FRAME_ID);
#endif
        } 
        else if ((frameID == BRAKE_ANGLE_RECEIVE_FRAME_ID_MANUAL) || (frameID == BRAKE_ANGLE_RECEIVE_FRAME_ID_AUTOMATIC)) 
        {
            brake_angle = (int)frameReceived[BRAKE_ANGLE_POS] | ((int)frameReceived[BRAKE_ANGLE_POS + 1] << 8);          
           /* Write to DAC CH1 data Register */
            write_dac_ch1_data(brake_angle);
        }        
    }
     
}
