`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/08 11:44:21
// Design Name: 
// Module Name: MUL7_calc
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


module MUL7_calc(
        input clk,            // 时钟信号
        input start,
        input               [31 : 0]        src,            // 输入数据
        output      reg                     res,            // 输出结果
        output      reg                     res_valid       // 表明输出结果是否有效
    );

    reg [5:0] i;
    parameter S0 = 3'd0, S1 = 3'd1, S10 = 3'd2, S11 = 3'd3, S100 = 3'd4, S101 = 3'd5, S110 = 3'd6;
    reg [2:0] state, next_state;
    reg current_bit;
    
    // next state logic
    always @(*) begin
        current_bit = src[i-1];
        case(state)
            S0: next_state = (current_bit == 1'b0)? S0: S1;
            S1: next_state = (current_bit == 1'b0)? S10: S11;
            S10: next_state = (current_bit == 1'b0)? S100: S101;
            S11: next_state = (current_bit == 1'b0)? S110: S0;
            S100: next_state = (current_bit == 1'b0)? S1: S10;
            S101: next_state = (current_bit == 1'b0)? S11: S100;
            S110: next_state = (current_bit == 1'b0)? S101: S110;
        endcase
    end

    // next state to state
    always @(posedge clk) begin
        if(start) begin
            state <= S0;
            i <= 6'd32;
        end
        else begin
            state <= next_state;
            i <= i - 1;
        end
    end

    // output logic
    always @(*) begin
        res_valid = (i == 0);
        res = res_valid & (state == S0);
    end
endmodule
