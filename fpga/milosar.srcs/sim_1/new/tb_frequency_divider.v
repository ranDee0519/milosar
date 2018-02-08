`timescale 1ns / 1ps

module tb_frequency_divider();

    reg clock;
    reg en = 1;
    reg [22:0] div = 23'd4;
    wire out;
    
    frequency_divider uut (
    .clk_in(clock), 
    .clk_out(out),
    .divisor(div),
    .enable(en)
    );
    
    initial begin
        clock = 1;
        forever #1 clock = ~clock;
    end
  
endmodule
