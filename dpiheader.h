/* MTI_DPI */

/*
 * Copyright 2002-2020 Mentor Graphics Corporation.
 *
 * Note:
 *   This file is automatically generated.
 *   Please do not edit this file - you will lose your edits.
 *
 * Settings when this file was generated:
 *   PLATFORM = 'linux_x86_64'
 */
#ifndef INCLUDED_DPIHEADER
#define INCLUDED_DPIHEADER

#ifdef __cplusplus
#define DPI_LINK_DECL  extern "C" 
#else
#define DPI_LINK_DECL 
#endif

#include "svdpi.h"



DPI_LINK_DECL DPI_DLLESPEC
void
on_pa_capture_changed(
    const svBitVecVal* old_enable_vector,
    const svBitVecVal* new_enable_vector);

DPI_LINK_DECL DPI_DLLESPEC
void
on_pa_cfg_timer_fire();

DPI_LINK_DECL DPI_DLLESPEC
void
on_pa_fifo_flush(
    const svBitVecVal* data,
    const svBitVecVal* bytes,
    const svBitVecVal* pkt_header);

DPI_LINK_DECL DPI_DLLESPEC
void
on_pa_finish(
    svBitVecVal* dummy);

DPI_LINK_DECL DPI_DLLESPEC
void
on_pa_get_chandle(
    svBitVecVal* connect);

DPI_LINK_DECL DPI_DLLESPEC
void
on_pa_ref();

DPI_LINK_DECL DPI_DLLESPEC
void
on_pa_rst(
    const svBitVecVal* param);

DPI_LINK_DECL DPI_DLLESPEC
void
on_pa_session_info(
    const svBitVecVal* info,
    svBitVecVal* dummy);

DPI_LINK_DECL DPI_DLLESPEC
void
on_pa_set_chandle(
    const svBitVecVal* connect);

DPI_LINK_DECL void
pa_cfg_trigger(
    const svBitVecVal* cfg_pkt_arg);

#endif 
