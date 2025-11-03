// `timescale 1ns / 1ps
// //////////////////////////////////////////////////////////////////////////////////
// // Company: 
// // Engineer: 
// // 
// // Create Date: 2025/10/08 17:43:47
// // Design Name: 
// // Module Name: Adder4b_tb
// // Project Name: 
// // Target Devices: 
// // Tool Versions: 
// // Description: 
// // 
// // Dependencies: 
// // 
// // Revision:
// // Revision 0.01 - File Created
// // Additional Comments:
// // 
// //////////////////////////////////////////////////////////////////////////////////


module Adder4b_tb(
        
    );
    reg                   [ 3 : 0]        a, b;
    reg                                   cin;
    wire                  [ 3 : 0]        s;
    wire                                  cout;

    // Adder_4b adder(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
    Adder_LookAhead4 adder(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));

    integer i,j;

    initial begin
        cin = 0;
        for(i = 4'd0; i <= 4'd15; i = i + 4'd1) begin
            a = i;
            for(j = 4'd0; j <= 4'd15; j = j + 4'd1) begin
                #1;
                b = j;
                $display("Time: %0t, a = %0d, b = %0d, s = %0d, cout = %0d", 
                         $time, a, b, s, cout);
            end
            #1;
            $display("--- Finished a = %0d ---", a);
        end

        cin = 1;
        for(i = 4'd0; i <= 4'd15; i = i + 4'd1) begin
            a = i;
            for(j = 4'd0; j <= 4'd15; j = j + 4'd1) begin
                #1;
                b = j;
                $display("Time: %0t, a = %0d, b = %0d, s = %0d, cout = %0d", 
                         $time, a, b, s, cout);
            end
            #1;
            $display("--- Finished a = %0d ---", a);
        end
        $display("Simulation finished at time %0t", $time);
        $finish;
    end      
endmodule

// module Adder4b_tb(
        
//     );
//     reg                   [ 3 : 0]        a, b;
//     reg                                   cin;
//     wire                  [ 3 : 0]        s;
//     wire                                  cout;
//     integer i, j;  // 使用局部变量作为循环索引

//     Adder_4b adder(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));

//     initial begin
//         cin = 0;
//         // 使用局部变量i作为循环索引，然后赋值给a
//         for(i = 0; i <= 15; i = i + 1) begin
//             a = i;  // 将循环变量的值赋给a
//             for(j = 0; j <= 15; j = j + 1) begin
//                 b = j;  // 将循环变量的值赋给b
//                 #1;
//                 $display("Time: %0t, a = %0d, b = %0d, s = %0d, cout = %0d", 
//                          $time, a, b, s, cout);
//             end
//             #1;
//             $display("--- Finished a = %0d ---", a);
//         end

//         $display("Simulation finished at time %0t", $time);
//         $finish;
//     end      
// endmodule