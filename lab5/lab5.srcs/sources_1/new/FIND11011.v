`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/01 10:39:34
// Design Name: 
// Module Name: FIND11011
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
假设输入为一个 100 位的 0 与 1 构成的串 a，我们希望确定 a 中是否有连续的 11011 子串。请根据数据结构知识，构造状态机解决此问题，各信号的作用类似选择性必做题目 1。
*/
module FIND11011(
    input                               clk,            // 时钟信号
    input                               rst,            // 复位信号，使状态机回到初始态
    input               [99:0]          src,            // 输入数据
    input                               src_valid,      // 表明输入结果是否有效
    output      wire                     res,            // 输出结果
    output      wire                     res_valid       // 表明输出结果是否有效
);

// Write your code here
    wire ready;
    parameter IDLE = 2'd0, CALC = 2'd1, DONE = 2'd2;
    reg [1:0] state, next_state;

// next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: next_state = (src_valid == 1'b0)? IDLE: CALC;
            CALC: next_state = (res_valid == 1'b0)? CALC: DONE;
            DONE: next_state = (src_valid == 1'b0)? DONE: CALC;
        endcase
    end

// generate next state
    always @(posedge clk) begin
        if(rst) state <= IDLE;
        else state <= next_state;
    end

// output logic
    assign ready = (state == IDLE) || (state == DONE);
    wire start = ready & src_valid;
    FIND11011_calc calc(.clk(clk),.start(start),.src(src),.res(res),.res_valid(res_valid));
// End of your code
endmodule