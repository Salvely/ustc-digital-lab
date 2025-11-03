module example(
    input [3:0]             num1, num2,
    input                   sel,
    output reg [3:0]        out
);

wire one;
assign one = 1'b1;

always @(*) begin
    if (sel)
        out = num1;
    else
        out = num2;
end
endmodule