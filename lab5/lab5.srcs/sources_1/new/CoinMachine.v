`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/30 22:00:09
// Design Name: 
// Module Name: CoinMachine
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

module CoinMachine (
    input                   clk,
    input                   rst,
    input                   A,
    input                   B,
    output                  Y,
    output                  Z
);
// Write your code here
    reg state, next_state;
    parameter S0 = 1'b0, S1 = 1'b1;
    
    // next state logic
    always @(*) begin
        case(state)
            S0: begin
                next_state = state;
                if({A,B} == 2'b10) next_state = S1;
            end
            S1: begin
                next_state = state;
                if({A,B} == 2'b01 | {A,B} == 2'b10 | {A,B} == 2'b11) next_state = S0;
            end
        endcase
    end

    // next state to state
    always @(posedge clk) begin
        if(rst) state <= S0;
        else state <= next_state;
    end

    // output logic
    assign Y = (~A & B) | (A & ~B & state);
    assign Z = (~A & B & state);
// End of your code
endmodule
