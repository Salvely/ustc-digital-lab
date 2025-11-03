`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 14:34:37
// Design Name: 
// Module Name: adder3
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


module adder3(
        input                   [ 2 : 0]        a, b,
        input                   [ 0 : 0]        cin,
        output                  [ 2 : 0]        s,
        output                  [ 0 : 0]        cout
    );

    wire cout0, cout1;
    Adder_1b adder0(.a(a[0]),.b(b[0]),.cin(cin),.out(s[0]),.cout(cout0));
    Adder_1b adder1(.a(a[1]),.b(b[1]),.cin(cout0),.out(s[1]),.cout(cout1));
    Adder_1b adder2(.a(a[2]),.b(b[2]),.cin(cout1),.out(s[2]),.cout(cout));
endmodule
