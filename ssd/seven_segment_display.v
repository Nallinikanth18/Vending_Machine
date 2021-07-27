/* ------------------------------------------------ *
 * Project     : Digital Clock                      *
 * Module      : seven_segment_display              *
 * ------------------------------------------------ *
 * File        : seven_segment_display.v            *
 * Author      : Nallinikanth                       *
 * Last Edit   : 25/05/2021                         *
 * ------------------------------------------------ *
 * Description : Creates the seven segments data    *
  		         of hours and minutes
 * ------------------------------------------------ */


//---------------------------------------------------SEVEN SEGMENT DISPLAY------------------------------------------------
module seven_segment_display (in,segment);
input [0:5] in; output reg [0:13] segment;

always @ (in,segment)
begin
    case (in)
    00 : segment = 14'b0000001_0000001;    // 00 to 09
    01 : segment = 14'b0000001_1001111;
    02 : segment = 14'b0000001_0010010;
    03 : segment = 14'b0000001_0000110;
    04 : segment = 14'b0000001_1001100;
    05 : segment = 14'b0000001_0100100;
    06 : segment = 14'b0000001_0100000;
    07 : segment = 14'b0000001_0001111;
    08 : segment = 14'b0000001_0000000;
    09 : segment = 14'b0000001_0000100;

    10 : segment = 14'b1001111_0000001;    // 10 to 19
    11 : segment = 14'b1001111_1001111;
    12 : segment = 14'b1001111_0010010;
    13 : segment = 14'b1001111_0000110;
    14 : segment = 14'b1001111_1001100;
    15 : segment = 14'b1001111_0100100;
    16 : segment = 14'b1001111_0100000;
    17 : segment = 14'b1001111_0001111;
    18 : segment = 14'b1001111_0000000;
    19 : segment = 14'b1001111_0000100;

    20 : segment = 14'b0010010_0000001;    // 20 to 29
    21 : segment = 14'b0010010_1001111;
    22 : segment = 14'b0010010_0010010;
    23 : segment = 14'b0010010_0000110;
    24 : segment = 14'b0010010_1001100;
    25 : segment = 14'b0010010_0100100;
    26 : segment = 14'b0010010_0100000;
    27 : segment = 14'b0010010_0001111;
    28 : segment = 14'b0010010_0000000;
    29 : segment = 14'b0010010_0000100;

    30 : segment = 14'b0000110_0000001;    // 30 to 39
    31 : segment = 14'b0000110_1001111;
    32 : segment = 14'b0000110_0010010;
    33 : segment = 14'b0000110_0000110;
    34 : segment = 14'b0000110_1001100;
    35 : segment = 14'b0000110_0100100;
    36 : segment = 14'b0000110_0100000;
    37 : segment = 14'b0000110_0001111;
    38 : segment = 14'b0000110_0000000;
    39 : segment = 14'b0000110_0000100;

    40 : segment = 14'b1001100_0000001;    // 40 to 49
    41 : segment = 14'b1001100_1001111;
    42 : segment = 14'b1001100_0010010;
    43 : segment = 14'b1001100_0000110;
    44 : segment = 14'b1001100_1001100;
    45 : segment = 14'b1001100_0100100;
    46 : segment = 14'b1001100_0100000;
    47 : segment = 14'b1001100_0001111;
    48 : segment = 14'b1001100_0000000;
    49 : segment = 14'b1001100_0000100;

    50 : segment = 14'b0100100_0000001;    // 50 to 59
    51 : segment = 14'b0100100_1001111;
    52 : segment = 14'b0100100_0010010;
    53 : segment = 14'b0100100_0000110;
    54 : segment = 14'b0100100_1001100;
    55 : segment = 14'b0100100_0100100;
    56 : segment = 14'b0100100_0100000;
    57 : segment = 14'b0100100_0001111;
    58 : segment = 14'b0100100_0000000;
    59 : segment = 14'b0100100_0000100;
    default : segment = 14'b0000001_0000001;
    endcase
end
endmodule

