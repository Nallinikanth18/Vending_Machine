/* ------------------------------------------------------ *
 * Project     : Vending Machine                          *
 * Module      : mux2_1                                   *
 * ------------------------------------------------------ *
 * File        : mux2_1.v                                 *
 * Author      : Nallinikanth                             *
 * Last Edit   : 20/04/2021                               *
 * ------------------------------------------------------ *
 * Description : Creates a 2:1 MUX 			              *
 * ------------------------------------------------------ */


module mux2_1(input I0,
              input I1,
              input S,

              output O);

wire t1,
     t2,
     t3;

not G4 (t3,S);
and G1 (t1,I0,t3);
and G2 (t2,I1,S);
or G3 (O,t1,t2);

endmodule
