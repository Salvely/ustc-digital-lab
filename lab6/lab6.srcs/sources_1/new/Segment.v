`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/20 13:56:31
// Design Name: 
// Module Name: Segment
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


module Segment(
    input                       clk,
    input                       rst, // 复位操作
    input       [31:0]          output_data, 
    input       [ 7:0]          output_valid, // 掩码

    output reg  [ 3:0]          seg_data,
    output reg  [ 2:0]          seg_an
);

parameter TIME_CNT = 25_0000;
reg [31:0] counter;

always @(posedge clk) begin
    // Update counter
    if(rst) counter <= 32'd0;
    else if (counter >= TIME_CNT) begin
        counter <= 32'd0;
    end
    else begin
        counter <= counter + 32'd1;
    end
end

reg [2:0] seg_id; // 标记点亮的数码管编号，0-7
always @(posedge clk) begin
    // Update seg_id
    if(rst) seg_id <= 3'd0;
    else begin
        if(counter == 32'd1) begin
            if(seg_id == 3'd7) seg_id <= 3'd0;
            else seg_id <= seg_id + 3'd1;
        end
    end
end

wire [31:0] output_data;
always @(*) begin
    seg_data = 0;
    if(output_valid[seg_id] == 1'b1)
        seg_an = seg_id; 
    else seg_an = 3'd0;
    
    // <- Same for all cases
    // Update seg_data according to seg_id. Hint: Use "case".
    case (seg_an)
        3'd0: seg_data = output_data[3:0]; 
        3'd1: seg_data = output_data[7:4];
        3'd2: seg_data = output_data[11:8];
        3'd3: seg_data = output_data[15:12];
        3'd4: seg_data = output_data[19:16];
        3'd5: seg_data = output_data[23:20];
        3'd6: seg_data = output_data[27:24];
        3'd7: seg_data = output_data[31:28]; 
    endcase
end
endmodule
