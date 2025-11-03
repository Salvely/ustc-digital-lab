`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/25 20:14:10
// Design Name: 
// Module Name: test_adder12layer
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


module test_adder12layer(
        input clk,
        input                   [ 11 : 0]        a, b,
        input                                   cin,
        output reg                [ 11 : 0]        s,
        output reg                                 cout
    );
    
    reg [11:0] a_reg, b_reg;
    reg cin_reg;
    wire [11:0] s_wire;
    wire cout_wire;

    Adder12_layer adder(.a(a_reg),.b(b_reg),.cin(cin_reg),.s(s_wire),.cout(cout_wire));
    
    always @(posedge clk) begin
        a_reg <= a;
        b_reg <= b;
        s <= s_wire;
        cout <= cout_wire;
    end
endmodule
