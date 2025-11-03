`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/30 15:23:28
// Design Name: 
// Module Name: TrafficLight
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

// 绿灯35个周期，黄灯5个周期，红灯40个周期；

module TrafficLight (
    input                   clk,
    input                   rst,
    output reg                 is_red,
    output reg                 is_green,
    output reg                 is_yellow,
    output reg [7:0]          out
);
// Write your code here
// state transition implementation
parameter SG = 2'd0, SY = 2'd1, SR = 2'd2;
reg [1:0] state, next_state;
wire green_end, yellow_end, red_end;

// next state transition
always @(*) begin
    next_state = state;
    case (state)
        SG: begin
            next_state = (!green_end)? SG: SY;
        end
        SY: begin
            next_state = (!yellow_end)? SY: SR;
        end
        SR: begin
            next_state = (!red_end)? SR: SG;
        end
    endcase
end

// next state to state
always @(posedge clk) begin
    if(rst) begin
        state <= SG;
    end
    else begin
        state <= next_state;
    end
end

// output logic
always @(*) begin
    is_green = (state == SG);
    is_yellow = (state == SY);
    is_red = (state == SR);
end

wire [7:0] counterg, countery, counterr;
// 1个计数35下的counter，在is_green = 1时候计数，计数完成后为0，发出green_end结束信号（用作下一个单位的开始信号）
traffic_counter #(35) green_counter(.clk(clk),.rst(rst),.en(is_green),.is_end(green_end),.counter(counterg));
// 1个计数5下的counter，在is_yellow = 1时候计数，计数完成后为0，发出yellow_end结束信号（用作下一个单位的开始信号）
traffic_counter #(5) yellow_counter(.clk(clk),.rst(rst),.en(is_yellow),.is_end(yellow_end),.counter(countery));
// 1个计数40下的counter，在is_red = 1时候计数，计数完成后为0，发出red_end结束信号（用作下一个单位的开始信号）
traffic_counter #(40) red_counter(.clk(clk),.rst(rst),.en(is_red),.is_end(red_end),.counter(counterr));

always @(*) begin
    if(is_green) begin
        out [7:4] = counterg / 10;
        out [3:0] = counterg % 10;
    end
    else if(is_yellow) begin
        out [7:4] = countery / 10;
        out [3:0] = countery % 10;
    end
    else if(is_red) begin
        out [7:4] = counterr / 10;
        out [3:0] = counterr % 10;
    end
    else out = 8'd0;
end

// End of your code
endmodule
