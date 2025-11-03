`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 19:55:07
// Design Name: 
// Module Name: MOD5_calc
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
// //////////////////////////////////////////////////////////////////////////////////


module MOD5_calc(
        input clk,            // 时钟信号
        input start,
        input               [127 : 0]        src,            // 输入数据
        output      reg                     res,            // 输出结果
        output      reg                     res_valid,       // 表明输出结果是否有效
        output      reg     [2:0]                remain     // 余数  
    );
    
    reg [127:0] shift_reg;
    wire [7:0] current_src = shift_reg[7:0];
    
    wire current_res;
    reg temp_res;

    wire [3:0] current_remain;
    reg [3:0] temp_remain;

    MOD5_8b calc(.src(current_src), .res(current_res), .remain(current_remain));

    integer i;
    // next state to state
    always @(posedge clk) begin
        if(start) begin
            i <= 0;
            temp_res <= 1'b1;
            temp_remain <= 4'd0;
            res <= 1'b0;
            res_valid <= 1'b0;
            remain <= 3'd0;
            shift_reg <= src;
        end
        else begin
            if(i == 15) begin
                remain <= (temp_remain + current_remain) % 5;
                res <= temp_res & current_res;
                res_valid <= 1'b1;
                i <= 0;
            end
            else begin
                i <= i + 1;
                temp_remain <= (temp_remain + current_remain) % 5;
                temp_res <= temp_res & current_res;
            end
        end
    end
endmodule

// module MOD5_calc(
//     input clk,
//     input start,
//     input [127:0] src,
//     output reg res,
//     output reg res_valid,
//     output reg [2:0] remain
// );

//     reg [3:0] counter;
//     reg [127:0] shift_reg;
//     reg [2:0] acc_remain;
//     reg acc_res;
    
//     wire [7:0] current_byte = shift_reg[7:0];
//     wire byte_res;
//     wire [2:0] byte_remain;
    
//     MOD5_8b mod8(.src(current_byte), .res(byte_res), .remain(byte_remain));
    
//     always @(posedge clk) begin
//         if (start) begin
//             // 开始计算
//             counter <= 4'd0;
//             shift_reg <= src;
//             acc_remain <= 3'd0;
//             acc_res <= 1'b1;
//             res_valid <= 1'b0;
//             res <= 1'b0;
//             remain <= 3'd0;
//         end else if (counter < 15) begin
//             // 处理前15个字节
//             acc_remain <= (acc_remain + byte_remain) % 5;
//             acc_res <= acc_res & byte_res;
//             shift_reg <= shift_reg >> 8;
//             counter <= counter + 1;
//         end else if (counter == 15) begin
//             // 处理第16个字节并输出结果
//             res <= acc_res & byte_res;
//             remain <= (acc_remain + byte_remain) % 5;
//             res_valid <= 1'b1;
//             counter <= 4'd0;
//         end
//     end
// endmodule