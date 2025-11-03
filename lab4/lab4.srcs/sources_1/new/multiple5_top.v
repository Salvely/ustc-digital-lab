`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/27 15:37:52
// Design Name: 
// Module Name: multiple5_top
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


module multiple5_top(
        input [7:0] sw,
        output [7:0] led
    );
    wire ismultiple5;
    assign led[0] = ismultiple5;
    assign led[7:1] = {7{1'b0}};
    multiple5 mul(.num(sw),.ismultiple5(ismultiple5));
endmodule
