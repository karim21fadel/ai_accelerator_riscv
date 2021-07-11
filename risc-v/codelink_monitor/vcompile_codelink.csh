#!/bin/csh

setenv CDL_MONITOR $PULP_PATH/codelink_monitor
echo "--> Building codelink monitor"

gcc -c -Wall -Werror -fpic -I/$CODELINK_HOME/include -I/$MTI_HOME/include $CDL_MONITOR/cdl_monitor.c -o $CDL_MONITOR/cdl_monitor.o
gcc -shared -o $CDL_MONITOR/cdl_monitor.so $CDL_MONITOR/cdl_monitor.o $CODELINK_HOME/lib/libcodelink_rlf_api.so

