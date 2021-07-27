/* ------------------------------------------------ *
 * Project     : Vending Machine                    *
 * Module      : clk_divider_vm                     *
 * ------------------------------------------------ *
 * File        : clk_divider_vm.v                   *
 * Author      : Nallinikanth                       *
 * Last Edit   : 20/04/2021                         *
 * ------------------------------------------------ *
 * Description : A clock divider that generates a   *
		         clock of 2Hz frequency
 * ------------------------------------------------ */

 // included module : d_ff               (Creates a D-flip flop)
 // included module : mux2_1             (Creates a 2:1 MUX    )
 // included module : comparator_for_2Hz (compares input with 25000000)

module clk_divider(input clk_in,
                   input reset,
                   output clk_out);

reg [0:24] temp = 0;
parameter P = 25'd25000000;  //101_111_101_011_110_000_100_000_0 in binary

wire d,
     q,
     qbar;
wire toggle;

comparator_for_2Hz COMP (temp, toggle); // toggle changes to 1 when temp = P

always @(posedge clk_in)           // A 25 bit counter to increment temp
if (reset || toggle) temp <=0;
else temp <= temp+1;


// Now we will be connecting a D-flipflop whose input will be coming from a 2:1 mux
// The I0 input of mux is nothing but the output of D-ff (clk_out) and the I1 input is ~clk_out (q_bar)
// The select line of the mux is the 'toggle' generated in comparator_for_1hz.

d_ff Dff (clk_in,reset,d,clk_out,qbar);
mux2_1 M (.I0(clk_out), .I1(qbar), .S(toggle), .O(d));

endmodule
