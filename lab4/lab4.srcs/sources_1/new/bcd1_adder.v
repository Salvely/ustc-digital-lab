`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/26 16:08:48
// Design Name: 
// Module Name: bcd1_adder
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


module bcd1_adder(
        input [3:0] a,
        input [3:0] b,
        input cin,
        output wire [3:0] sum,
        output wire cout
    );

    assign sum = ((cin + a + b) > 5'd9)? (cin + a + b - 4'd10): (cin + a + b);
    assign cout = (cin + a + b > 5'd9);
endmodule
