`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/02 15:15:08
// Design Name: 
// Module Name: multcomb
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


module multcomb(
        input wire [3:0] a,
        input wire [3:0] b,
        output wire [7:0] out
    );

    wire [3:0] inter0;
    assign {inter0[2:0],out[0]} = a & {4{b[0]}};
    assign inter0[3] = 1'b0;

    wire [3:0] inter1;
    wire cout1;
    Adder_LookAhead4 adder1(.a(a & {4{b[1]}}),.b(inter0),.cin(1'b0),.s({inter1[2:0],out[1]}),.cout(cout1));
    assign inter1[3] = cout1;

    wire [3:0] inter2;
    wire cout2;
    Adder_LookAhead4 adder2(.a(a & {4{b[2]}}),.b(inter1),.cin(1'b0),.s({inter2[2:0],out[2]}),.cout(cout2));
    assign inter2[3] = cout2;
    
    Adder_LookAhead4 adder3(.a(a & {4{b[3]}}),.b(inter2),.cin(1'b0),.s({out[6:3]}),.cout(out[7]));
endmodule
