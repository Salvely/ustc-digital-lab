`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/08 12:58:19
// Design Name: 
// Module Name: FIND11011_tb
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


module FIND11011_tb(

    );

    reg                               clk;            // 时钟信号
    
    reg                               rst;            // 复位信号，使状态机回到初始态
    reg               [99 : 0]        src;            // 输入数据
    reg                               src_valid;      // 表明输入结果是否有效

    wire                     res;            // 输出结果
    wire                     res_valid;       // 表明输出结果是否有效


    FIND11011 m(.clk(clk),.rst(rst),.src(src),.src_valid(src_valid),.res(res),.res_valid(res_valid));

    parameter PERIOD = 10;
    // init clk
    initial begin
       clk = 1;
       forever begin
            #(PERIOD / 2) clk = ~clk;
       end 
    end

    // init rst
    initial begin
        rst = 1;
        #(PERIOD) rst = 0;
    end

    // init src
    initial begin
        #(PERIOD)      src = {10'b1101111011,90'd0};
        #(PERIOD * 20) src = {8'b11011011,92'd0};
        #(PERIOD * 20) src = {9'b110111011,91'd0};
        #(PERIOD * 20) src = {10'b1100111011,10'd0};
        #(PERIOD * 20) src = {10'b1100011010,90'd0};
    end

    // init src_valid
    initial begin
        #(PERIOD);
        src_valid = 1'b1;
        forever begin
            #(PERIOD) src_valid = 1'b0;
            #(PERIOD * 15) src_valid = 1'b1;
        end
    end
endmodule
