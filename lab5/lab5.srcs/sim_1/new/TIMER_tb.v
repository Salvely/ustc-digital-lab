`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/28 16:06:33
// Design Name: 
// Module Name: TIMER_tb
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


module TIMER_tb(

    );
    reg clk, btn;
    wire [2:0] seg_an;
    wire [3:0] seg_data;
    
    // init clk
    localparam PERIOD = 10;
    initial begin
        clk = 1;
        forever begin
            #(PERIOD / 2) clk = ~clk;
        end
    end

    // init btn
    initial begin
        btn = 1'b1;
        #20 btn = 1'b0;
    end
    

    // init an instance of the module
    TIMER t(.clk(clk),.btn(btn),.seg_an(seg_an),.seg_data(seg_data));
endmodule
