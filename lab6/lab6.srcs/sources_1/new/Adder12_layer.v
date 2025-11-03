`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/08 20:23:34
// Design Name: 
// Module Name: Adder12_layer
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


module Adder12_layer(
        input                   [ 11 : 0]        a, b,
        input                                   cin,
        output                  [ 11 : 0]        s,
        output                                  cout       
    );

    wire cout0, cout1, cout2;
    
    Adder_LookAhead4 adder0(.a(a[3:0]),.b(b[3:0]),.cin(cin),.s(s[3:0]),.cout(cout0));
    Adder_LookAhead4 adder1(.a(a[7:4]),.b(b[7:4]),.cin(cout0),.s(s[7:4]),.cout(cout1));
    Adder_LookAhead4 adder2(.a(a[11:8]),.b(b[11:8]),.cin(cout1),.s(s[11:8]),.cout(cout));
endmodule
