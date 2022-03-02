//////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2005-2020 Xilinx, Inc.
// This design is confidential and proprietary of Xilinx, Inc.
// All Rights Reserved.
///////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /   Vendor: Xilinx
// \   \   \/    Version: 1.0
//  \   \        Application: Dynamic Function eXchange
//  /   /        Filename: top.v
// /___/   /\    Date Last Modified: 14 FEB 2020
// \   \  /  \
//  \___\/\___\
//
// Board:  KC705 Rev 1.0 and others
// Device: xc7k325t-1-ffg900 and others
// Design Name: led_shift_shift
// Purpose: Dynamic Function eXchange Tutorial
///////////////////////////////////////////////////////////////////////////////
//
//    Project : led_shift_shift
// Description: This design outputs LED patterns based on two reconfigurable
//              modules.  This design has been modified from the original led_shift_count
//              to replace the counter with another shifter.  This is done to illustrate
//              the project flow detail of Partition Definitions.
//
//////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////
//  Top-level, static design
//////////////////////////////////////////////////////////////////////////////

module top(
   input        clk_p,           // 200MHz differential input clock
   input        clk_n,           // 200MHz differential input clock
   input        rst_n,           // Reset mapped to center push button
   output [3:0] shift_high_out,  // mapped to general purpose LEDs[4-7]
   output [3:0] shift_low_out    // mapped to general purpose LEDs[0-3]
);

   wire        rst;
   reg  [34:0] count;
   wire        gclk;
   wire [35:0] icon_control;
   

   // Rev A board CPU reset (has active high reset button) and Rev B using board GPUI reset (has active high reset button)
   assign rst = rst_n;
   // Rev B board (has active low reset button)
   // assign rst = ~rst_n;
   // In module_shift instantiation of inst_shift below
   //      .en       (~rst),
  

   // instantiate clock module to divide 200MHz to 100MHz
   clocks U0_clocks (
      .clk_p(clk_p),
      .clk_n(clk_n),
      .rst(rst),
      .clk_out(gclk)
   );

   // instantiate module shift for low bits
   shift inst_shift_low (
      .en       (rst),
      .clk      (gclk),
      .addr     (count[34:23]),
      .data_out (shift_low_out) 
   );
 
   // instantiate module shift for high bits
   shift inst_shift_high (
      .en       (rst),
      .clk      (gclk),
      .addr     (count[34:23]),
      .data_out (shift_high_out) 
   );

   // MAIN

   always @(posedge gclk)
     if (rst)
       begin
         count <= 0;
       end
     else
       begin
         count <= count + 1;
       end

endmodule

// black box definition for module_shift
//module shift(
//   input         en,
//   input         clk,
//   input  [11:0] addr,
//   output  [3:0] data_out);
//endmodule



