`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/28 12:01:23
// Design Name: 
// Module Name: Counter
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


module Counter(
        input clk,
        input rst,
        output reg [15:0] display_num
    );

    // initialize display_num value and incre_x value
    reg incre_d;

    /** 
    等一等，这里的进位判断出现了问题：不是第二个/第三个数字到9，第三个/第四个数字就到9的
    第一个数字到9后产生进位信号，第二个数字+1
    分钟-秒钟-小数的关系应该是:
    1. 小数位在计数器计数0.1s后+1，最高到9
    2. 秒位在第一位到9后+1，最高到9
    3. 秒（十位）在第1位到9且秒位到9后产生进位，最高到5
    4. 分在前三位为59.9的时候产生进位，最高到9
    */
    
    // implement the 0.1s counter
    localparam MAX_TIME = 10_0_000_000;
    // localparam MAX_TIME = 32'd3;
    reg [31:0] counter;
    
    always @(posedge clk) begin    
        if(rst) begin
            // init those signal by rst
            display_num <= 16'h0;
            incre_d <= 1'b0;
            counter <= 32'd0;
        end
        else begin
            if(counter == MAX_TIME) begin
                counter <= 32'd1;
                incre_d <= 1'b1;
            end
            else begin
                counter <= counter + 32'd1;
                incre_d <= 1'b0;
            end

            // display minute
            if(!rst & (display_num[11:8] == 4'd5) & (display_num[3:0] == 4'd9) & (display_num[7:4] == 4'd9) & incre_d) begin
                if(display_num[15:12] == 4'd9) begin
                    display_num <= 16'd0;
                    incre_d <= 1'b0;
                    counter <= 32'd0;
                end
                else begin
                    display_num[15:12] <= display_num[15:12] + 4'd1;
                    display_num[11:0] <= 12'd0;
                end            
            end
            else if(!rst & incre_d & (display_num[3:0] == 4'd9) & (display_num[7:4] == 4'd9)) begin
                // display second(10)
                // incre_d & (display_num[3:0] == 4'd9) & (display_num[7:4] == 4'd9) & (display_num[11:8] != 4'd5)
                display_num[11:8] <= display_num[11:8] + 4'd1;
                display_num[7:0] <= 8'd0;                               
            end
            else if(!rst & incre_d & (display_num[3:0] == 4'd9)) begin
                // display second
                // incre_d & display[3:0] = 4'd9 & display[7:4] != 4'd9
                display_num[7:4] <= display_num[7:4] + 4'd1;
                display_num[3:0] <= 4'd0;                                
            end
            else if(!rst & incre_d) begin
                // display 0.1s digit
                // incre_d and display_num[3:0] != 4'd9
                display_num[3:0] <= display_num[3:0] + 4'd1;  
            end
        end
    end
endmodule
