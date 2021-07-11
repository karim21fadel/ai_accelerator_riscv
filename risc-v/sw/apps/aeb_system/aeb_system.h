#include "stdio.h"
#include "can.h"
#include "stdint.h"
#include <math.h>

#define LANE_WIDTH          3.5
#define PI                  3.14159265358979323846
#define MAX_BRAKE_PRES      150
#define PARTIAL_BRAKE_RATIO 0.4


#define SENSOR_DATA_RECEIVE_FRAME_ID      0x75
#define BRAKE_PRESSURE_SEND_FRAME_ID      0x25 

#define RANGE_POS            0 
#define RANGE_DOT_POS        1
#define THETA_POS            2
#define VEH_VELOCITY_POS     3
#define VEH_YAWRATE_POS      4

#define BRAKE_PRESSURE_POS   0