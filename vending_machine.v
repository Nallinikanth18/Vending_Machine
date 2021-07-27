
/* ------------------------------------------------ *
 * Project     : Vending Machine                    *
 * Module      : vending_machine                    *
 * ------------------------------------------------ *
 * File        : vending_machine.v                  *
 * Author      : Nallinikanth                       *
 * Last Edit   : 20/04/2021                         *
 * ------------------------------------------------ *
 * Description : Vending Machine                    *
 * ------------------------------------------------ */


module vending_machine (input [0:1] food_categ, // there are 4 categories of food chocolates, chips, beverages, etc:-
                        input [0:1] select,      // To select particular snack from the above category
                        input [0:1] coin,
                        input clk,
                        input reset,
                        input cancel,

                        output reg [0:5] cost_of_product,
                        output reg [0:5] change,
                        output reg [0:4] product_out,
                        output reg [0:5] money_entered //Total money entered be the user
                        );


parameter [0:2] s0 =3'b000,
                s5 =3'b001,
                s10=3'b010,
                s15=3'b011,
                s20=3'b100,
                s25=3'b101,
                s30=3'b110;


parameter [0:1] ZERO  =2'b00,
                FIVE  =2'b01,
                TEN   =2'b10,
                TWENTY=2'b11;

reg start; //to start the vending machine
reg [0:2] state;
reg [0:5] coin_to_money_conversion; // The binary code to rupees conversion

wire [0:5] change_if_cancel;

wire [0:3] expected_product; // The expected product

assign expected_product = {food_categ,select}; //food_categ is column, select is row
assign change_if_cancel = money_entered;


//-------------------Cost of the required product-----------------------
always @ (select)
begin
    case (select)
    2'b00 : cost_of_product <= 6'd15;    // 00 ----> 15  rupees
    2'b01 : cost_of_product <= 6'd20;    // 01 ----> 20  rupees
    2'b10 : cost_of_product <= 6'd25;    // 10 ----> 25 rupees
    2'b11 : cost_of_product <= 6'd30;    // 11 ----> 30 rupees
    endcase
end
//-----------------------------------------------------------------------------



//-------------------Conversion of binary code of coins to rupees-----------------------
always @ (coin)
begin
    case (coin)
    2'b00 : coin_to_money_conversion <= 6'd0;    // 00 ----> 0  rupees
    2'b01 : coin_to_money_conversion <= 6'd5;    // 01 ----> 5  rupees
    2'b10 : coin_to_money_conversion <= 6'd10;   // 10 ----> 10 rupees
    2'b11 : coin_to_money_conversion <= 6'd20;   // 11 ----> 20 rupees
    endcase
end
//-----------------------------------------------------------------------------

//-------------------
always @ (posedge clk, posedge reset)
begin

    if (reset)
    begin
         start <=1;
         state <= 0;
         change <= 0;
         product_out <= 0;
         money_entered<=0;
         coin_to_money_conversion<=0;
    end

    else
        money_entered <= money_entered + coin_to_money_conversion;

end
//---------------------

