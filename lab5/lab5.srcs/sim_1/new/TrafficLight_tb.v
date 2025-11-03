`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/30 16:25:40
// Design Name: 
// Module Name: TrafficLight_tb
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


module TrafficLight_tb(

    );

    reg clk;
    reg rst;
    wire is_red, is_green, is_yellow;
    wire [7:0] srout;

    // init the clk
    parameter PERIOD = 10;
    initial begin
        clk = 1;
        forever begin
            #(PERIOD / 2) clk = ~clk;  
        end  
    end

    // init the rst
    initial begin
        rst <= 0;
        #10 rst <= 1;
        #10 rst <= 0;    
    end

    // output the 3 signal by initialize an instance of TrafficLight
    TrafficLight tl(.clk(clk),.rst(rst),.is_red(is_red),.is_green(is_green),.is_yellow(is_yellow),.out(srout));
endmodule
