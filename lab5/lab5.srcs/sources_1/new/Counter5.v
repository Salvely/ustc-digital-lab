`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/29 10:23:56
// Design Name: 
// Module Name: Counter5
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


module Counter5(
        input clk,
        input rst,
        output reg [19:0] display_num
    );
    
    // initialize display_num value and incre_x value
    reg incre_d;

    /** 
    小时2-分钟1-分钟2-秒钟1-秒钟2的关系应该是:
    1. 秒钟2在计数器计数1s后+1，最高到9
    2. 秒钟1在第一位到9后+1，最高到5
    3. 分钟2在秒钟2到9且秒钟1到5后产生进位，最高到9
    4. 分钟1在 秒钟2到9 秒钟1到5 分钟2到9 后产生进位，最高到5
    4. 小时2在 秒钟2到9 秒钟1到5 分钟2到9 分钟1到5 后产生进位，最高到F
    */
    
    // implement the 0.1s counter
    localparam MAX_TIME = 100_000_000;
    reg [31:0] counter;
    
    always @(posedge clk) begin    
        if(rst) begin
            // init those signal by rst
            display_num <= 20'h95830;
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

            if(!rst & (display_num[15:12] == 4'd5) & (display_num[11:8] == 4'd9) & (display_num[3:0] == 4'd9) & (display_num[7:4] == 4'd5) & incre_d) begin
                if(display_num[19:16] == 4'hf) begin
                    display_num <= 20'd0;
                    incre_d <= 1'b0;
                    counter <= 32'd0;                    
                end
                else begin
                    display_num[19:16] <= display_num[19:16] + 4'd1;
                    display_num[15:0] <= 16'd0;
                end
            end
            else if(!rst & (display_num[11:8] == 4'd9) & (display_num[3:0] == 4'd9) & (display_num[7:4] == 4'd5) & incre_d) begin
                display_num[15:12] <= display_num[15:12] + 4'd1;
                display_num[11:0] <= 12'd0;
            end
            else if(!rst & incre_d & (display_num[3:0] == 4'd9) & (display_num[7:4] == 4'd5)) begin
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
