`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 15:12:47
// Design Name: 
// Module Name: ALU5_top
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


module ALU5_top(
    input                   [ 0 : 0]        clk,
    input                   [ 7 : 0]        sw,
    input                                   btn,
    output                  [ 3 : 0]        seg_data,
    output                  [ 2 : 0]        seg_an
    );

    /**
    本题是上一题的升级版，上一题中，限于开关的数目，我们的 ALU 只能可视化三位运算；本题通过用两位开关选择不同的输入模式，实现分时复用，从而可视化了五位运算。此外，前一题是组合逻辑电路，所有开关的输入都会即时地影响运算的结果；而这里则是一个时序逻辑，我们会在不同次输入中分别改变并存储 src0、src1 以及 sel，通过多个周期完成输入与运算结果的输出。

    比如：ctrl 设为 2'b00，in[4:0] 设为 5'b01001，按下 enable，选择了逻辑左移运算；ctrl 设为 2'b01，in[4:0] 设为 5'b01011，按下 enable，此时 src0 的值变为 5'b01011；ctrl 设为 2'b10，in[4:0] 设为 5'b00011，按下 enable，此时 src1 的值变为 5'b00011；ctrl 设为 2'b11，按下 enable，此时输出结果 5'b11000，并通过 seg_an 与 seg_data 在七段数码管上以十六进制的形式显示出来。

    本题要求仿真和上板测试，代码框架与部分仿真信号输入及对应部分的限制文件如下：
    */


    wire                   [ 0 : 0]        rst = sw[7];
    wire                   [ 0 : 0]        enable = btn;
    wire                   [ 4 : 0]        in = sw[4:0];
    wire                   [ 1 : 0]        ctrl = sw[6:5];

    reg                   [ 7 : 0]        output_valid;
    
    reg                    [4:0]           src0, src1;
    wire                    [4:0]           res;
    reg                      [4:0]           sel;

    Segment seg(
            .clk(clk),
            .rst(rst),
            .output_data({27'd0, res}),
            .output_valid(output_valid),
            .seg_data(seg_data),
            .seg_an(seg_an)
    );
    ALU5 alu(
            .src0(src0),
            .src1(src1),
            .sel(sel),
            .res(res)
    );

    always @(*) begin
        output_valid = 8'd0;
        if(enable) begin
            case (ctrl)
                2'd0: sel = in; // 表示选择 ID = in[4:0] 的 ALU 运算，in[4:0] 不在 1~12 范围内的视为零运算，即无论操作数 src0 和 src1 的值，输出结果都为 0。
                2'd1: src0 = in; // 表示将 src0 的值改为 in[4:0];
                2'd2: src1 = in; // 表示将 src1 的值改为 in[4:0];
                2'd3: output_valid = 8'hff; // 表示输出结果，通过 seg_an 与 seg_data 以七段数码管的形式显示出来。（注意：数码管的输出数据 output_data 只在此时更新）;
            endcase            
        end
    end
endmodule
