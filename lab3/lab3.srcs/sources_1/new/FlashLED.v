`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/20 12:18:53
// Design Name: 
// Module Name: Top
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


module FlashLED (
    input   [7:0]                       sw,
    output  [7:0]                       led
);
// Write your codes here.
    assign led = {sw[4], sw[5], sw[6], sw[7], sw[0], sw[1], sw[2], sw[3]};
endmodule
