`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 10:41:23
// Design Name: 
// Module Name: segments_display5_top
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


module segments_display5_top(
        input clk,
        input rst,
        output wire [2:0] select,
        output wire [3:0] out
    );

    wire [19:0] output_num = 20'h95830;
    segments_display5 sd(.clk(clk),.rst(rst),.output_num(output_num),.seg_an(select),.seg_data(out));
endmodule
