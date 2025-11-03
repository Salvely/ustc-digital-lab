module NextDayInMonth (
    input [4:0]         today,
    input [3:0]         month,
    input [31:0]        year,
    output reg [4:0]    tomorrow,
    output reg [3:0]    next_month
);
reg [4:0] DaysOfMonth; // 本月有多少天

always @(*) begin
        if((year % 400 == 0) | (year % 4 == 0 & year % 100 != 0)) begin
                DaysOfMonth = 5'd29;
        end
        else begin
                case (month)
                        2: DaysOfMonth= 5'd28;
                        4, 6, 9, 11: DaysOfMonth = 5'd30;
                        default: DaysOfMonth = 5'd31;
                endcase                
        end
end

always @(*) begin
    if (today == DaysOfMonth) 
        tomorrow = 5'd1; 
    else
        tomorrow = today + 5'd1;
end

always @(*) begin
    if (today == DaysOfMonth) begin
        if (month == 4'd12)
            next_month = 4'd1;
        else
            next_month = month + 4'd1;
    end
    else
        next_month = month;
end
endmodule