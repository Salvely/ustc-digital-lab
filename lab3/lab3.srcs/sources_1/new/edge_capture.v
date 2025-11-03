`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/20 15:40:32
// Design Name: 
// Module Name: edge_capture
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


module edge_capture(
    input             clk,
    input             rst,

    input             sig_in,  // Signal input
    output            pos_edge,
    output            neg_edge
);

    reg first_reg;
    reg second_reg;
    reg third_reg;

// Your codes should start from here
always @(posedge clk) begin
    if(rst) begin
        first_reg <= 1'b0;
        second_reg <= 1'b0;
        third_reg <= 1'b0;
    end    
    else begin
        third_reg <= second_reg;
        second_reg <= first_reg;
        first_reg <= sig_in;
    end
end

assign pos_edge = (third_reg == 1'b0) && (second_reg == 1'b1);
assign neg_edge = (third_reg == 1'b1) && (second_reg == 1'b0);

// End of your codes
endmodule
