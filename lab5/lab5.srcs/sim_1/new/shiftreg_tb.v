`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 11:59:59
// Design Name: 
// Module Name: shiftreg_tb
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


module shiftreg_tb(

    );
    localparam PERIOD = 10;

    reg clk;
    reg rst;
    reg en;
    reg [3:0] din;
    wire [31:0] srout;
    wire [3:0] out;

    shiftreg sr(.clk(clk),.rst(rst),.en(en),.din(din),.srout(srout),.out(out));
    
    // init clk
    initial begin
        clk = 1;
        forever begin
            #(PERIOD / 2) clk = ~clk;
        end
    end

    // init din
    initial begin
        din = 4'h1;
        forever begin
            #(PERIOD) din = din + 4'h1;
        end
    end

    // init rst and en
    initial begin
       rst = 1; en = 0;
       #20 rst = 0;
       #10 en = 1; 
    end
endmodule
