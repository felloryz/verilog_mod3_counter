`timescale 1ns / 1ns

module tb_mod3_counter();

reg clk = 0;
reg start = 0;
reg stop = 0;
reg data = 0;
wire result;

// Тактовый сигнал
initial
    forever #5 clk = ~clk;
    
initial
begin
    #5
    start <= 1;
    #10
    start <= 0;
end

initial
begin
    #55
    stop <= 1;
    #10
    stop <= 0;
    #15
    $finish();
end

initial
begin
    #5
    data <= 1;
    #10
    data <= 0;
    // #40
    // data <= 1;
    // #10
    // data <= 0;
end

mod3_counter dut (
    .clk(clk),
    .start(start),
    .stop(stop),
    .data(data),
    .result(result)
);

initial
begin
    $dumpfile("test.vsd");
    $dumpvars;
end

endmodule
