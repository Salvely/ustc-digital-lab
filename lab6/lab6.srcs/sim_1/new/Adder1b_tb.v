`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/08 16:59:30
// Design Name: 
// Module Name: Adder1b_tb
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


module Adder1b_tb(

    );

    reg a,b,cin;
    wire out, cout;

    Adder_1b adder(.a(a),.b(b),.cin(cin),.out(out),.cout(cout));

    initial begin
        {a,b,cin} = 3'd0;
        forever begin
            #10 {a,b,cin} = {a,b,cin} + 3'd1;
        end
    end
endmodule
