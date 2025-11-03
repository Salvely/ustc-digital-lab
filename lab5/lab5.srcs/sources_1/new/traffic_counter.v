`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/30 15:59:29
// Design Name: 
// Module Name: traffic_counter
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


module traffic_counter #(parameter MAX_TIME = 40) (
        input                   clk,
        input                   rst,
        input                   en,
        output wire              is_end,
        output reg [7:0]             counter
    );
    
    wire incre;
    localparam INCRE_TIME = 100_000_000;
    reg [31:0] count;
    // the incre signal
    always @(posedge clk) begin
        if(rst) count <= 32'd1;
        else if(en) begin
            if(count == INCRE_TIME) count <= 32'd1;
            else count <= count + 32'd1;
        end
    end
    assign incre = (count == 32'd1);

    // reg [7:0] counter;
    always @(posedge clk) begin
        if(rst) begin
            counter <= 8'd0;
        end
        else if(en & incre) begin
            if(counter == MAX_TIME) begin
                counter <= 8'd0;
            end
            else begin
                counter <= counter + 8'd1;
            end
        end
        else if(!en) counter <= 8'd0;
    end

    assign is_end = (counter == MAX_TIME);
endmodule
