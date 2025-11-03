`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/19 23:38:08
// Design Name: 
// Module Name: Top_tb
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


module Myclock_tb();
reg clk, rst;

initial begin
    clk = 0;
    forever
    #5 clk = ~clk;
end

initial begin
    rst = 1;
    #100 rst = 0;
end

Myclock top_test (
    .clk(clk),
    .rst(rst)
);
endmodule