`timescale 1ns / 1ps

module Starter #(parameter WIDTH = 64)
    (
       input wire aclk,
       input wire aresetn,
       input wire [WIDTH-1:0] gap_length,
       output reg trigger_immediate,
       output reg trigger_long
    );
    
    reg [WIDTH-1:0] count;
    
    always@(posedge aclk) begin
        if (~aresetn) begin
            count = {WIDTH{1'b0}};
            trigger_immediate <= 1'b0;
            trigger_long <= 1'b0;
        end else begin
        
            //On the first clock cycle trigger the immediage line
            if (count <= 7) begin
                trigger_immediate <= 1'b1;
                count = count + 1'b1;  
            //Wait 10 clock cycles and initiate a short trigger reset
            end else if (count <= 9) begin
                trigger_immediate <= 1'b0;
                count = count + 1'b1;  
            end else if (count == 10) begin
                trigger_immediate <= 1'b1;
                count = count + 1'b1;
            end else if (count < 10 + gap_length) begin
                 count = count + 1'b1;
            end else begin
                 trigger_long <= 1'b1;
            end 
                  
                                            
        end
    end
    
endmodule
