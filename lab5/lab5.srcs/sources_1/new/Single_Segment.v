`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/27 20:02:44
// Design Name: 
// Module Name: Single_Segment
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


module Single_Segment(
        input [3:0] num,
        output reg [7:0] led_sig
    );
    
    always @(*) begin
        case (num)
        4'd0    :   led_sig = 8'b00111111;
        4'd1    :   led_sig = 8'b00000110;
        4'd2    :   led_sig = 8'b01011011;
        4'd3    :   led_sig = 8'b01001111;
        4'd4    :   led_sig = 8'b01100110;
        4'd5    :   led_sig = 8'b01101101;
        4'd6    :   led_sig = 8'b01111101;
        4'd7    :   led_sig = 8'b00000111;
        4'd8    :   led_sig = 8'b01111111;
        4'd9    :   led_sig = 8'b01101111;
        4'd10   :   led_sig = 8'b01110111;
        4'd11   :   led_sig = 8'b01111100;
        4'd12   :   led_sig = 8'b00111001;
        4'd13   :   led_sig = 8'b01011110;
        4'd14   :   led_sig = 8'b01111001;
        4'd15   :   led_sig = 8'b01110001;
        endcase
    end
endmodule
