`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/30 11:21:56
// Design Name: 
// Module Name: edgedetect_tb
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


module edgedetect_tb(

    );

    reg clk;
    reg in;
    reg en;
    wire isposedge;
    wire isnegedge;

    localparam PERIOD = 10;

    initial begin
        clk = 1;
        forever begin
            #(PERIOD / 2) clk = ~clk;
        end
    end

    initial begin
        en = 0;
        #20 en = 1;
    end

    initial begin
        in = 1;
        forever begin
            #(PERIOD) in = ~in;
        end
    end

    edgedetect ec(.clk(clk),.in(in),.en(en),.isposedge(isposedge),.isnegedge(isnegedge));
endmodule
