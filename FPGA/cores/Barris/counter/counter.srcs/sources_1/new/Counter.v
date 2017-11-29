`timescale 1ns / 1ps

module Counter #(parameter WIDTH = 32)
    (
       input wire aclk,
       input wire aresetn,
       output reg [WIDTH-1:0] data 
    );
    
    //This is some comment
    
    always@(posedge aclk) begin
        if (~aresetn) begin
            data = {WIDTH{1'b0}};
        end else begin
            data = data + 1'b1;
        end
    end
    
endmodule


