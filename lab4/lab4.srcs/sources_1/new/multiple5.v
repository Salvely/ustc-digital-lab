`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/27 12:06:35
// Design Name: 
// Module Name: multiple5
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


module multiple5(
    input           [7:0]          num,
    output   wire                   ismultiple5
);

// Write your code here
// Use the 2-bits adder, or you will not get the score!
    wire [1:0] result1;
    wire [1:0] result2;
    wire [1:0] result3;
    wire [1:0] result4;
    adder2bit adder0(.a(num[1] * 2), .b({1'b0, num[0]}), .out(result1));
    adder2bit adder1(.a(num[3] * 2), .b({1'b0, num[2]}), .out(result2));
    adder2bit adder2(.a(num[5] * 2), .b({1'b0, num[4]}), .out(result3));
    adder2bit adder3(.a(num[7] * 2), .b({1'b0, num[6]}), .out(result4));
    
    wire signed [7:0] result = result1 - result2 + result3 - result4;
    reg signed [7:0] mod5_result;

    always @(*) begin
        if(result < 0) mod5_result = result + 8'd5;
        else if(result > 8'd5) mod5_result = result - 8'd5;
        else mod5_result = result;
    end
    
    assign ismultiple5 = (mod5_result % 5 == 0);
// End of your code
endmodule
