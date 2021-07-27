/* ------------------------------------------------ *
 * Project     : Vending Machine                    *
 * Module      : vending_machine_tb                 *
 * ------------------------------------------------ *
 * File        : vending_machine_tb.v               *
 * Author      : Nallinikanth                       *
 * Last Edit   : 20/04/2021                         *
 * ------------------------------------------------ *
 * Description : Vending Machine test bench         *
 * ------------------------------------------------ */


module vending_machine_tb;

reg [0:1] food_categ,select;
reg clk,reset,cancel;
reg [0:1] coin;

wire [0:5] cost_of_product;
wire [0:5] change;
wire [0:4] product_out;
wire [0:5] money_entered ;

vending_machine V (.food_categ(food_categ),
                   .select(select),
                   .coin(coin),
                   .clk(clk),
                   .reset(reset),
                   .cancel(cancel),

                   .cost_of_product(cost_of_product),
                   .change(change),
                   .product_out(product_out),
                   .money_entered(money_entered)
                  );

initial
begin
    clk=1'b0;
    reset =1'b1;
    cancel=0;
end

initial forever #5 clk = ~clk;

initial
begin
    $monitor ($time ,"  PRODUCT = %b  ;  CHANGE = %d  ;  CANCEL = %d  ;  TOTAL_MONEY_ENTERED = %d ",product_out, change, cancel, money_entered);
    $dumpfile("vending_machine.vcd");
    $dumpvars(0,vending_machine_tb);
    #1 reset = 0;
    #1 select = 2'b10; food_categ = 2'b11;
    #1 coin =  2'b10;
    #10 coin = 2'b10;cancel = 1;
    #10 coin = 2'b00;
    #50 $finish;
end

endmodule
