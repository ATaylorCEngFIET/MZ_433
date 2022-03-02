####################################################################################
#///////////////////////////////////////////////////////////////////////////////
#// Copyright (c) 2005-2016 Xilinx, Inc.
#// This design is confidential and proprietary of Xilinx, Inc.
#// All Rights Reserved.
#///////////////////////////////////////////////////////////////////////////////
#//   ____  ____
#//  /   /\/   /
#// /___/  \  /   Vendor: Xilinx
#// \   \   \/    Version: 2020.1
#//  \   \        Application: Dynamic Function eXchange
#//  /   /        Filename: pblocks_kcu105.xdc
#// /___/   /\    Date Last Modified: 14 FEB 2020
#// \   \  /  \
#//  \___\/\___\
#// Device: KCU105 board Rev 1.0
#// Design Name: led_shift_shift
#// Purpose: Dynamic Function eXchange Tutorial
#///////////////////////////////////////////////////////////////////////////////

#-------------------------------------------------
# pblock_shift_high 
#            for pr instance inst_shift_high 
#-------------------------------------------------
create_pblock pblock_shift_high
add_cells_to_pblock [get_pblocks pblock_shift_high] [get_cells -quiet [list inst_shift_high]]
resize_pblock [get_pblocks pblock_shift_high] -add {SLICE_X1Y240:SLICE_X5Y267}
resize_pblock [get_pblocks pblock_shift_high] -add {DSP48E2_X0Y96:DSP48E2_X0Y105}
resize_pblock [get_pblocks pblock_shift_high] -add {RAMB18_X0Y96:RAMB18_X0Y105}
resize_pblock [get_pblocks pblock_shift_high] -add {RAMB36_X0Y48:RAMB36_X0Y52}
set_property SNAPPING_MODE ON [get_pblocks pblock_shift_high]

#-------------------------------------------------
# pblock_shift_low
#            for pr instance inst_shift_low 
#-------------------------------------------------
create_pblock pblock_shift_low
add_cells_to_pblock [get_pblocks pblock_shift_low] [get_cells -quiet [list inst_shift_low]]
resize_pblock [get_pblocks pblock_shift_low] -add {SLICE_X6Y208:SLICE_X10Y239}
resize_pblock [get_pblocks pblock_shift_low] -add {RAMB18_X1Y84:RAMB18_X1Y95}
resize_pblock [get_pblocks pblock_shift_low] -add {RAMB36_X1Y42:RAMB36_X1Y47}
set_property SNAPPING_MODE ON [get_pblocks pblock_shift_low]

