`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 09:03:04
// Design Name: 
// Module Name: TIMER_example
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


module TIMER_example(
        input clk, btn,
        output [3:0] seg_data,
        output [2:0] seg_an
    );
    
    wire rst;
    assign rst = btn;
    
    reg [3:0] outm;
    reg [3:0] outss;
    reg [3:0] outsg;
    reg [3:0] outst;
    reg [39:0] count;

    // init those signals (I wonder why, because initial begin usually happens in simulation files)
    initial begin
        outm = 4'h0;
        outss = 4'h0;
        outsg = 4'h0;
        outst = 4'h0;
        count = 40'h0;
    end

    always @(posedge clk) begin
        if(rst) count <= 40'h1;
        else begin
            if(count == 40'D6000_000_000) count <= 40'h1;
            else count <= count + 40'h1;
        end
    end

    Segment segment(
        .clk                (clk),
        .rst                (rst),
        .output_data        ({outm, outss, outsg, outst}),
        .output_valid       (8'HFF),     // 如果你没有实现，可以不需要这个端口
        .seg_data           (seg_data),
        .seg_an             (seg_an)
    );

    always @(posedge clk) begin
        if(rst) begin
            outm <= 4'h0;
            outss <= 4'h0;
            outsg <= 4'h0;
            outst <= 4'h0;
        end
        else begin
            outm    <=  (count % 40'D6000_000_000 != 0)   ?   outm        :
                        (outm != 4'H5)                  ?   outm + 1    :
                                                            4'H0        ;  
            outss   <=  (count % 40'D1000_000_000 != 0)   ?   outss       :
                        (outss != 4'H5)                 ?   outss + 1   :
                                                            4'H0        ; 
            outsg   <=  (count % 40'D100_000_000 != 0)    ?   outsg       :
                        (outsg != 4'H9)                 ?   outsg + 1   :
                                                            4'H0        ; 
            outst   <=  (count % 40'D10_000_000 != 0)     ?   outst       :
                        (outst != 4'H9)                 ?   outst + 1   :
                                                            4'H0        ;
        end
    end
endmodule
