`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/01 09:30:30
// Design Name: 
// Module Name: CoinMachine_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CoinMachine_tb(

    );

    reg clk, rst, A, B;
    wire Y,Z;
    parameter PERIOD = 10;

    CoinMachine cm(.clk(clk),.rst(rst),.A(A),.B(B),.Y(Y),.Z(Z));

    // init the clk
    initial begin
        clk = 1;
        forever begin
            #(PERIOD / 2) clk = ~clk;
        end
    end
    
    // init the rst
    initial begin
        rst <= 1;
        #20 rst <= 0;
    end

    // init A and B
    initial begin
        #30 {A,B} <= 2'b00;
        #10 {A,B} <= 2'b11;
        #10 {A,B} <= 2'b01;
        #10 {A,B} <= 2'b10;
        
        #10 {A,B} <= 2'b00;
        #10 {A,B} <= 2'b01;
        #10 {A,B} <= 2'b10;

        #10 {A,B} <= 2'b10;
        #10 {A,B} <= 2'b10;
        
        #10 {A,B} <= 2'b11;
        #10 {A,B} <= 2'b10;
    end
endmodule
