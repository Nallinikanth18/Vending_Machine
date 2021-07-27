/* ------------------------------------------------------ *
 * Project     : Vending Machine                          *
 * Module      : demux_1_to_4                             *
 * ------------------------------------------------------ *
 * File        : demux_1_to_4.v                           *
 * Author      : Nallinikanth                             *
 * Last Edit   : 20/04/2021                               *
 * ------------------------------------------------------ *
 * Description : Creates a 1:4 DEMUX 			          *
 * ------------------------------------------------------ */

 // included module : demux_1_to_2  (Creates a 1:2 DEMUX)

module demux_1_to_4 (output out_00,
                     output out_01,
                     output out_10,
                     output out_11,

                     input [0:1]s);

wire outbar00;
wire outbar01;
wire outbar10;
wire outbar11;

wire  t0;
wire  t1;

supply1 in;

demux_1_to_2 DEMUX1 (.out0(t0),       .out1(t1),       .s(s[0]), .in(in));
demux_1_to_2 DEMUX2 (.out0(outbar00), .out1(outbar01), .s(s[1]), .in(t0));
demux_1_to_2 DEMUX3 (.out0(outbar10), .out1(outbar11), .s(s[1]), .in(t1));

not (out_00,outbar00),
    (out_01,outbar01),
    (out_10,outbar10),
    (out_11,outbar11);

endmodule
