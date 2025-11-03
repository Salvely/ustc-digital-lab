`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/27 18:35:41
// Design Name: 
// Module Name: lock_tb
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


module lock_tb(

    );
    reg clk;
    reg in;
    reg rst;
    wire unlock;
    
    localparam PERIOD = 10;
    lock lck(.clk(clk),.rst(rst),.in(in),.unlock(unlock));
    
    initial begin
        clk = 1'b1;
        forever begin
            #(PERIOD / 2) clk = ~clk;
        end
    end

    initial begin
        rst = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #50 rst = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0;
        #10 in = 1;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0; // accept
        #10 in = 0;
        #10 in = 1;
        #10 in = 0;
        #10 in = 0; // accept
        #10 in = 1;
        #10 in = 0;
        #10 in = 0; // accept
    end
endmodule
