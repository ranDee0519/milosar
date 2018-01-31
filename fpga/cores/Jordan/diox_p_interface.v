`timescale 1 ns / 1 ps

module diox_p_interface #
(
    parameter integer DATA_WIDTH = 8
)
(
    inout wire [DATA_WIDTH-1:0] exp_data,
    input wire [DATA_WIDTH-1:0] data,
    output wire trigger_out
);

    assign exp_data[DATA_WIDTH-1:1] = data[DATA_WIDTH-1:1];
    assign trigger_out = exp_data[0];

endmodule
