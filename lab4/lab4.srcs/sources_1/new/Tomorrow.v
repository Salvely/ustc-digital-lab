module Tomorrow (
    input [3:0]         todayMonth,         // 今天的月份，范围 1~12
    input [4:0]         todayDayInMonth,    // 今天的日期，范围 1~31
    input [2:0]         todayDayInWeek,     // 今天星期几，范围 1~7
    input [31:0]        year,               // 年份
    output [3:0]        tomorrowMonth,
    output [4:0]        tomorrowDayInMonth,
    output [2:0]        tomorrowDayInWeek
);

NextDayInWeek nday (
    .today(todayDayInWeek),
    .tomorrow(tomorrowDayInWeek)
);

NextDayInMonth nmonth (
    .today(todayDayInMonth),
    .month(todayMonth),
    .tomorrow(tomorrowDayInMonth),
    .next_month(tomorrowMonth)
);
endmodule