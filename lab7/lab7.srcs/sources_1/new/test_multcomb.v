`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/02 16:26:38
// Design Name: 
// Module Name: test_multcomb
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


module test_multcomb(
        input clk,
        input [3:0] a,
        input [3:0] b,
        output reg out
    );
    
    reg [3:0] reg_a, reg_b;
    wire wire_out;
    always @(posedge clk) begin
        reg_a <= a;
        reg_b <= b;
        out <= wire_out;
    end

    multcomb mult(.a(reg_a),.b(reg_b),.out(wire_out));
endmodule
