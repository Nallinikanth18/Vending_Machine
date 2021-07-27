/* ------------------------------------------------ *
 * Project     : Vending Machine                    *
 * Module      : vending_machine                    *
 * ------------------------------------------------ *
 * File        : vending_machine.v                  *
 * Author      : Nallinikanth                       *
 * Last Edit   : 20/04/2021                         *
 * ------------------------------------------------ *
 * Description : Board                              *
 * ------------------------------------------------ */

 // included module : vending_machine
 // included module : seven_seg_control
 // included module : clk_divider_vm
 // included module : debouncer

module board (input clk,
              input btn0,
              input btn1,
              input btn2,
              input btn3,
              input btn4,
              input [1:0] sw01,
              input [3:2] sw23,

              output [0:6] segments,
              output [0:15] led,
              output [0:3] anode);


//start(reset) will be connected to btn0
//5rs will be connected to btn1
//10rs will be connected to btn2
//20rs will be connected to btn3
//cance will be connected to btn4
//
//food_categ will be connected to sw01[1:0]
//select will be connected to sw23[3:2]
//when Vending Machine starts led[0] will be on
//when cancel is on led[15] will be on
//for displaying total money given to machine led[8:3] is used
//for displaying product coming out of machine led[14:11] is used
//
//alarm_detector will be connected to led[4]
//when ld_alarm_hr is on led[5] will be on so that user can enter hours
//when ld_alarm_min is on led[6] will be on so that user can enter minutes
//when ld_alarm_sec is on led[7] will be on so that user can enter seconds
//alarm_light is connected to led[8:15]


wire [0:1] food_categ, // there are 4 categories of food chocolates, chips, beverages, etc:-
wire [0:1] select,      // To select particular snack from the above category
wire [0:1] coin,
wire reset,
wire cancel,
wire [0:5] cost_of_product,
wire [0:5] change,
wire [0:4] product_out,
wire [0:5] money_entered //Total money entered be the user

wire clk_out2Hz;

wire pre_coin_5,
     pre_coin_10,
     pre_coin_20;

assign food_categ[0:1] = sw01[1:0];
assign select[0:1]     = sw23[3:2];

assign led[0] = V.start;
assign led[8:3]= money_entered;
assign led[14:11] = product_out[1:4];
assign led[15] = cancel;

assign coin = btn1 ? 2'b01 : (btn2 ? 2'b10 : (btn3 ? 2'b11 : 2'b00));

vending_machine V (.food_categ(food_categ),
                   .select(select),
                   .coin(coin),
                   .clk(clk_out2Hz),
                   .reset(reset),
                   .cancel(cancel),

                   .cost_of_product(cost_of_product),
                   .change(change),
                   .product_out(product_out),
                   .money_entered(money_entered)
                  );


clk_divider_vm(.clk_in(clk),
               .reset(reset),
               .clk_out(clk_out2Hz));    //clk_out2Hz has time period of 2 seconds



//for start(reset) button
debouncer DB1(.clk(clk_out2Hz),
              .in(btn0),         // port from the push button
              .out(reset),       // port into the circuit
              );

//for coin = 5Rs
debouncer DB2(.clk(clk_out2Hz),
              .in(btn1),         // port from the push button
              .out(pre_coin_5), // port into the circuit
              );

//for coin = 10Rs
debouncer DB3(.clk(clk_out2Hz),
              .in(btn2),         // port from the push button
              .out(pre_coin_10),  // port into the circuit
              );

//for coin = 20Rs
debouncer DB4(.clk(clk_out2Hz),
              .in(btn3),         // port from the push button
              .out(pre_coin_20),       // port into the circuit
              );

//for cancel
debouncer DB5(.clk(clk_out2Hz),
              .in(btn4),         // port from the push button
              .out(cancel),    // port into the circuit
              );


seven_seg_control ssd (.x(cost_of_product),
                       .y(change),
                       .clk(clk),
                       .reset(reset),
                       .anode(anode),
                       .segment(segment));
endmodule
