`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 19:22:51
// Design Name: 
// Module Name: Adderext_tb
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


module Adderext_tb(

    );
    wire [3:0] src0;
    wire [3:0] src1;
    wire cin;
    wire [4:0] signed_res;
    wire [4:0] unsigned_res;

    assign src0 = 4'b0100;
    assign src1 = 4'b1111;
    Adder_ext adder(.src0(src0),.src1(src1),.cin(1'b0),.signed_res(signed_res),.unsigned_res(unsigned_res));
endmodule
