`timescale 1ns / 1ps


module delay_start #(  parameter integer CNTR_WIDTH = 32) (
     input  wire                                   aclk,
     input  wire                                   aresetn,
     input  wire [CNTR_WIDTH-1 : 0]                delay_amount,
     output wire                                   triggern
    );
    
    reg [CNTR_WIDTH-1 : 0] counter;
    reg reset_state;
    
    always@(posedge aclk) begin
        
        reset_state <= aresetn;
        
        if (~aresetn) begin
            counter <= {(CNTR_WIDTH){1'b0}};
        end else if (counter <= delay_amount) begin
            counter <= counter + 1'b1;
        end
        
    end
    
    assign triggern = (counter > delay_amount && reset_state);
    
endmodule
