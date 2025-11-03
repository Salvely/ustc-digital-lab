`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/28 13:55:10
// Design Name: 
// Module Name: Counter_tb
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


module Counter_tb(

    );
    reg clk, rst;
    wire [15:0] display_num;
    
    // init clk
    localparam PERIOD = 10;
    initial begin
        clk = 1;
        forever begin
            #(PERIOD / 2) clk = ~clk;
        end
    end

    // init rst
    initial begin
        rst = 1;
        #10 rst = 0;
    end

    // init an instance of the module
    Counter ct(.clk(clk),.rst(rst),.display_num(display_num));
endmodule
