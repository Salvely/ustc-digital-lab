`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/09 20:28:27
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb(
        
    );
    reg                   [31 : 0]        src0, src1;
    reg                   [11 : 0]        sel;
    wire                 [31 : 0]        res;
    wire signed_ovf;
    wire unsigned_ovf;

    ALU calc(.src0(src0),.src1(src1),.sel(sel),.res(res),.signed_ovf(signed_ovf),.unsigned_ovf(unsigned_ovf));

    initial begin
        src0 = 32'h7abc_d251;
        src1 = 32'hffff_ffff;
        sel = 0;
        #10 sel = 1;
        repeat(11) begin
            #10 sel = sel << 1;
        end

        src0 = 32'hffff_ffff;
        src1 = 32'h1;
        sel = 0;
        #10 sel = 1;
        repeat(11) begin
            #10 sel = sel << 1;
        end

        src0 = 32'h1;
        src1 = 32'h0;
        sel = 0;
        #10 sel = 1;
        repeat(11) begin
            #10 sel = sel << 1;
        end

        src0 = 32'hffff_fffe;
        src1 = 32'hffff_ffff;
        sel = 0;
        #10 sel = 1;
        repeat(11) begin
            #10 sel = sel << 1;
        end

        src0 = 32'h2;
        src1 = 32'hffff_ffff;
        sel = 0;
        #10 sel = 1;
        repeat(11) begin
            #10 sel = sel << 1;
        end
        
        src0 = 32'h7fff_ffff;
        src1 = 32'h7fff_ffff;
        sel = 0;
        #10 sel = 1;
        repeat(11) begin
            #10 sel = sel << 1;
        end
        
        src0 = 32'h8000_0000;
        src1 = 32'h1;
        sel = 0;
        #10 sel = 1;
        repeat(11) begin
            #10 sel = sel << 1;
        end
    end
endmodule
