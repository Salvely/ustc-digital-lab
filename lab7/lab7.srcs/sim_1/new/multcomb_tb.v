`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/11/02 15:50:59
// Design Name: 
// Module Name: multcomb_tb
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


module multcomb_tb(

    );
    
    reg [3:0] a,b;
    wire [7:0] out;
    
    multcomb mult(.a(a),.b(b),.out(out));
    
    initial begin
        a = 4'd8;
        b = 4'd9;
        #10 a = 4'd11;
        b = 4'd11;
        #10 a = 4'd15;
        b = 4'd15;
    end
endmodule
