
`timescale 1 ns / 1 ps

module axis_red_pitaya_adc #
(
  parameter integer ADC_DATA_WIDTH = 14,
  parameter integer AXIS_TDATA_WIDTH = 16
)
(
  // System signals
  output wire                        adc_clk,
  input wire                         aresetn,

  // ADC signals
  output wire                        adc_csn,
  //input  wire                        adc_clk_p,
  //input  wire                        adc_clk_n,
  
  input wire                         int_clk,

  input  wire [ADC_DATA_WIDTH-1:0]   adc_dat_a,
  input  wire [ADC_DATA_WIDTH-1:0]   adc_dat_b,

  // Master side
  output wire                        m00_axis_tvalid,
  output wire [AXIS_TDATA_WIDTH-1:0] m00_axis_tdata,
  output wire                        m01_axis_tvalid,
  output wire [AXIS_TDATA_WIDTH-1:0] m01_axis_tdata
);

  localparam PADDING_WIDTH = AXIS_TDATA_WIDTH - ADC_DATA_WIDTH;

  reg  [ADC_DATA_WIDTH-1:0]         int_dat_a_reg;
  reg  [ADC_DATA_WIDTH-1:0]         int_dat_b_reg;
  reg  reset_state;
  
  //wire                              int_clk;
  //IBUFGDS adc_clk_inst (.I(adc_clk_p), .IB(adc_clk_n), .O(int_clk));

  always @(posedge int_clk)
  begin
    reset_state       <= aresetn;
    int_dat_a_reg     <= adc_dat_a;
    int_dat_b_reg     <= adc_dat_b;   
  
  end

  assign adc_clk = int_clk;

  assign adc_csn = 1'b1;

  assign m00_axis_tvalid = reset_state;
  assign m00_axis_tdata = {{(PADDING_WIDTH + 1){int_dat_a_reg[ADC_DATA_WIDTH-1]}}, ~int_dat_a_reg[ADC_DATA_WIDTH-2:0]};
  
  assign m01_axis_tvalid = reset_state;
  assign m01_axis_tdata = {{(PADDING_WIDTH + 1){int_dat_b_reg[ADC_DATA_WIDTH-1]}}, ~int_dat_b_reg[ADC_DATA_WIDTH-2:0]};
           

endmodule
