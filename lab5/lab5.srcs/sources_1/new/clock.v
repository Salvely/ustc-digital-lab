`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 10:21:06
// Design Name: 
// Module Name: clock
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

module clock (
    input                           clk, rst,
    output      wire     [3:0]       out, // 原seg_data
    output      wire     [2:0]       select // 原seg_an
);
// Write your code here

    wire [19:0] display_num;

    Counter5 ct(.clk(clk),.rst(rst),.display_num(display_num));
    segments_display5 sd(.clk(clk),.rst(rst),.output_num(display_num),.seg_an(select),.seg_data(out));
// End of your code
endmodule