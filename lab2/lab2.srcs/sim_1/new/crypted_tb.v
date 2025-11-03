`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/18 14:48:35
// Design Name: 
// Module Name: crypted_tb
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


module crypted_tb(

    ); 
    parameter PERIOD = 10; // the clock period = 10ns
    // input signal
    reg                       clk;
    reg                       EP6A;
    reg [7:0]                 PALCA_AC;
    reg [7:0]                 __ACACQ;
    reg                       PLAOQC_A;
    
    // output signal
    wire [7:0]                EA__ACAC_ANV;

    // initialize the clk
    initial begin
        clk = 1'b1;
        forever begin
            #(PERIOD / 2) clk = ~clk;
        end
    end

    // test the EP6A signal and the EA__ACAC_ANV signal. Low for 10 clock cycle, then high for 10 clock cycle, repeat
    initial begin
        EP6A = 1'b0;
        forever begin    
            #(PERIOD) EP6A = ~EP6A;            
        end
    end

    // nothing change if just test about the EP6A, then we add PLAOQC_A test, low for 5 clock cycle, and then high for 5 clock cycle
    initial begin
        PLAOQC_A = 1'b0;
        forever begin    
            #(PERIOD * 2) PLAOQC_A = ~PLAOQC_A;
        end
    end
    
    // initial the PALCA_AC data, +1 every clock cycle
    initial begin
        PALCA_AC = 8'd0;
        forever begin
            #(PERIOD * 4) PALCA_AC = PALCA_AC + 8'd1;
        end    
    end

    // nothing change still, add the ACACQ signal to test
    initial begin
        __ACACQ = 8'd0;
        forever begin
            #(PERIOD * 8) __ACACQ = __ACACQ + 8'd1;
        end
    end

    Foo f(.clk(clk), .EP6A(EP6A), .PALCA_AC(PALCA_AC), .PLAOQC_A(PLAOQC_A),.__ACACQ(__ACACQ),
    .EA__ACAC_ANV(EA__ACAC_ANV));
endmodule
