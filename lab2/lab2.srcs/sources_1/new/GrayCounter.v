`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/18 17:05:48
// Design Name: 
// Module Name: GrayCounter
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


module GrayCounter(
input                               clk,
input                               rst,
output                              out        
); 
    reg [3:0] counter;
    reg [3:0] grey;
    reg [3:0] next_grey;
    
    // firt bit 0101 循环
    reg [1:0] first_state;
    reg [1:0] first_next_state;
    always @(*) begin
        // next bit logic
        // next state logic
        case (first_state)
            2'd0: begin
                next_grey[0] = 1'b1;
                first_next_state = 2'd1;
            end
            2'd1: begin
                next_grey[0] = 1'b1;
                first_next_state = 2'd2;
            end
            2'd2: begin
                next_grey[0] = 1'b0;
                first_next_state = 2'd3;
            end
            2'd3: begin
                next_grey[0] = 1'b0;
                first_next_state = 2'd0;
            end
        endcase
    end

    // second bit：0011 1100 循环
    reg [2:0] second_state;
    reg [2:0] second_next_state;
    always @(*) begin
        // next bit logic
        // next state logic
        case (second_state)
            3'd0: begin
                next_grey[1] = 0;
                second_next_state = 3'd1;
            end
            3'd1: begin
                next_grey[1] = 1;
                second_next_state = 3'd2;
            end
            3'd2: begin
                next_grey[1] = 1;
                second_next_state = 3'd3;
            end
            3'd3: begin
                next_grey[1] = 1;
                second_next_state = 3'd4;
            end
            3'd4: begin
                next_grey[1] = 1;
                second_next_state = 3'd5;
            end
            3'd5: begin
                next_grey[1] = 0;
                second_next_state = 3'd6;
            end
            3'd6: begin
                next_grey[1] = 0;
                second_next_state = 3'd7;
            end
            3'd7: begin
                next_grey[1] = 0;
                second_next_state = 3'd0;
            end
        endcase
    end

    // third bit：0000 1111 1111 0000 循环
    reg [3:0] third_state;
    reg [3:0] third_next_state;
    always @(*) begin
        // next bit logic
        // next state logic 
        if(third_state == 4'd3 | third_state == 4'd11) next_grey[2] = ~next_grey[2];
        else next_grey[2] = grey[2];

        if(third_state == 4'd15) third_next_state = 4'd0;
        else third_next_state = third_state + 4'd1;
    end

    // fourth bit：0000 0000 1111 1111 循环
    reg [3:0] fourth_state;
    reg [3:0] fourth_next_state;
    always @(*) begin
        // next bit logic
        // next state logic
        if(third_state == 4'd7 | third_state == 4'd15) begin
            next_grey[3] = ~next_grey[3];
        end
        else next_grey[3] = grey[3];

        if(third_state == 4'd15) begin
            fourth_next_state = 4'd0;
        end
        else fourth_next_state = fourth_state + 4'd1;
    end

    // your code here
    always @(posedge clk) begin
        if(rst) begin
            grey <= 4'd0;
            counter <= 4'd0;
            // init each first state
            first_state <= 2'd0;
            second_state <= 3'd0;
            third_state <= 3'd0;
            fourth_state <= 4'd0;
        end
        else begin
            grey <= next_grey;
            // init each next state
            first_state <= first_next_state;
            second_state <= second_next_state;
            third_state <= third_next_state;
            fourth_state <= fourth_next_state;
            if(counter == 4'd15) counter <= 4'd0;
            else counter <= counter + 4'd1;
        end
    end

    // output logic
    assign out = (grey == 4'd8);
endmodule
