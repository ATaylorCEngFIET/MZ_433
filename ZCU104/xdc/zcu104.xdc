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
#//  /   /        Filename: top_kcu105.xdc
#// /___/   /\    Date Last Modified: 14 FEB 2020
#// \   \  /  \
#//  \___\/\___\
#// Device: KCU105 board Rev 1.0
#// Design Name: led_shift_shift
#// Purpose: Dynamic Function eXchange Tutorial
#///////////////////////////////////////////////////////////////////////////////

###############################################################################
# Configuration properties for kcu105 
###############################################################################
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property CFGBVS GND [current_design]

###############################################################################
# User Time Names / User Time Groups / Time Specs
###############################################################################
create_clock -name clk_p -period 5 [get_ports clk_p]

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
resize_pblock [get_pblocks pblock_shift_low] -add {SLICE_X52Y210:SLICE_X59Y239}
resize_pblock [get_pblocks pblock_shift_low] -add {DSP48E2_X4Y84:DSP48E2_X5Y95}
resize_pblock [get_pblocks pblock_shift_low] -add {RAMB18_X1Y84:RAMB18_X1Y95}
resize_pblock [get_pblocks pblock_shift_low] -add {RAMB36_X1Y42:RAMB36_X1Y47}
set_property SNAPPING_MODE ON [get_pblocks pblock_shift_low]

#CLK_125MHZ_P - ZCU104 - 
set_property PACKAGE_PIN E23      [get_ports "clk_n"] ;# Bank  28 VCCO - VCC1V8   - IO_L13N_T2L_N1_GC_QBC_28
set_property IOSTANDARD  LVDS     [get_ports "clk_n"] ;# Bank  28 VCCO - VCC1V8   - IO_L13N_T2L_N1_GC_QBC_28
set_property PACKAGE_PIN F23      [get_ports "clk_p"] ;# Bank  28 VCCO - VCC1V8   - IO_L13P_T2L_N0_GC_QBC_28
set_property IOSTANDARD  LVDS     [get_ports "clk_p"] ;# Bank  28 VCCO - VCC1V8   - IO_L13P_T2L_N0_GC_QBC_28

#GPIO_SW_C (SW7)  - KCU105 - AE10/LVCMOS18
set_property PACKAGE_PIN M11      [get_ports "rst_n"] ;# Bank  87 VCCO - VCC3V3   - IO_L4N_AD8N_87
set_property IOSTANDARD  LVCMOS33 [get_ports "rst_n"] ;# Bank  87 VCCO - VCC3V3   - IO_L4N_AD8N_87

#GPIO_LED_0 
set_property PACKAGE_PIN D5 [get_ports {shift_high_out}]
set_property IOSTANDARD LVCMOS33 [get_ports {shift_high_out}]

#GPIO_LED_1 
set_property PACKAGE_PIN d6 [get_ports {shift_low_out[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {shift_low_out[2]}]

#GPIO_LED_2 
set_property PACKAGE_PIN a5 [get_ports {shift_low_out[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {shift_low_out[1]}]

#GPIO_LED_3 
set_property PACKAGE_PIN b5 [get_ports {shift_low_out[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {shift_low_out[0]}]


