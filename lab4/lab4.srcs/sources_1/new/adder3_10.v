`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/26 16:14:43
// Design Name: 
// Module Name: adder3_10
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


module adder3_10(
    input           [11:0]         a,
    input           [11:0]         b,
    output   wire    [11:0]         sum,
    output   wire                   cout
);

// Write your code here
    wire cout0, cout1;
    bcd1_adder adder0(.a(a[3:0]), .b(b[3:0]), .cin(1'b0),.sum(sum[3:0]), .cout(cout0));
    bcd1_adder adder1(.a(a[7:4]), .b(b[7:4]), .cin(cout0),.sum(sum[7:4]), .cout(cout1));
    bcd1_adder adder2(.a(a[11:8]), .b(b[11:8]), .cin(cout1),.sum(sum[11:8]), .cout(cout));
// End of your code
endmodule
