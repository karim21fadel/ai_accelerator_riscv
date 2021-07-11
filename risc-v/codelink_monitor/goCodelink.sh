#!/bin/bash

# This script assumes Questa 10.5x as your GUI, and a valid license is setup
# eg. module load license/localhost questa/10.5c_2

#This variable should be set in .toolsrc
#export MGC_CDL_GDB_OVERRIDE=$RISCV_GDB_HOME/bin/gdb

#################################################################
# Environmental checks

# Test to make sure CODELINK_HOME is set, and contains at least one binary
if [ ! -x $CODELINK_HOME/bin/rlftool ] ; then
    echo Codelink environment is not set to viable Codelink folder, could not find executables
    echo CODELINK_HOME=\"$CODELINK_HOME\"
    exit -1
fi

# Test to make sure the OVERRIDE is valid executable binary
if [ ! -x "$MGC_CDL_GDB_OVERRIDE" ] ; then
    echo MGC_CDL_GDB_OVERRIDE=\"$MGC_CDL_GDB_OVERRIDE\", and isnt an executable binary...
    exit -1
fi

# Test to make sure the OVERRIDE can handle pyhon 2.x
RESULT=$($MGC_CDL_GDB_OVERRIDE --eval-command="python print 99" --eval-command="q" | tail -n 1)
if [ "x$RESULT" != "x99" ] ; then
    echo Something is wrong with your GDB support for Python
    echo ===================================================
    $MGC_CDL_GDB_OVERRIDE --eval-command="python print 99" --eval-command="q" 
    exit -1
fi


#################################################################
# Custom CPU checks

# Check for the codelink.ini
if [ ! -f codelink.ini ] ; then
    echo Couldnt find your codelink.ini in \"$PWD\"
    exit -1
fi

# Check for the pulpino.xml
if [ ! -f pulpino.xml ] ; then
    echo Coulnt find your pulpino XML in \"$PWD\"
    exit -1
fi


#################################################################
# Launch

if [ "x$@" == "x" -a -f launch_debugger.do ] ; then
    echo No launch options specified, using -do launch_debugger.do

    vsim -view vsim.wlf -do launch_debugger.do
else
    echo Launching with options: \"$@\"

    vsim $@
fi

