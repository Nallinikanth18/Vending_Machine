/* ------------------------------------------------ *
 * Project     : Vending Machine                    *
 * Module      : comparator_for_2Hz                 *
 * ------------------------------------------------ *
 * File        : comparator_for_2Hz.v               *
 * Author      : Nallinikanth                       *
 * Last Edit   : 20/04/2021                         *
 * ------------------------------------------------ *
 * Description : A comparator that compares input   *
		         with 25000000
 * ------------------------------------------------ */

module comparator_for_2Hz  (input [0:24]x,
                            output eq);

wire t1,   //x = 25_00_00_00 =101_111_101_011_110_000_100_000_0
     t7,
     t9,
     t14,
     t15,
     t16,
     t17,
     t19,
     t20,
     t21,
     t22,
     t23,
     t24;

wire eq1,
     eq2,
     eq3,
     eq4;

not g1  (t3 ,x[3]),
    g2  (t7 ,x[7]),
    g3  (t9 ,x[9]),
    g4  (t14,x[14]),
    g5  (t15,x[15]),
    g6  (t16,x[16]),
    g7  (t17,x[17]),
    g8  (t19,x[19]);
    g9  (t20,x[20]),
    g10 (t21,x[21]),
    g11 (t22,x[22]),
    g12 (t23,x[23]),
    g13 (t24,x[24]);

and g14 (eq1,  x[0], x[1],   x[2],   t3,   x[4],  x[5]),
    g15(eq2,  x[6],   t7,   x[8],   t9,  x[10], x[11]),
    g16(eq3, x[12], x[13],   t14,  t15,  t16,     t17),
    g17(eq4, x[18],   t19,   t20,  t21,  t22,     t23, t24);

and g18(eq, eq1, eq2, eq3, eq4);

endmodule
