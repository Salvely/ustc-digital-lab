`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 19:51:43
// Design Name: 
// Module Name: MOD5
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


module MOD5(
        input                               clk,            // 时钟信号
        input                               rst,            // 复位信号，使状态机回到初始态
        input               [128:0]         src,            // 输入数据
        input                               src_valid,      // 表明输入结果是否有效
        output      wire                     res,            // 输出结果
        output      wire     [2:0]           mod,            // 输出余数(可选)
        output      wire                     res_valid       // 表明输出结果是否有效
    );

    
// Write your code here
    parameter IDLE = 2'd0, CALC = 2'd1, DONE = 2'd2;
    reg [1:0] state, next_state;

// next state logic
    always @(*) begin
        next_state = state;
        case (state)
            IDLE: next_state = (src_valid == 1'b0)? IDLE: CALC;
            CALC: next_state = (res_valid == 1'b0)? CALC: DONE;
            DONE: next_state = (src_valid == 1'b0)? DONE: CALC;
        endcase
    end

// generate next state
    always @(posedge clk) begin
        if(rst) state <= IDLE;
        else state <= next_state;
    end

// output logic
    assign ready = (state == IDLE) || (state == DONE);

    wire start = ready & src_valid;
    
    MOD5_calc calc(.clk(clk),.start(start),.src(src),.res(res),.res_valid(res_valid),.remain(mod));
// End of your code
endmodule
