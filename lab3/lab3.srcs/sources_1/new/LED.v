`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/18 21:49:52
// Design Name: 
// Module Name: LED
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


module LED (
    input                   clk,
    input                   btn,
    input [7:0]             sw,
    output reg [7:0]        led
);

reg [31:0] count_1hz;
wire rst;
reg [31:0] TIME_CNT;

assign rst = btn;   // Use button for RESET

always @(*) begin
    case(sw[1:0])
        2'd0: begin
            // 0.5 Hz, T = 2s
            TIME_CNT = 2_0000_0000;
        end
        2'd1: begin
            // 1 Hz, T = 1s
            TIME_CNT = 1_0000_0000;
        end
        2'd2: begin
            // 2 Hz, T = 0.5s
            TIME_CNT = 5_000_0000;
        end
        2'd3: begin
            // 4 Hz, T = 0.25s
            TIME_CNT = 25_000_000;
        end
    endcase
end

always @(posedge clk) begin
    if (rst)
        count_1hz <= 0;
    else if (count_1hz >= TIME_CNT)
        count_1hz <= 0;
    else
        count_1hz <= count_1hz + 1;
end

always @(posedge clk) begin
    if (rst)
        led <= 8'd1;
    else if (count_1hz == 1) begin
        if(sw[7] == 1'b0) begin
            led <= {led[6:0],led[7]};
        end
        else begin
            led <= {led[0],led[7:1]};
        end
    end
end
endmodule
