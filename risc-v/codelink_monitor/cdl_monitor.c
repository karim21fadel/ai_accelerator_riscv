/*******************************************************************************
 *
 * HEADER
 *    cdl_monitor.c - System Verilog module of the Codelink Monitor.
 *
 * COPYRIGHT
 *    Copyright (c) MENTOR GRAPHICS CORPORATION 2009 All Rights Reserved
 *                       UNPUBLISHED, LICENSED SOFTWARE.
 *          CONFIDENTIAL AND PROPRIETARY INFORMATION WHICH IS THE
 *          PROPERTY OF MENTOR GRAPHICS CORPORATION OR ITS LICENSORS.
 *
 * DESCRIPTION
 *
 *   This is the System Verilog module definition for the Microblaze model 
 *   used in Codelink-Veloce environment.
 *
 *
 * WARNING - DO NOT MODIFY. Nothing in this file is to be modified by
 *           the end user. If you want to change the parameter values,
 *           use a defparam statement from the parent module.
 *
 *******************************************************************************/

#include <cdl_rlf_api.h>
#include <stdlib.h>
#include <stdio.h>
#include "svdpi.h"
#include "vpi_user.h"

static double time_adjust = 1.0;

static unsigned long long get_sim_time(void)
{
  unsigned long long simtime;

  s_vpi_time t;
  t.type  = vpiSimTime;
  vpi_get_time(NULL, &t);
  simtime = (((uint64_t)t.high) << 32) | t.low;

  // Adjust time to 100 ps unit
  simtime = simtime * time_adjust;
    
  return simtime;
}
  
static void init_timeadjust()
{
  int res;
  int i;

  time_adjust = 1.0;
  res = vpi_get(vpiTimePrecision, NULL);

  //Codelink needs time in 100 ps units, get the multiplier
  
  if(res < -10) {
    for (i=-10; i>res; i--) {
      time_adjust = time_adjust/10;
    }
  } else if(res > -10) {
    for (i=-10; i<res; i++) {
      time_adjust = time_adjust*10;
    }
  }
  
  fprintf(stdout, "[CDL] Monitor INFO: Monitor time adjust %f \n", time_adjust);
}

static void *codelink_monitor_handle = NULL;

void codelink_monitor_terminate(void);

static void codelink_monitor_exit_handler(void)
{
  // termination routine should be called by simulator/emulator
  // but if it gets killed unceremoniously this should close
  // down the monitor, flush data, and close files

  if (codelink_monitor_handle) codelink_monitor_terminate();
}

// Called at first initialization
void codelink_monitor_initialize(void)
{
  if (!codelink_monitor_handle) {

    init_timeadjust();
    
    codelink_monitor_handle = cdl_log_init("RISCV_CORE", 0);
    if(codelink_monitor_handle) {
      fprintf(stdout, "[CDL] Monitor INFO: codelink initialized \n");
      atexit(codelink_monitor_exit_handler);        
    } else {
      fprintf(stdout, "[CDL] Monitor ERROR: codelink initialization (cdl_log_init()) failed\n");
    } 
  } else {
    fprintf(stdout, "[CDL] Monitor WARNING: codelink initialization (cdl_log_init()) called multiple times\n");
  }
}

// Called at end of simulation/emulation
void codelink_monitor_terminate(void)
{
  int return_status;

  if (codelink_monitor_handle) {
    return_status = cdl_log_close(codelink_monitor_handle);
    if (return_status == 0) {
      fprintf(stdout, "[CDL] Monitor INFO: Monitor terminated \n");
      codelink_monitor_handle = NULL;
    } else {
      fprintf(stdout, "[CDL] Monitor ERROR: Monitor error during termination (%8x) \n", return_status);        
    }  
  } else {
    fprintf(stdout, "[CDL] Monitor WARNING: codelink_monitor_terminate() call ignored.  No monitor running. \n");     
  }
}

void codelink_monitor_log_reset_event(void)
{
  int return_status;

  if (codelink_monitor_handle) {
    return_status = cdl_log_reset_event(codelink_monitor_handle, 1, get_sim_time());
    if (return_status != 0) {
      fprintf(stdout, "[CDL] Monitor ERROR: Error in call to cdl_log_reset() \n");
    } else fprintf(stdout, "[CDL] Monitor INFO: Reset event logged \n");
  }
}

void codelink_monitor_log_pc(unsigned long pc)
{
  int return_status;

  if (codelink_monitor_handle) {
    return_status = cdl_log_pc(codelink_monitor_handle, pc, get_sim_time());
    if (return_status != 0) {
      fprintf(stdout, "[CDL] Monitor ERROR: Error in call to cdl_log_pc() \n");
    }  
    //else fprintf(stdout, "[CDL] Monitor INFO: PC event logged (%08x) \n", (unsigned)pc);
  }
}

void codelink_monitor_log_register(unsigned long reg_no, unsigned long value)
{
  int return_status;
  cdl_resource_address_type register_number;

  register_number.resource_id = 17;  // needs to match value from xml file
  register_number.offset = reg_no;   // needs to match value from xml file

  if (codelink_monitor_handle) {
    return_status = cdl_log_register(codelink_monitor_handle, &register_number, value, get_sim_time());
    if (return_status != 0) {
      fprintf(stdout, "[CDL] Monitor ERROR: Error in call to cdl_log_register() errno=%d \n", return_status);
    } // else fprintf(stdout, "[CDL] Monitor INFO: Register event logged reg[%lu] = %08lx \n", reg_no, value);
  }
}

void codelink_monitor_log_memory(unsigned long address, unsigned long byte_enable, unsigned long value)
{
  int return_status;
  int size;
  cdl_resource_address_type memory_address;

  memory_address.resource_id = 53;  // needs to match value from xml file
  memory_address.offset = address;

  switch (byte_enable) {
  case 15 : size = 4; break;
  case 12 : 
  case  3 : size = 2; break;
  case  8 : 
  case  4 : 
  case  2 : 
  case  1 : size = 1; break;
  default : size = 4; break;
  }

  switch (byte_enable) {
  case 12 : value = (value >> 16) & 0xFFFF; break;
  case  3 : value = value & 0xFFFF;         break;
  case  8 : value = (value >>24) & 0xFF;    break;
  case  4 : value = (value >>16) & 0xFF;    break;
  case  2 : value = (value >>8) & 0xFF;     break;
  case  1 : value = value & 0xFF;           break;
  default : break;
  }

  if (codelink_monitor_handle) {
    return_status = cdl_log_memory(codelink_monitor_handle, &memory_address, value, size, get_sim_time());
    if (return_status != 0) {
      fprintf(stdout, "[CDL] Monitor ERROR: Error in call to cdl_log_memory() errno=%d size=%d \n", return_status, size);
    } //else fprintf(stdout, "[CDL] Monitor INFO: Memory event logged mem[%lx] = %08lx \n", address, value);
  }
}

