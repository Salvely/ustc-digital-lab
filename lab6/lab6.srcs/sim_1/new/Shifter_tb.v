`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 16:43:42
// Design Name: 
// Module Name: Shifter_tb
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


module Shifter_tb(

    );
    reg                   [31 : 0]        src0;
    reg                   [ 4 : 0]        src1;
    wire                 [31 : 0]        res1;       //逻辑右移
    wire                 [31 : 0]        res2;       //算术右移

    //Shift_power shifter(.src0(src0),.src1(src1),.res1(res1),.res2(res2));
    Shift_comb shifter(.src0(src0),.src1(src1),.res1(res1),.res2(res2));

    initial begin
        src1 = 5'd0;  
        src0 = 32'h12345678;      
        repeat(32) begin
            #50 src1 = src1 + 1;
        end
    end
endmodule
