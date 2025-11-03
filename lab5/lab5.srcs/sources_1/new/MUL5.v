`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/08 10:31:22
// Design Name: 
// Module Name: MUL5
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


module MUL5(
        input rst,
        input clk,
        input in,
        output res
    );
    parameter S0 = 3'd0, S1 = 3'd1, S10 = 3'd2, S11 = 3'd3, S100 = 3'd4;
    reg [2:0] state, next_state;

    // next state logic
    always @(*) begin
        next_state = state;
        case(state)
            S0: next_state = (in == 1'b0)? S0: S1;
            S1: next_state = (in == 1'b0)? S10: S11;
            S10: next_state = (in == 1'b0)? S100: S0;
            S11: next_state = (in == 1'b0)? S1: S10;
            S100: next_state = (in == 1'b0)? S11: S100;
        endcase
    end

    // next state to state
    always @(posedge clk) begin
        if(rst) state <= S0;
        else state <= next_state;
    end

    // output logic
    assign res = (state == S0);
endmodule
