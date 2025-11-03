`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 16:02:12
// Design Name: 
// Module Name: ALU5
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


module ALU5(
        input [4:0] src0, src1, sel,
        output reg [4:0] res
    );

    // add
    wire [4:0] sum_res;
    wire cout_adder;
    Adder5 adder(.a(src0),.b(src1),.cin(1'b0),.s(sum_res),.cout(cout_adder));

    // sub
    wire [4:0] sub_res;
    wire cout_suber;
    Adder5 suber(.a(src0),.b(~src1),.cin(1'b1),.s(sub_res),.cout(cout_suber));
    wire borrow = ~cout_suber;

    // signed less than
    wire [4:0] signed_less_than_res;
    // assign signed_less_than_res = $signed(src0) < $signed(src1);
    assign signed_less_than_res = !(src0[4] ^ src1[4]) ? sub_res[4] : src0[4];
    
    // unsigned less than
    wire [4:0] unsigned_less_than_res;
    // assign unsigned_less_than_res = $unsigned(src0) < $unsigned(src1);
    assign unsigned_less_than_res = borrow;

    // and
    wire [4:0] and_res = src0 & src1;

    // or
    wire [4:0] or_res = src0 | src1;

    // nor
    wire [4:0] nor_res = ~(src0 | src1);

    // xor
    wire [4:0] xor_res = src0 ^ src1;

    // shift left logic
    wire [4:0] sll_res = src0 << src1[4:0];

    // shift right logic
    wire [4:0] srl_res = src0 >> src1[4:0];

    // shift right arithmetic
    wire [4:0] sra = src0 >>> src1[4:0];

    // src1
    wire [4:0] SRC1_res = src1;

    always @(*) begin
        case(sel)
            5'd1: res = sum_res;
            5'd2: res = sub_res;
            5'd3: res = signed_less_than_res;
            5'd4: res = unsigned_less_than_res;
            5'd5: res = and_res;
            5'd6: res = or_res;
            5'd7: res = nor_res;
            5'd8: res = xor_res;
            5'd9: res = sll_res;
            5'd10: res = srl_res;
            5'd11: res = sra;
            5'd12: res = SRC1_res;
            default: res = 5'd0;
        endcase
    end
endmodule
