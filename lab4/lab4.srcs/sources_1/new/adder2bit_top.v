`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/26 12:46:42
// Design Name: 
// Module Name: adder2bit_top
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


module adder2bit_top(
    input [7:0] sw,
    output wire [7:0] led
);
    wire    [1:0]         a;
    wire    [1:0]         b;
    wire    [1:0]         out;
    wire                  Cout;

    assign a = sw[3:2];
    assign b = sw[1:0];
    assign led = {{5'b0}, {Cout}, {out}};

    adder2bit a2b(.a(a),.b(b),.out(out),.Cout(Cout));
endmodule
