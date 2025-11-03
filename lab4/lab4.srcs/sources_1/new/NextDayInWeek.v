`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/26 15:37:53
// Design Name: 
// Module Name: NextDayInWeek
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


module NextDayInWeek (
    input [2:0]         today,
    output reg [2:0]    tomorrow
);
always @(*) begin
    if (today == 3'd7)
        tomorrow = 3'd1;
    else
        tomorrow = today + 3'd1;
end
endmodule
