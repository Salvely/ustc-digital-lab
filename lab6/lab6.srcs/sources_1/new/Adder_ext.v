`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 19:05:30
// Design Name: 
// Module Name: Adder_ext
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


module Adder_ext(
        input [3:0] src0,
        input [3:0] src1,
        input cin,
        output [4:0] signed_res,
        output [4:0] unsigned_res
    );

    wire [3:0] res;
    wire unsigned_cout;
    Adder_LookAhead4 unsigned_adder(.a(src0),.b(src1),.cin(cin),.s(res),.cout(unsigned_cout));
    // unsigned addition
    assign unsigned_res = {unsigned_cout, res};

    // signed addition
    wire signed_cout;
    Adder5 signed_adder(.a({src0[3],src0}),.b({src1[3],src1}),.cin(cin),.s(signed_res),.cout(signed_cout));
endmodule
