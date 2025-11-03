`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 15:23:03
// Design Name: 
// Module Name: edgedetect
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


module edgedetect(
        input clk,
        input rst,
        input in,
        output isposedge,
        output isnegedge
    );

    reg firstreg;
    reg secondreg;
    reg thirdreg;

    always @(posedge clk) begin
        if(rst) begin
            thirdreg <= 1'b0;
            secondreg <= 1'b0;
            firstreg <= 1'b0;
        end
        else begin
            thirdreg <= secondreg;
            secondreg <= firstreg;
            firstreg <= in;
        end
    end
    
    assign isposedge = (thirdreg == 1'b0) & (secondreg == 1'b1);
    assign isnegedge = (thirdreg == 1'b1) & (secondreg == 1'b0); 
endmodule
