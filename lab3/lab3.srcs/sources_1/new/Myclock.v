`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/19 23:37:42
// Design Name: 
// Module Name: Top
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

module Myclock (
    input               clk,
    input               rst
);
wire clk_10m, clk_200m, locked;

myclock clock(
    .clk_in1    (clk),
    .clk_out1   (clk_10m),
    .clk_out2   (clk_200m),
    .reset      (rst),
    .locked     (locked)
);
endmodule