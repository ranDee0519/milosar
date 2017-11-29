
module vector_mux(
        input wire a,
        input wire b,
        input set_h_b,
        output wire out_signal
    );
    
    assign out_signal = set_h_b ? b : a;
    
endmodule
