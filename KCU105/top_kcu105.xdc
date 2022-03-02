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
resize_pblock [get_pblocks pblock_shift_low] -add {SLICE_X6Y208:SLICE_X10Y239}
resize_pblock [get_pblocks pblock_shift_low] -add {RAMB18_X1Y84:RAMB18_X1Y95}
resize_pblock [get_pblocks pblock_shift_low] -add {RAMB36_X1Y42:RAMB36_X1Y47}
set_property SNAPPING_MODE ON [get_pblocks pblock_shift_low]


#CLK_125MHZ_P - KCU105 - G10/LVDS
set_property PACKAGE_PIN G10 [get_ports clk_p]
set_property IOSTANDARD LVDS [get_ports clk_p]

#CLK_125MHZ_N - KCU105 - F10/LVDS
set_property PACKAGE_PIN F10 [get_ports clk_n]
set_property IOSTANDARD LVDS [get_ports clk_n]

#GPIO_SW_C (SW7)  - KCU105 - AE10/LVCMOS18
set_property PACKAGE_PIN AE10 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]

#GPIO_LED_0 - KCU105 - AP8/LVCMOS18
set_property PACKAGE_PIN AP8 [get_ports {shift_low_out[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {shift_low_out[3]}]

#GPIO_LED_1 - KCU105 - H23/LVCMOS18
set_property PACKAGE_PIN H23 [get_ports {shift_low_out[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {shift_low_out[2]}]

#GPIO_LED_2 - KCU105 - P20/LVCMOS18
set_property PACKAGE_PIN P20 [get_ports {shift_low_out[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {shift_low_out[1]}]

#GPIO_LED_3 - KCU105 - P21/LVCMOS18
set_property PACKAGE_PIN P21 [get_ports {shift_low_out[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {shift_low_out[0]}]

#GPIO_LED_4 - KCU105 - N22/LVCMOS18
set_property PACKAGE_PIN N22 [get_ports {shift_high_out[0]}]
set_property IOSTANDARD LVCMOS18 [get_ports {shift_high_out[0]}]
                                         
#GPIO_LED_5 - KCU105 - M22/LVCMOS18      
set_property PACKAGE_PIN M22 [get_ports {shift_high_out[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {shift_high_out[1]}]
                                         
#GPIO_LED_6 - KCU105 - R23/LVCMOS18      
set_property PACKAGE_PIN R23 [get_ports {shift_high_out[2]}]
set_property IOSTANDARD LVCMOS18 [get_ports {shift_high_out[2]}]
                                         
#GPIO_LED_7 - KCU105 - P23/LVCMOS18      
set_property PACKAGE_PIN P23 [get_ports {shift_high_out[3]}]
set_property IOSTANDARD LVCMOS18 [get_ports {shift_high_out[3]}]
