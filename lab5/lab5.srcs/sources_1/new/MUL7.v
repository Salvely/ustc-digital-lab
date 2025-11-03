`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/06 10:32:59
// Design Name: 
// Module Name: MUL7
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


/**
1. 32 位的 7 的倍数检测器；
2. 每次复位后，将输出有效位设置为 0，ready 位置为 1 ，等待输入有效位为 1 时接收输入并计算；
3. 计算过程中 ready 位保持 0 显示正在检测，此时输入会被忽略；
4. 计算出结果后输出并将输出有效位设置为 1， ready 位设为 1 并不再变化，直到下一次输入有效值变为 1 后进行下一次检测。
*/

module MUL7(
    input                               clk,            // 时钟信号
    
    input                               rst,            // 复位信号，使状态机回到初始态
    input               [31 : 0]        src,            // 输入数据
    input                               src_valid,      // 表明输入结果是否有效

    output      wire                     ready,          // 表明是否正在检测
    output      wire                     res,            // 输出结果
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
    MUL7_calc calc(.clk(clk),.start(start),.src(src),.res(res),.res_valid(res_valid));
// End of your code
endmodule
