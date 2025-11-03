`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/18 12:09:16
// Design Name: 
// Module Name: MAX2_tb
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


module MAX2_tb();
parameter TEST_NUM = 5;
reg clk;
reg [7:0] num1, num2, correct;
wire [7:0] out;

MAX2 max2 (
    .num1(num1),
    .num2(num2),
    .max(out)
);

initial begin
    clk = 0;
    forever begin
        #10;
        clk = ~clk;
    end
end

integer index, fid;
initial begin
    index = 0;
    fid = $fopen("test_data.txt", "r");
    $display("[Testbench]: ========== Ready to start the test. ==========");
    repeat(TEST_NUM) begin
        @(posedge clk);
        $fscanf(fid, "%d, %d, %d", num1, num2, correct);
        index = index + 1;
    end
    #50;
    $fclose(fid);
    $display("[Testbench]: ========== Done. ==========");
    $finish;
end

always @(posedge clk) begin
    #1;
    if (out != correct) begin
        $display("[Module MAX2]: Time %0t: Found ERROR at testcase No.%0d", $time, index);
    end
end
endmodule
