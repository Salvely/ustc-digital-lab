`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 16:39:47
// Design Name: 
// Module Name: Shift_power
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
我们也可以按照右操作数 src1[4:0] 二进制的各位数字，对 src0 连续地进行 16、8、4、2、1 移位。举例来说，src1[4:0]=5'b10110 时，可以用位拼接对 src0 移 16 位，再移 4 位，最后移 2 位。这种实现方式最多需要经过五次位拼接操作和多选器的延迟，耗时相对较长，但只需要 5 个位拼接单元，资源压力较小。（类似快速幂的思路）
*/
module Shift_power(
    input                   [31 : 0]        src0,
    input                   [ 4 : 0]        src1,
    output wire                 [31 : 0]        res1,       //逻辑右移
    output wire                 [31 : 0]        res2        //算术右移
    );
    
    reg [31:0] res1temp;
    reg [31:0] res2temp;

    always @(*) begin
        res1temp = src0;
        res2temp = src0;
        if(src1[4]) begin
            res1temp = {16'd0, res1temp[31:16]};
            res2temp = {{16{src0[31]}},src0[31:16]};
        end
        if(src1[3]) begin
            res1temp = {8'd0,res1temp[31:8]};
            res2temp = {{8{res2temp[31]}},res2temp[31:8]};
        end
        if(src1[2]) begin
            res1temp = {4'd0,res1temp[31:4]};
            res2temp = {{4{res2temp[31]}}, res2temp[31:4]};
        end
        if(src1[1]) begin
            res1temp = {2'd0,res1temp[31:2]};
            res2temp = {{2{res2temp[31]}}, res2temp[31:2]};
        end
        if(src1[0]) begin
            res1temp = {1'd0, res1temp[31:1]};
            res2temp = {res2temp[31], res2temp[31:1]};
        end 
    end
    
    assign res1 = res1temp;
    assign res2 = res2temp;
endmodule
