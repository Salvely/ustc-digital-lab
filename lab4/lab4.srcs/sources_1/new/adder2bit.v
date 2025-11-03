`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/26 12:46:08
// Design Name: 
// Module Name: adder2bit
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

module adder2bit(
    input           [1:0]         a,
    input           [1:0]         b,
    output   wire    [1:0]         out,
    output   wire                  Cout
);

// Write your code here
    wire cout0;
    adder1bit adder0(.a(a[0]),.b(b[0]),.cin(1'b0),.out1(out[0]),.cout(cout0));
    adder1bit adder1(.a(a[1]),.b(b[1]),.cin(cout0),.out1(out[1]),.cout(Cout));
// End of your code
endmodule
