`timescale 1ns / 1ps

module sys_trigger
    (
       input wire aclk,
       input wire aresetn,
       output wire startedn
    );
    
    reg startn, startn_next;
    
    always@(posedge aclk) begin
        if (~aresetn) begin
            startn <= 1'b0;
        end else begin
            startn <= startn_next;    
        end
    end
    
    always@(*) begin
        startn_next = startn;
        startn_next = 1'b1;
    end
    
    assign startedn = startn;
endmodule
