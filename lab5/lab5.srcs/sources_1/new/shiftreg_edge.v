`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/30 11:40:11
// Design Name: 
// Module Name: shiftreg_edge
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


module shiftreg_edge(
        input                       clk,
        input                       rst,
        input                       en,
        input           [3:0]       din,
        output          [3:0]       seg_data,
        output          [2:0]       seg_an,
        output          [7:0]       led_sig 
    );

    wire isposedge;
    wire [31:0] srout;

    edgedetect ec(.clk(clk),.rst(rst),.in(en),.isposedge(isposedge));
    shiftreg sr(.clk(clk),.rst(rst),.en(isposedge),.din(din),.srout(srout));
    // segments_display8 sd(.clk(clk),.rst(rst),.output_num(srout),.seg_an(seg_an),.seg_data(seg_data));
    segments_displayg #(.WIDTH(8)) sd(.clk(clk),.rst(rst),.output_num(srout),.seg_an(seg_an),.seg_data(seg_data));
    Single_Segment ss(.num(seg_data),.led_sig(led_sig));
endmodule
