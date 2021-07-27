/* ------------------------------------------------------ *
 * Project     : Vending Machine                          *
 * Module      : demux_1_to_2                             *
 * ------------------------------------------------------ *
 * File        : demux_1_to_2.v                           *
 * Author      : Nallinikanth                             *
 * Last Edit   : 20/04/2021                               *
 * ------------------------------------------------------ *
 * Description : Creates a 1:2 DEMUX 			          *
 * ------------------------------------------------------ */


module demux_1_to_2 (output out0,
                     output out1,
                     input s,
                     input in);

wire s_bar;

not Gs (s_bar,s);

and G00 (out0, s_bar, in),
    G10 (out1, s,     in);


endmodule
