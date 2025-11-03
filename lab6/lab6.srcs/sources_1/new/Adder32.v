`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/09 19:09:08
// Design Name: 
// Module Name: Adder32
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


module Adder32(
        input [31:0] a,
        input [31:0] b,
        input cin,
        output [31:0] s,
        output cout
    );

    // wire cout0, cout1, cout2, cout3, cout4, cout5, cout6, cout7;
    // Adder_LookAhead4 adder0(.a(a[3:0]),.b(b[3:0]),.cin(cin),.s(s[3:0]),.cout(cout0));
    // Adder_LookAhead4 adder1(.a(a[7:4]),.b(b[7:4]),.cin(cout0),.s(s[7:4]),.cout(cout1));
    // Adder_LookAhead4 adder2(.a(a[11:8]),.b(b[11:8]),.cin(cout1),.s(s[11:8]),.cout(cout2));
    // Adder_LookAhead4 adder3(.a(a[15:12]),.b(b[15:12]),.cin(cout2),.s(s[15:12]),.cout(cout3));
    // Adder_LookAhead4 adder4(.a(a[19:16]),.b(b[19:16]),.cin(cout3),.s(s[19:16]),.cout(cout4));
    // Adder_LookAhead4 adder5(.a(a[23:20]),.b(b[23:20]),.cin(cout4),.s(s[23:20]),.cout(cout5));
    // Adder_LookAhead4 adder6(.a(a[27:24]),.b(b[27:24]),.cin(cout5),.s(s[27:24]),.cout(cout6));
    // Adder_LookAhead4 adder7(.a(a[31:28]),.b(b[31:28]),.cin(cout6),.s(s[31:28]),.cout(cout7));
    // assign cout = cout7;

    wire cout0, cout1, cout2;
    Adder_LookAhead8 adder0(.a(a[7:0]),.b(b[7:0]),.cin(cin),.s(s[7:0]),.cout(cout0));
    Adder_LookAhead8 adder1(.a(a[15:8]),.b(b[15:8]),.cin(cout0),.s(s[15:8]),.cout(cout1));
    Adder_LookAhead8 adder2(.a(a[23:16]),.b(b[23:16]),.cin(cout1),.s(s[23:16]),.cout(cout2));
    Adder_LookAhead8 adder3(.a(a[31:24]),.b(b[31:24]),.cin(cout2),.s(s[31:24]),.cout(cout));
endmodule
