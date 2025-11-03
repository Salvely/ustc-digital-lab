`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/08 20:02:29
// Design Name: 
// Module Name: Adder12_tb
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


module Adder12_tb(

    );
    reg                   [ 11 : 0]        a, b;
    reg                                   cin;
    wire                  [ 11 : 0]        s;
    wire                                  cout;

    wire [11:0] expected_sum;
    wire expected_cout;
    assign {expected_cout,expected_sum} = a + b + cin;

    Adder12_seq adder(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));

    // wire [11:0] s_layer;
    // wire cout_layer;
    // Adder12_layer adder2(.a(a),.b(b),.cin(cin),.s(s_layer),.cout(cout_layer));

    initial begin
        $display("Test for Adder12_seq:");
        a = 12'b1110_0101_0101;
        b = 12'b1100_1110_1100;
        cin = 1'b1;
        #10;
        $display("the sum of %d + %d + %d = %d, carry: %d",a,b,cin,s,cout);
        $display("the expected sum: %d, carry: %d",expected_sum,expected_cout);
        $display("Finish Test for Adder12_seq:");

        // $display("Test for Adder12_layer:");
        // #10;
        // $display("the sum of %d + %d + %d = %d, carry: %d",a,b,cin,s_layer,cout_layer);
        // $display("the expected sum: %d, carry: %d",expected_sum,expected_cout);
        // $display("Finish Test for Adder12_layer:");        
        
        $finish;
    end       
endmodule
