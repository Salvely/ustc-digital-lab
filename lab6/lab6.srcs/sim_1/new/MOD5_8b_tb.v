`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 20:40:48
// Design Name: 
// Module Name: MOD5_8b_tb
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


module MOD5_8b_tb(

    );
    
    reg               [7 : 0]        src;            // 输入数据
    wire                     res;            // 输出结果
    wire        [3 : 0]     remain;           // 余数
    
    MOD5_8b calc(.src(src),.res(res),.remain(remain));

    initial begin
        src = 8'd0;
        forever begin
            #2 src = src + 8'd1;
        end
    end
endmodule
