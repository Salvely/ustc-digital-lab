`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/06 10:33:24
// Design Name: 
// Module Name: MUL7_tb
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


module MUL7_tb(

    );

    reg                               clk;            // 时钟信号
    
    reg                               rst;            // 复位信号，使状态机回到初始态
    reg               [31 : 0]        src;            // 输入数据
    reg                               src_valid;      // 表明输入结果是否有效

    wire                     ready;          // 表明是否正在检测
    wire                     res;            // 输出结果
    wire                     res_valid;       // 表明输出结果是否有效


    MUL7 m(.clk(clk),.rst(rst),.src(src),.src_valid(src_valid),.ready(ready),.res(res),.res_valid(res_valid));

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
        src = 32'd0;
        #(PERIOD);
        forever begin
            #(PERIOD * 40) src = src + 4;
        end
    end

    // init src_valid
    initial begin
        #(PERIOD);
        src_valid = 1'b1;
        forever begin
            #(PERIOD) src_valid = 1'b0;
            #(PERIOD * 39) src_valid = 1'b1;
        end
    end
endmodule
