
`timescale 1 ns / 1 ps

module axis_decimator #
(
  parameter integer AXIS_TDATA_WIDTH = 32,
  parameter integer CNTR_WIDTH = 32
)
(
  // System signals
  input  wire                                   aclk,
  input  wire                                   aresetn,

  input  wire [CNTR_WIDTH-1:0]                  cfg_data,

  input  wire [AXIS_TDATA_WIDTH - 1:0]          s00_axis_tdata,
  input  wire                                   s00_axis_tvalid,
  output wire                                   s00_axis_tready,

  output wire [AXIS_TDATA_WIDTH - 1:0]          m_axis_tdata,  
  output wire                                   m_axis_tvalid, 
  input wire                                    m_axis_tready
);


    reg [CNTR_WIDTH - 1 : 0] counter;
    
    wire transfer_ok = s00_axis_tvalid && m_axis_tready;
    
    always @(posedge aclk) begin
        if (~aresetn) begin
            counter <=  {(CNTR_WIDTH){1'b0}};
        end else if (transfer_ok == 1) begin
            counter <= (counter >= (cfg_data - 1)) ? {(CNTR_WIDTH){1'b0}} : counter + 1'b1;
        end
    end
    
	//Data is valid if counter == 0 or if cfg_data == 0
    assign m_axis_tvalid = ~(|counter) && s00_axis_tvalid; 
	assign m_axis_tdata = s00_axis_tdata;
    assign s00_axis_tready = m_axis_tready;
endmodule
