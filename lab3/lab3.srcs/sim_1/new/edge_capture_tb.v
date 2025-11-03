`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/20 15:41:12
// Design Name: 
// Module Name: edge_capture_tb
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


module edge_capture_tb(

    );
    reg clk;
    reg rst;
    reg sig_in;
    wire pos_edge;
    wire neg_edge;

    parameter PERIOD = 10;
    initial begin
        clk = 1'b1;
        forever begin
            #(PERIOD / 2) clk = ~clk;
        end
    end

    initial begin
        rst = 1'b1;
        #50 rst = 1'b0;
    end
    
    initial begin
        sig_in = 1'b1;
        forever begin
            #(PERIOD) sig_in = ~sig_in;
        end
    end
    edge_capture ec(.clk(clk),.rst(rst),.sig_in(sig_in),.pos_edge(pos_edge),.neg_edge(neg_edge));
endmodule
