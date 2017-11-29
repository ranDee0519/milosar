`timescale 1ns / 1ps

module Stop_Counter #(parameter WIDTH = 64, parameter MAX_RESETS = 3)
    (
       input wire aclk,
       input wire aresetn,
       input wire pri_triggern,
       output reg triggern,
       output reg complete
    );
    
    reg [WIDTH-1:0] count;
    
    always@(posedge aclk) begin
        if (~aresetn) begin
            count = {WIDTH{1'b0}};
            triggern = 1'b0;
            complete = 1'b0;
        end else begin
        
            if (~pri_triggern) begin
                count <= count + 1'b1;
            end
            
            if (count < MAX_RESETS) begin
                triggern <= pri_triggern;
            end else begin
                triggern <= 1'b1;
                complete = 1'b1;
            end
                
        end
    end
    
endmodule
