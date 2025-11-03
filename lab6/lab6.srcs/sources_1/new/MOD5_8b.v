`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 20:04:45
// Design Name: 
// Module Name: MOD5_8b
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


module MOD5_8b(
        input               [7 : 0]        src,            // 输入数据
        output      reg                     res,            // 输出结果
        output      reg        [3 : 0]     remain           // 余数
    );
    
    reg signed [3:0] group1_remain;
    reg signed [3:0] group2_remain;

    always @(*) begin
        group1_remain = src[0] + 2 * src[1] - 1 * src[2] - 2 * src[3];
        group2_remain = src[4] + 2 * src[5] - 1 * src[6] - 2 * src[7];
        remain = group1_remain + group2_remain;
        if(remain < 0) remain = remain + 4'd5;
        res = (remain == 0);       
    end
endmodule
