`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/30 14:57:29
// Design Name: 
// Module Name: segments_displayg
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

// g means general
module segments_displayg #(parameter WIDTH = 3'd4) (
        input clk,
        input rst,
        input [WIDTH * 4 - 1:0] output_num,
        output wire [2:0] seg_an,
        output reg [3:0] seg_data
    );

    
    // 1个数码管点亮2x10^6个时钟周期
    localparam MAX_TIME = 2_000_000;
    reg [31:0] TIME;
    reg light;
    always @(posedge clk) begin
        if(rst | TIME == 32'd1) begin
            light <= 1'd1;
        end
        else light <= 1'd0;

        if(rst | TIME == MAX_TIME) begin
            TIME <= 32'd1;
        end
        else begin
            TIME <= TIME + 32'd1;
        end
    end

    // 每次刷新的时候，更新 seg_id
    reg [2:0] seg_id;
    always @(posedge clk) begin
        if(rst) seg_id <= 3'd0;
        else begin
            if(light) begin
                if(seg_id == WIDTH - 1) seg_id <= 3'd0;
                else seg_id <= seg_id + 1;
            end            
        end
    end

    // 根据seg_id，从WIDTH个4位数码管（4 * WIDTH 位数字）中选择1个进行输出，其他的为0；
    assign seg_an = seg_id;
    wire[31:0] start = seg_an * 4;
    always @(*) begin
        seg_data = 0;
        seg_data = output_num[start+:4];
    end
endmodule
