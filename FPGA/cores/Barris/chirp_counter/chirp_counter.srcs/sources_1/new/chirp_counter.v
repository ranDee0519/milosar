`timescale 1ns / 1ps

module chirp_counter #(parameter PHASE_WIDTH = 32, DELAY_WIDTH = 32)(
    input wire arestn,
    input wire aclk,
    input wire [PHASE_WIDTH-1:0] start_val,
    input wire [PHASE_WIDTH-1:0] end_val,
    input wire [DELAY_WIDTH-1:0] delay_amount,
    output reg [PHASE_WIDTH-1:0] counter_val,
    output reg complete_n
    );
    
    reg [DELAY_WIDTH-1:0] delay_counter = 0;

    
    always@(posedge aclk) begin
    
        if (~arestn) begin
            complete_n <= 1'b0;
            counter_val <= start_val;
            delay_counter <= {(DELAY_WIDTH){1'b0}};
        end else begin
        
            if (delay_counter >= delay_amount) begin
            
            if (counter_val > end_val) begin
                //counter_val = start_val;
                complete_n <= 1'b0;
            end else begin
                counter_val <= counter_val + 1;
                complete_n <= 1'b1;
            end
            
            delay_counter <= {(DELAY_WIDTH){1'b0}};

            end else begin


            delay_counter <= delay_counter + 1'b1;
            
            end

        end
        
    end
    
endmodule
