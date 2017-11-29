`timescale 1 ns / 1 ps

module exp_interface #
(
  parameter integer DATA_WIDTH = 8
)
(
  inout  wire [DATA_WIDTH-1:0] exp_data,
  input  wire [DATA_WIDTH-1:0] data
);


  assign exp_data = data;


endmodule