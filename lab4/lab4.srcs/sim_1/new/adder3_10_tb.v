`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/26 16:27:33
// Design Name: 
// Module Name: adder3_10_tb
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


module adder3_10_tb(

);
    wire [11:0] a;
    wire [11:0] b;
    wire [11:0] sum;
    wire        cout;
    
    assign a = 12'h589, b = 12'h847;
    adder3_10 adder(.a(a), .b(b), .sum(sum), .cout(cout));
endmodule
