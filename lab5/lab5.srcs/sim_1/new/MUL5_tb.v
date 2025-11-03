`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/08 10:32:40
// Design Name: 
// Module Name: MUL5_tb
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


module MUL5_tb(

    );

    reg rst;
    reg clk;
    reg in;
    wire res;
    
    MUL5 m(.clk(clk),.rst(rst),.in(in),.res(res));

    // init the clk
    parameter PERIOD = 10;
    initial begin
        clk = 1;
        forever begin
            #(PERIOD / 2) clk = ~clk;
        end
    end

    // init the rst
    initial begin
        rst <= 1;
        #10 rst <= 0;
    end

    // init the input
    reg [31:0] num;
    integer i;
    initial begin
        num = 32'd0;
        forever begin
            for(i = 31; i >= 0; i = i - 1) begin
                in = num[i];
                #10;
            end
            num = num + 1;
        end
    end
endmodule
