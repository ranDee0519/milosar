
module zero_flusher #
(
  parameter integer AXIS_TDATA_WIDTH = 32)
  (

    input  wire                                   aclk,
    input  wire                                   aresetn,
    
    input  wire [AXIS_TDATA_WIDTH - 1:0]          s00_axis_tdata,
    input  wire                                   s00_axis_tvalid,
    output wire                                   s00_axis_tready,
  
    output wire [AXIS_TDATA_WIDTH - 1:0]          m_axis_tdata,  
    output wire                                   m_axis_tvalid, 
    input wire                                    m_axis_tready
  );
  
  reg reset_state;
  
  always@(posedge aclk) begin
    reset_state <= aresetn;
  end
    
  assign m_axis_tvalid = ~reset_state; 
  assign m_axis_tdata =  {(AXIS_TDATA_WIDTH){1'b0}};
  assign s00_axis_tready = 1'b1;

endmodule

    
