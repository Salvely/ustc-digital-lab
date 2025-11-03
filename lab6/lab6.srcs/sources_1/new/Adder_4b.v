`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/08 17:41:32
// Design Name: 
// Module Name: Adder_4b
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


module Adder_4b(
        input                   [ 3 : 0]        a, b,
        input                                   cin,
        output                  [ 3 : 0]        s,
        output                                  cout        
    );

    wire cout0, cout1, cout2;
    Adder_1b adder0(.a(a[0]),.b(b[0]),.cin(cin),.out(s[0]),.cout(cout0));
    Adder_1b adder1(.a(a[1]),.b(b[1]),.cin(cout0),.out(s[1]),.cout(cout1));
    Adder_1b adder2(.a(a[2]),.b(b[2]),.cin(cout1),.out(s[2]),.cout(cout2));
    Adder_1b adder3(.a(a[3]),.b(b[3]),.cin(cout2),.out(s[3]),.cout(cout));
endmodule
