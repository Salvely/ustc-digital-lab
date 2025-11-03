`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 16:42:38
// Design Name: 
// Module Name: Shift_comb
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

// a combined implementation method of bit concatentation and power shift

/**
本题要求同时结合两种实现方式，占 3 分，其中逻辑右移与算术右移的分数各占一半。结合两种方式的实现要求最多经过 3 次"位拼接和多选器"的延迟，总共使用不多于 12 个位拼接单元(由题意，显然逻辑右移和算数右移是两个独立的模块，所以这里规定的是一个模块使用不多于12个)。
*/
module Shift_comb(
    input                   [31 : 0]        src0,
    input                   [ 4 : 0]        src1,
    output                  [31 : 0]        res1,       //逻辑右移
    output                  [31 : 0]        res2        //算术右移
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
        case(src1[1:0])
            2'd1: begin
                res1temp = {1'b0, res1temp[31:1]};
                res2temp = {res1temp[31], res2temp[31:1]};
            end
            2'd2: begin
                res1temp = {2'b0, res1temp[31:2]};
                res2temp = {{2{res2temp[31]}}, res2temp[31:2]};
            end
            2'd3: begin
                res1temp = {3'b0, res1temp[31:3]};
                res2temp = {{3{res2temp[31]}}, res2temp[31:3]};
            end
        endcase
    end

    assign res1 = res1temp;
    assign res2 = res2temp;
endmodule
