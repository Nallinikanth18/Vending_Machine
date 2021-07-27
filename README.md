# Vending Machine

## BASIC DESCRIPTION ON THE MACHINE
The Vending machine has 16 different food items arranged in it. The food items are classified into 4 sections they are CHIPS, CHOCOLATES, SOFT  DRINKS, INSTANT NOODLES. Each of the above categories have 4 different types of food in them. Like this there are 16 items in the wending machine.
food items belong to same type of section are arranged in same column, Thus there are 4 different columns.
The cost of food in each column is 15, 20, 25, 30 also the arrangement is in ascending order (top to bottom according to price). And the machine accepts only 5,10,20 Rs coins. User can also use cancel button to cancel the order and the machine also gives change if necessary.

## WORKING
1)Firstly, the user has to press the start(reset) button0, to start the vending machine.
2)Secondly, the user should give food_categ using sw[0:1] (00--> chips, 01--> chocolates, 10--> soft drinks, 11--> instant noodles).
3)After this, the user should give select using sw[2:3] (00--> 15Rs, 01--> 20Rs, 10--> 25Rs, 11--> 30Rs).
4)Then by using buttons user can insert coins to (button1-->5Rs, button2-->10Rs, button3-->20Rs) also user cannot press two button simultaneously.
5)The machine accepts input until the entered money equals or exceeds the price of expected product and then gives product and change(if necessary).
6)The user can also use cancel (button4) at any instant of the process to cancel the purchase and in this case the user will receive the total entered money as change.
