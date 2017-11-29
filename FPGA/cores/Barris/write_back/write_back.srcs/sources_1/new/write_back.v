`timescale 1ns / 1ps

module write_back #
(
  parameter integer AXIS_TDATA_WIDTH = 32,
  parameter integer CNTR_WIDTH = 32
)
(
  input  wire                                   aclk,
  input  wire                                   aresetn,
  output reg                                    is_complete_n,

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
            is_complete_n <= 1'b1;
        end else if (transfer_ok == 1) begin
            if (counter < cfg_data) begin
                counter <= counter + 1'b1;
            end else begin
                is_complete_n <= 1'b0;
            end
        end
    end
    
    assign m_axis_tvalid = is_complete_n && s00_axis_tvalid; 
	assign m_axis_tdata = s00_axis_tdata;
    assign s00_axis_tready = m_axis_tready;
endmodule