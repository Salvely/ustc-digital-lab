`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/09 19:22:41
// Design Name: 
// Module Name: Adder32_tb
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


module Adder32_tb(

    );
    reg [31:0] a;
    reg [31:0] b;
    reg cin;
    wire [31:0] s;
    wire cout;
    
    Adder32 adder(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));

    wire [31:0] expected_sum;
    wire expected_cout;
    assign {expected_cout,expected_sum} = a + b + cin;

    initial begin
        $display("Test for Adder32:");
        a = 32'b0100_1101_1110_0101_0101_1110_0101_0101;
        b = 32'b1111_0000_1100_1110_1100_1100_1110_1100;
        cin = 1'b1;
        #10;
        $display("the sum of %d + %d + %d = %d, carry: %d",a,b,cin,s,cout);
        $display("the expected sum: %d, carry: %d",expected_sum,expected_cout);
        $display("Finish Test for Adder32");

        // $display("Test for Adder12_layer:");
        // #10;
        // $display("the sum of %d + %d + %d = %d, carry: %d",a,b,cin,s_layer,cout_layer);
        // $display("the expected sum: %d, carry: %d",expected_sum,expected_cout);
        // $display("Finish Test for Adder12_layer:");        
        
        $finish;
    end      
endmodule
