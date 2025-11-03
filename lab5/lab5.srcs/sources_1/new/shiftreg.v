`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 11:37:20
// Design Name: 
// Module Name: shiftreg
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


module shiftreg(
        input clk,
        input rst,
        input en,
        input [3:0] din,
        output reg [31:0] srout,
        output reg [3:0] out
    );

    always @(posedge clk) begin
        if(rst) begin
            srout <= 32'd0;
            out <= 4'd0;
        end
        else begin
            if(en) begin
                out <= srout[31:28];
                srout <= {srout[27:0], din};
            end
        end
    end
endmodule
