`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/30 16:21:55
// Design Name: 
// Module Name: TrafficLight_top
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


module TrafficLight_top(
        input                   clk,
        input                   rst,
        output [7:0]            led,
        output          [3:0]       seg_data,
        output          [2:0]       seg_an
    );
    
    wire is_red, is_green, is_yellow;
    assign led[2] = is_green;
    assign led[1] = is_yellow;
    assign led[0] = is_red;
    assign led[7:3] = 5'd0;

    wire [7:0] srout;
    
    // output the 3 signal by initialize an instance of TrafficLight
    TrafficLight tl(.clk(clk),.rst(rst),.is_red(is_red),.is_green(is_green),.is_yellow(is_yellow),.out(srout));

    segments_displayg #(.WIDTH(2)) sd(.clk(clk),.rst(rst),.output_num(srout),.seg_an(seg_an),.seg_data(seg_data));
endmodule
