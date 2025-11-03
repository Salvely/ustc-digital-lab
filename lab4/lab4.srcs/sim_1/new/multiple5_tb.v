`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/27 16:35:45
// Design Name: 
// Module Name: multiple5_tb
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


module multiple5_tb(

    );
    reg [7:0] num;
    wire ismultiple5;
    multiple5 mt(.num(num), .ismultiple5(ismultiple5));

    initial begin
        num = 8'd4;
        #50 num = 8'd9;
        #50 num = 8'd14;
        #50 num = 8'd24;
        #50 num = 8'd29;
        #50 num = 8'd44;
        #50 num = 8'd64;
        #50 num = 8'd0;
        #50 num = 8'd5;
        #50 num = 8'd10;
        #50 num = 8'd15;
        #50 num = 8'd20;
        #50 num = 8'd25;
        #50 num = 8'd30;
        #50 num = 8'd35;
        #50 num = 8'd40;
        #50 num = 8'd45;
        #50 num = 8'd115;
    end
endmodule
