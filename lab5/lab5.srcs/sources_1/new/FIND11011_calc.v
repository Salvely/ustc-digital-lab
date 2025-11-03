`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/08 14:21:48
// Design Name: 
// Module Name: FIND11011_calc
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


module FIND11011_calc(
        input clk,            // 时钟信号
        input start,
        input               [99 : 0]        src,            // 输入数据
        output      reg                     res,            // 输出结果
        output      reg                     res_valid       // 表明输出结果是否有效
    );
    
    reg [7:0] i;
    parameter S0 = 4'd0, S1 = 4'd1, S2 = 4'd2, S3 = 4'd3, S4 = 4'd4, S5 = 4'd5, S6 = 4'd6, S7 = 4'd7, S8 = 4'd8, S9 = 4'd9, S10 = 4'd10;
    reg [3:0] state, next_state;
    reg current_bit;
    
    // next state logic
    always @(*) begin
        current_bit = src[i-1];
        case(state)
            S0: next_state = (current_bit == 1'b1)? S1: S0;
            S1: next_state = (current_bit == 1'b1)? S2: S0;
            S2: next_state = (current_bit == 1'b0)? S3: S0;
            S3: next_state = (current_bit == 1'b1)? S4: S0;
            S4: next_state = (current_bit == 1'b1)? S5: S0;
            S5: next_state = (current_bit == 1'b0)? S6: S9;
            S6: next_state = (current_bit == 1'b1)? S7: S0;
            S7: next_state = (current_bit == 1'b1)? S8: S0;
            S8: next_state = S8;
            S9: next_state = (current_bit == 1'b0)? S6: S10;
            S10: next_state = (current_bit == 1'b0)? S6: S0;
            default: next_state = state;
        endcase
    end

    // next state to state
    always @(posedge clk) begin
        if(start) begin
            state <= S0;
            i <= 8'd100;
        end
        else begin
            state <= next_state;
            i <= i - 1;
        end
    end

    // output logic
    always @(*) begin
        res_valid = (i == 0) | (state == S8);
        res = res_valid & (state == S8);
    end
endmodule
