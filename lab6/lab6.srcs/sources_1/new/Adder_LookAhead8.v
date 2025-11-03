`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 13:18:34
// Design Name: 
// Module Name: Adder_LookAhead8
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


module Adder_LookAhead8(
        input                   [ 7 : 0]        a, b,
        input                   [ 0 : 0]        cin,
        output                  [ 7 : 0]        s,
        output                  [ 0 : 0]        cout
    );

    wire cout0;
    Adder_LookAhead4 adder0(.a(a[3:0]),.b(b[3:0]),.cin(cin),.s(s[3:0]),.cout(cout0));
    Adder_LookAhead4 adder1(.a(a[7:4]),.b(b[7:4]),.cin(cout0),.s(s[7:4]),.cout(cout));
endmodule
