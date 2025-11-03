`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/27 18:17:53
// Design Name: 
// Module Name: lock
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: A lock that open only when detected 0100
// 
//////////////////////////////////////////////////////////////////////////////////


module lock(
        input clk,
        input rst,
        input in,
        output wire unlock
    );

    // 状态空间位数 n
    parameter WIDTH = 3;
    // 状态变量
    reg [WIDTH-1: 0] state, next_state;
    
    // 状态编码
    localparam S0 = 3'd0;
    localparam S1 = 3'd1;
    localparam S2 = 3'd2;
    localparam S3 = 3'd3;
    localparam S4 = 3'd4;

    // next state generate
    always @(*) begin
        next_state = state;
        case (state)
            S0: begin
                if(in == 1'b0) next_state = S1;
                else next_state = S0;
            end 
            S1: begin
                if(in == 1'b0) next_state = S1;
                else next_state = S2;
            end
            S2: begin
                if(in == 1'b0) next_state = S3;
                else next_state = S0;
            end
            S3: begin
                if(in == 1'b0) next_state = S4;
                else next_state = S2;
            end
            S4: begin
                if(in == 1'b0) next_state = S1;
                else next_state = S2;
            end
            default: next_state = S0;
        endcase
    end

    // next state to state
    always @(posedge clk) begin
        if(rst) state <= S0;
        else state <= next_state;
    end

    // output logic
    assign unlock = (state == S4);
endmodule
