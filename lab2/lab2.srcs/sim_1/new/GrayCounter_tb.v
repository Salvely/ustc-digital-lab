`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/18 18:18:11
// Design Name: 
// Module Name: GrayCounter_tb
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



module GrayCounter_tb(

    );
    reg clk;
    reg reset;
    wire out;
    
    parameter PERIOD = 10;
    initial begin
        clk = 1'b1;
        forever begin
            #(PERIOD / 2) clk = ~clk;
        end
    end
    
    initial begin
        reset = 1'b1;
        #50 reset = 1'b0;
    end
    
    GrayCounter counter(clk, reset, out);
endmodule

