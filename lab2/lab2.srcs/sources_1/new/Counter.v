`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/18 11:07:07
// Design Name: 
// Module Name: Counter
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


module Counter #(
    parameter   MAX_VALUE = 8'd100,
    parameter   MIN_VALUE = 8'd10
)(
    input                   clk,
    input                   rst,
    input                   enable,
    output                  out
);

reg [7:0] counter;
always @(posedge clk) begin
    if (rst)
        counter <= 8'd0;
    else begin
        if(~enable) counter <= 8'd0;
        else begin
            if (counter < MIN_VALUE) counter <= MIN_VALUE;
            else begin
                if (counter >= MAX_VALUE)
                    counter <= MIN_VALUE;
                else
                    counter <= counter + 8'b1;                          
            end
        end
    end
end

assign out = (counter == MAX_VALUE);
endmodule
