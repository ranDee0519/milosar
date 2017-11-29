`timescale 1ns / 1ps

module clock_source_mux(
        input wire adc_clock_p,
        input wire adc_clock_n,
        
        input wire [1:0]day_clock_p,
        input wire [1:0]day_clock_n,
        
        input wire ctrl_day,
      
        output wire output_clock
    );
    
    wire adc_clk;
    IBUFGDS adc_clk_inst (.I(adc_clock_p), .IB(adc_clock_n), .O(adc_clk));
    
    wire day_clk;
    IBUFGDS day_clk_inst (.I(day_clock_p[0]), .IB(day_clock_n[0]), .O(day_clk));

    assign output_clock = ctrl_day ? day_clk : adc_clk;

endmodule