//-----------------------------THE FSM-----------------------------------------
always @ (posedge clk)
if (start)
begin
    case (select)
    2'b00 : begin
                case (state)
                s0 : begin
                        case (coin)
                        ZERO  : state <= s0;
                        FIVE  : state <= s5;
                        TEN   : state <= s10;
                        TWENTY: state <= s20;
                        endcase
                     end
                s5 : begin
                        case (coin)
                        ZERO  : state <= s5;
                        FIVE  : state <= s10;
                        TEN   : state <= s15;
                        TWENTY: state <= s25;
                        endcase
                      end
                s10 : begin
                        case (coin)
                        ZERO  : state <= s10;
                        FIVE  : state <= s15;
                        TEN   : state <= s20;
                        TWENTY: state <= s30;
                        endcase
                      end
                s15 : begin state <= s15; end
                s20 : begin state <= s15; change <= 5'd5; end
                s25 : begin state <= s15; change <= 5'd10; end
                s30 : begin state <= s15; change <= 5'd15; end
                endcase
            end

    2'b01 : begin
                case (state)
                s0 : begin
                        case (coin)
                        ZERO  : state <= s0;
                        FIVE  : state <= s5;
                        TEN   : state <= s10;
                        TWENTY: state <= s20;
                        endcase
                    end
                s5 : begin
                        case (coin)
                        ZERO  : state <= s5;
                        FIVE  : state <= s10;
                        TEN   : state <= s15;
                        TWENTY: state <= s25;
                        endcase
                      end
                s10 : begin
                        case (coin)
                        ZERO  : state <= s10;
                        FIVE  : state <= s15;
                        TEN   : state <= s20;
                        TWENTY: state <= s30;
                        endcase
                      end
                s15 : begin
                        case (coin)
                        ZERO  : state <= s15;
                        FIVE  : state <= s20;
                        TEN   : state <= s25;
                        TWENTY: begin state <= s20; change <= 5'd15; end
                        endcase
                      end
                s20 : begin state <= s20; end
                s25 : begin state <= s20; change <= 5'd5; end
                s30 : begin state <= s20; change <= 5'd10; end
                endcase
            end

    2'b10 : begin
                case (state)
                s0 : begin
                        case (coin)
                        ZERO  : state <= s0;
                        FIVE  : state <= s5;
                        TEN   : state <= s10;
                        TWENTY: state <= s20;
                        endcase
                     end
                s5 : begin
                        case (coin)
                        ZERO  : state <= s5;
                        FIVE  : state <= s10;
                        TEN   : state <= s15;
                        TWENTY: state <= s25;
                        endcase
                     end
                s10 : begin
                        case (coin)
                        ZERO  : state <= s10;
                        FIVE  : state <= s15;
                        TEN   : state <= s20;
                        TWENTY: state <= s30;
                        endcase
                      end
                s15 : begin
                        case (coin)
                        ZERO  : state <= s15;
                        FIVE  : state <= s20;
                        TEN   : state <= s25;
                        TWENTY: begin state <= s25; change <= 5'd10; end
                        endcase
                      end
                s20 : begin
                        case (coin)
                        ZERO  : state <= s20;
                        FIVE  : state <= s25;
                        TEN   : state <= s30;
                        TWENTY: begin state <= s25; change <= 5'd15; end
                        endcase
                      end
                s25 : begin state <= s25; end
                s30 : begin state <= s25; change <= 5'd5; end
                endcase
            end

    2'b11 : begin
                case (state)
                s0 : begin
                        case (coin)
                        ZERO  : state <= s0;
                        FIVE  : state <= s5;
                        TEN   : state <= s10;
                        TWENTY: state <= s20;
                        endcase
                     end
                s5 : begin
                        case (coin)
                        ZERO  : state <= s5;
                        FIVE  : state <= s10;
                        TEN   : state <= s15;
                        TWENTY: state <= s25;
                        endcase
                     end
                s10 : begin
                        case (coin)
                        ZERO  : state <= s10;
                        FIVE  : state <= s15;
                        TEN   : state <= s20;
                        TWENTY: state <= s30;
                        endcase
                      end
                s15 : begin
                        case (coin)
                        ZERO  : state <= s15;
                        FIVE  : state <= s20;
                        TEN   : state <= s25;
                        TWENTY: begin state <= s30; change <= 5'd5; end
                        endcase
                      end
                s20 : begin
                        case (coin)
                        ZERO  : state <= s20;
                        FIVE  : state <= s25;
                        TEN   : state <= s30;
                        TWENTY: begin state <= s30; change <= 5'd10; end
                        endcase
                      end
                s25 : begin
                        case (coin)
                        ZERO  : state <= s25;
                        FIVE  : state <= s30;
                        TEN   : begin state <= s30; change <= 5'd5; end
                        TWENTY: begin state <= s30; change <= 5'd15; end
                        endcase
                      end
                s30 : begin state <= s30; end
                endcase
            end
    endcase
end

//-----------------------------supply of product------------------------------
always @ (state,coin, posedge cancel)
begin
    if (cancel)
    begin
        product_out <= 0;
        change <= change_if_cancel;
        state <=0;
    end

    else
    begin
        case (select)
        2'b00 : if (state == s15) product_out <= {1'b1,expected_product};
                else product_out = 0;
        2'b01 : if (state == s20) product_out <= {1'b1,expected_product};
                else product_out = 0;
        2'b10 : if (state == s25) product_out <= {1'b1,expected_product};
                else product_out = 0;
        2'b11 : if (state == s30) product_out <= {1'b1,expected_product};
                else product_out = 0;
        endcase
    end

end


endmodule
