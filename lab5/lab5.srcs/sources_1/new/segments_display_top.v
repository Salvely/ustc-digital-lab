`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/28 10:42:05
// Design Name: 
// Module Name: segments_display_top
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


module segments_display_top(
        input clk,
        input btn,
        output wire [2:0] seg_an,
        output wire [3:0] seg_data
    );

    wire [15:0] output_num = 16'h1234;
    
    segments_display sd(.clk(clk),.rst(btn),.output_num(output_num),.seg_an(seg_an),.seg_data(seg_data));
endmodule
