/* ------------------------------------------------ *
 * Project     : Vending Machine                    *
 * Module      : seven_seg_control                  *
 * ------------------------------------------------ *
 * File        : seven_seg_control.v                *
 * Author      : Nallinikanth                       *
 * Last Edit   : 20/04/2021                         *
 * ------------------------------------------------ *
 * Description : Controls the seven segments data   *
  		         of change and cost_of_product
 * ------------------------------------------------ */

 // included module : seven_segment_display  (Creates inputs for seven_seg_control)
 // included module : mux_4_to_1_7bit        (Creates a 7-bit input and output 4:1 MUX)
 // included module : demux_1_to_4           (Creates a 1:4 DEMUX)


module seven_seg_control (input [0:5]x,
                          input [0:5]y,
                          input clk,
                          input reset,
                          output [0:3]anode,
                          output [0:6]segment);

reg [0:16]anode_selector;

wire [0:6] segment_x_msb;
wire [0:6] segment_x_lsb;
wire [0:6] segment_y_msb;
wire [0:6] segment_y_lsb;

seven_segment_display MIN_SEG (x,{segment_x_msb,segment_x_lsb});
seven_segment_display HR_SEG  (y,{segment_y_msb,segment_y_lsb});

always @ (posedge clk)         // The select line for MULTIPLEXER and DEMULTIPLER
if (reset) anode_selector<= 0;
else anode_selector <= anode_selector +1;

mux_4_to_1 MUX    (anode_selector[0:1], segment_x_lsb, segment_x_msb, segment_y_lsb, segment_y_msb, segment); //2:4 multiplexer

demux_4_to_1 DEMUX (.out_00(anode[0]), .out_01(anode[1]), .out_10(anode[2]), .out_11(anode[3]), .s(anode_selector[0:1])); //1:4 demux

endmodule
