`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 14:14:42
// Design Name: 
// Module Name: ALU3_top
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
本小题中的 ALU 限制到 3 位，与 Lab3 中的七段数码管显示模块结合，实现一个可视化的 ALU。

其中，用 sw[5:3] 与 sw[2:0] 分别表示输入 src0、src1，使用 sw[7:6] 代表 sel 选择 ALU 运算，输出结果显示在七段数码管上。其中， sw[7:6]=2'b00 时表示加法；sw[7:6]=2'b01 时表示减法；sw[7:6]=2'b10 时表示有符号比较；sw[7:6]=2'b11 时表示无符号比较。

此外，考虑到 ALU 是一个组合逻辑单元，因此其运算结果需可以根据输入的变化实时更新。比如：sw[7:0]=8'b00_100_011 时，七段数码管显示 7；拨动开关使得 sw[7:0]=8'b11_100_011 时，七段数码管显示 0。
*/

module ALU3_top(
        input                   [ 0 : 0]        clk,
        input                   [ 0 : 0]        rst,
        input                   [ 7 : 0]        sw,

        output      wire         [ 3 : 0]        seg_data,
        output      wire         [ 2 : 0]        seg_an
    );

    wire [2:0] src0 = sw[5:3];
    wire [2:0] src1 = sw[2:0]; 
    wire [1:0] sel = sw[7:6];
    wire [2:0] res;

    ALU3 alu(.src0(src0),.src1(src1),.sel(sel),.res(res));

    Segment seg(
            .clk(clk),
            .rst(rst),
            .output_data({29'd0, res}),
            .output_valid({8'hff}),
            .seg_data(seg_data),
            .seg_an(seg_an)
    );
endmodule
