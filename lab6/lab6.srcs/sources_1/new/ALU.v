`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/09 19:34:51
// Design Name: 
// Module Name: ALU
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


module ALU(
        input                   [31 : 0]        src0, src1,
        input                   [11 : 0]        sel,
        output wire                              signed_ovf,
        output wire                              unsigned_ovf,
        output reg                 [31 : 0]        res
    );

    // add
    wire [31:0] sum_res;
    wire cout_adder;
    Adder32 adder(.a(src0),.b(src1),.cin(1'b0),.s(sum_res),.cout(cout_adder));

    // sub
    wire [31:0] sub_res;
    wire cout_suber;
    Adder32 suber(.a(src0),.b(~src1),.cin(1'b1),.s(sub_res),.cout(cout_suber));
    wire borrow = ~cout_suber;

    // signed less than
    wire [31:0] signed_less_than_res;
    // assign signed_less_than_res = $signed(src0) < $signed(src1);
    assign signed_less_than_res = !(src0[31] ^ src1[31]) ? sub_res[31] : src0[31];
    
    // unsigned less than
    wire [31:0] unsigned_less_than_res;
    // assign unsigned_less_than_res = $unsigned(src0) < $unsigned(src1);
    assign unsigned_less_than_res = borrow;

    // and
    wire [31:0] and_res = src0 & src1;

    // or
    wire [31:0] or_res = src0 | src1;

    // nor
    wire [31:0] nor_res = ~(src0 | src1);

    // xor
    wire [31:0] xor_res = src0 ^ src1;

    // shift left logic
    wire [31:0] sll_res = src0 << src1[4:0];

    // shift right logic
    wire [31:0] srl_res = src0 >> src1[4:0];

    // shift right arithmetic
    wire [31:0] sra = src0 >>> src1[4:0];

    // src1
    wire [31:0] SRC1_res = src1;

    // signed overflow
    assign signed_ovf = ((sel == 32'd0) & !(src0[31] ^ src1[31]) & (src0[31] ^ sum_res[31])) | ((sel == 32'd1) & ((~src0[31] & src1[31] & sub_res[31]) | (src0[31] & ~src1[31] & ~sub_res[31])));

    // unsigned overflow
    assign unsigned_ovf = ((sel == 32'd0) & cout_adder) | ((sel == 32'd1) & borrow);

    always @(*) begin
        case(sel)
            12'd0: res = sum_res;
            12'd1: res = sub_res;
            12'd2: res = signed_less_than_res;
            12'd4: res = unsigned_less_than_res;
            12'd8: res = and_res;
            12'd16: res = or_res;
            12'd32: res = nor_res;
            12'd64: res = xor_res;
            12'd128: res = sll_res;
            12'd256: res = srl_res;
            12'd512: res = sra;
            12'd1024: res = SRC1_res;
            default: res = 32'd0;
        endcase
    end
endmodule
