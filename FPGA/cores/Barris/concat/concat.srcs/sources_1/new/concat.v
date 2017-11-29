`timescale 1ns / 1ps

module concat(
        input wire a_0,
        input wire a_1,
        output wire c
    );
    
    assign c = {a_1, a_0};
endmodule
