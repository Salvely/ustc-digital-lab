`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/28 09:46:27
// Design Name: 
// Module Name: TIMER
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


/**
一共有8个数码管，采用分时复用的方式点亮每个数码管，每个数码管的刷新频率为50Hz。
请设计一个精度为 0.1 秒的计时器，该计时器采用按钮作为复位功能。
用 4 位数码管显示出来，数码管从高到低，分别表示分钟（10）、秒钟十位（10）、秒钟个位（10）、十分之一秒（10）

注意：数码管使用seg_an[2:0]进行片选，显示seg_data[3:0]对应的十进制数；
*/
module TIMER(
        input clk,
        input btn,
        
        output wire [2:0] seg_an,
        output wire [3:0] seg_data
    );

    wire [15:0] display_num;

    Counter ct(.clk(clk),.rst(btn),.display_num(display_num));
    segments_display sd(.clk(clk),.rst(btn),.output_num(display_num),.seg_an(seg_an),.seg_data(seg_data));
endmodule
