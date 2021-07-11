#include "aeb_system.h"

int main ()
{
    signed char    Range;
    signed char    Range_dot;
    signed char    Theta;
    signed char    Veh_Velocity;
    signed char    Veh_YawRate;

    signed char    BrakePressure;

    float   RoadRadius, RoadRadius_nonZero, Veh_YawRate_rad_abs, Lateral_Pos;
    float   Theta_rad, Lambda, cos_Lambda, cos_Lambda_min_Theta;
    float   sin_Theta, sin_Theta_YawRateSign;
    float   Velocity;
    float   TTC;
    
    static unsigned int PartialBrake_Counter, AEBActivation_Counter, AEB_Hold;
    
    int            i;
    uint8_t        frameReceived[CAN_PAYLOAD_SIZE];  // data field of the received can frame
    uint8_t        frameSent[CAN_PAYLOAD_SIZE];      // data field of the can frame to send   
    uint16_t       frameID;

    
    printf("Starting AEB system application...\n");
    initializeCanController();
    printf("CAN controller initialized...\n");

    while(1) 
    {
        
        receiveCanMessage(frameReceived, &frameID);
        
        if(frameID == SENSOR_DATA_RECEIVE_FRAME_ID)
        {
            Range          = ((signed char*)frameReceived)[RANGE_POS];
            Range_dot      = ((signed char*)frameReceived)[RANGE_DOT_POS];
            Theta          = ((signed char*)frameReceived)[THETA_POS]; 
            Veh_Velocity   = ((signed char*)frameReceived)[VEH_VELOCITY_POS];
            Veh_YawRate    = ((signed char*)frameReceived)[VEH_YAWRATE_POS];
            
            Theta_rad = Theta * PI / 180; /* Convert Theta to radians */          
            
            /* Most of the algorithm was deduced and adapted from the AEB Simulink block contained in the PreScan + Amesim demo */
            
            /* Initialize brake pressure to zero */
            BrakePressure = 0;

            /* Initialize TTC with a large value by default */
            TTC = 100;

            sin_Theta = sin(Theta_rad);

            if (fabs(Veh_YawRate) > 2)
            {
                /* Bending road */
                Veh_YawRate_rad_abs = fabs(Veh_YawRate * PI / 180);

                /* Check to avoid division by zero */
                if (Veh_YawRate_rad_abs < 1e-6)
                {
                    /* Should never enter this condition, since it was checked before that yaw rate is larger than 2 deg/s */
                    Veh_YawRate_rad_abs = 1e-6;
                }
                else
                {
                    /* Do nothing. */
                }
                RoadRadius = fabs(Veh_Velocity / Veh_YawRate_rad_abs);

                /* Check to avoid division by zero */
                if (RoadRadius < 1e-6)
                {
                    RoadRadius_nonZero = 1e-6;
                }
                else
                {
                    RoadRadius_nonZero = RoadRadius;
                }

                cos_Lambda = -(Range * sin_Theta / RoadRadius_nonZero) + 1;
                /* Limit value between -1 and 1 */
                if (cos_Lambda > 1)
                {
                    cos_Lambda = 1;
                }
                else if (cos_Lambda < -1)
                {
                    cos_Lambda = -1;
                }
                else
                {
                    /* Do nothing. */
                }

                Lambda = acos(cos_Lambda);
                /* Limit value between 0 and pi */
                if (Lambda > PI)
                {
                    Lambda = PI;
                }
                else if (Lambda < 0)
                {
                    Lambda = 0;
                }
                else
                {
                    /* Do nothing. */
                }

                /* Use sin_Theta with same sign as vehicle yaw rate */
                if (Veh_YawRate > 0)
                {
                    sin_Theta_YawRateSign = sin_Theta;
                }
                else
                {
                    sin_Theta_YawRateSign = -sin_Theta;
                }

                Lateral_Pos = sqrt((RoadRadius * RoadRadius) + (Range * Range) - (2 * RoadRadius * Range * sin_Theta_YawRateSign)) - RoadRadius;

            }
            else
            { 
                /* Straight road */
                Lambda = 0;
                Lateral_Pos = Range * sin_Theta;
            }

            if (fabs(Lateral_Pos) < LANE_WIDTH / 2)
            {
                /*Check if detected object is in the vehicle's current lane */
                cos_Lambda_min_Theta = cos(Lambda - Theta_rad);

                if (fabs(cos_Lambda_min_Theta) > 1e-6)
                {
                    Velocity = Range_dot / cos_Lambda_min_Theta;
                }
                else
                {
                    Velocity = 0;
                }
            }
            else
            {
                Velocity = 0;
            }

            /* Avoid division by zero */
            if (Velocity > 1e-6)
            {
                TTC = (Range * cos(Theta_rad)) / Velocity;
            }
            else
            {
                /* A velocity of 0 means that no object is detected. Use previously set large value for TTC since there are no obstacles */
            }

            if (AEB_Hold == 1)
            {
                /* Hold AEB if already activated */
                BrakePressure = MAX_BRAKE_PRES;
            }
            else if ((TTC <= 1.5) && (TTC > 0))
            {
                /* Start braking only if object detected for three consecutive steps.
                   This is to prevent incorrect data (noise) from activating the AEB system */
                AEBActivation_Counter++;
                if (AEBActivation_Counter > 2)
                {
                    /* Start braking */
                    BrakePressure = MAX_BRAKE_PRES;

                    /* Hold the AEB signal only if full braking was activated */
                    AEB_Hold = 1;
                }
                else
                {
                    if (PartialBrake_Counter > 0)
                    {
                        /* Partial braking signal still held */
                        BrakePressure = (unsigned char) (PARTIAL_BRAKE_RATIO * MAX_BRAKE_PRES);
                        PartialBrake_Counter--;
                    }
                    else
                    {
                        BrakePressure = 0;
                    }
                }

            }
            else if ((TTC <= 3) && (TTC > 1.5))
            {
                /* Partial brakes are held for 10 steps after deactivation to definitely avoid potentially dangerous situations */
                PartialBrake_Counter = 10;

                /* Partial braking */
                BrakePressure = (unsigned char) (PARTIAL_BRAKE_RATIO * MAX_BRAKE_PRES);
                /* Set the AEB counter to 1, since an AEB signal after partial braking is not likely to be noise */
                AEBActivation_Counter = 1;
            }
            else
            {
                if (PartialBrake_Counter > 0)
                {
                    /* Partial braking signal still held */
                    BrakePressure = (unsigned char) (PARTIAL_BRAKE_RATIO * MAX_BRAKE_PRES);
                    AEBActivation_Counter = 1;
                    PartialBrake_Counter--;
                }
                else
                {
                    /* No braking */
                    BrakePressure = 0;
                    AEBActivation_Counter = 0;
                }
            }
    
            for(i = 0; i < CAN_PAYLOAD_SIZE; i++)
            {
                frameSent[i] = 0;
            }
            frameSent[BRAKE_PRESSURE_POS] = BrakePressure;
           
            /* Send the brake pressure to the CAN bus */
            sendCanMessage(frameSent, BRAKE_PRESSURE_SEND_FRAME_ID);
        }
    }
}
