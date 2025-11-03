`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/26 12:11:02
// Design Name: 
// Module Name: encode_top
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


module encode_top(
    input [3:0] sw,
    output wire [7:0] led
    );
    
    wire [3:0] I;
    wire [1:0] Y;
    wire en;

    encode ec(
        .I(I),
        .Y(Y),
        .en(en)
    );
        
    assign I = sw[3:0];
    assign led = {{en}, {5'b0}, {Y}};
endmodule
