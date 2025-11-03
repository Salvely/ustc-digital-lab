`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/21 14:14:30
// Design Name: 
// Module Name: ALU3
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


module ALU3(
        input                   [2 : 0]        src0, src1,
        input                   [1 : 0]        sel,
        output reg                 [2 : 0]        res
    );
    
    // add
    wire [2:0] sum_res;
    wire adder_cout;
    adder3 adder(.a(src0),.b(src1),.cin(1'b0),.s(sum_res),.cout(adder_cout));

    // sub
    wire [2:0] sub_res;
    wire suber_cout;
    wire borrow;
    assign borrow = ~suber_cout;
    adder3 suber(.a(src0),.b(~src1),.cin(1'b1),.s(sub_res),.cout(suber_cout));

    // signed less than
    wire signed_less_than_res;
    /**
    同号：相减结果符号位为1，则小；
    异号：src0符号位为1，则小；
    */
    assign signed_less_than_res = (src0[2] == src1[2])? sub_res[2]: src0[2];

    // unsigned less than
    wire unsigned_less_than_res;
    /**
    相减有借位(borrow = 1），则小
    */
    assign unsigned_less_than_res = borrow;

    always @(*) begin
        case (sel)
            2'd0: res = sum_res;
            2'd1: res = sub_res;
            2'd2: res = {2'd0, signed_less_than_res};
            2'd3: res = {2'd0, unsigned_less_than_res}; 
        endcase
    end
endmodule
