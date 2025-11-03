`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/08 16:48:34
// Design Name: 
// Module Name: Adder_1b
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


module Adder_1b(
        input a,b,cin,
        output out,cout
    );

    wire out1;
    wire cout1, cout2;
    HalfAdder adder0(.a(a),.b(b),.out(out1),.cout(cout1));
    HalfAdder adder1(.a(out1),.b(cin),.out(out),.cout(cout2));
    HalfAdder adder2(.a(cout1),.b(cout2),.out(cout),.cout());
endmodule
