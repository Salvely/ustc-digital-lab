`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/06 09:21:47
// Design Name: 
// Module Name: Regfile
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
1. 寄存器堆的规模为 32x32bits；
2. 0 号寄存器始终保持 0；
3. 写优先：当对相同地址的寄存器同时读写时，读到的为正写入的最新数据。
4. 编号低的功能优先级更高（即功能3需要在满足功能2的基础上实现，不能破坏功能2）。

注意寄存器为读时钟异步，写时钟同步。“同时读写”的意思是对于同一个地址下一周期即将写入数据时本周期就能读到即将写入的值。
*/

module Regfile (
    input                       clk,          // 时钟信号
    input           [4:0]       ra1,          // 读端口 1 地址
    input           [4:0]       ra2,          // 读端口 2 地址

    input           [4:0]       wa,           // 写端口地址
    input                       we,           // 写使能信号
    input           [31:0]      din,          // 写数据
    
    output  reg     [31:0]      dout1,        // 读端口 1 数据输出
    output  reg     [31:0]      dout2         // 读端口 2 数据输出
);
// Write your code here
    reg [31:0] file [31:0];
    reg [31:0] data_in;

    always @(*) begin
        file[5'd0] = 32'd0;
        if(wa == 5'd0) data_in = 32'd0;
        else data_in = din;
        dout1 = (ra1 == wa) ? data_in: file[ra1];
        dout2 = (ra2 == wa) ? data_in: file[ra2];
    end

    always @(posedge clk) begin
        if(we) begin
            file[wa] <= data_in;
        end
    end
// End of your code
endmodule
