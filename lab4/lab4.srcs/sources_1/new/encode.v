`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/26 11:36:07
// Design Name: 
// Module Name: encode
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


module encode(
    input [3:0]         I,
    output reg [1:0]    Y,
    output reg          en
);
// Write your codes here 

always @(*) begin
    en = (I != 4'd0);
    case (I)
        4'b1000: Y = 2'b11;
        4'b0100: Y = 2'b10;
        4'b0010: Y = 2'b01;
        4'b0001: Y = 2'b00;
        default: Y = 2'b00;
    endcase
end

// End of your codes
endmodule