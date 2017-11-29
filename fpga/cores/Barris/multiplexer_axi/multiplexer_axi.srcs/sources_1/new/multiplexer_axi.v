`timescale 1 ns / 1 ps

	module multiplexer_axi#(parameter integer WIDTH	= 32)
	(
	    input  wire aclk,
        input wire aresetn,
	
        input wire set_h_for_s01,
        input wire [WIDTH - 1:0] s00_axis_tdata,
        input wire [WIDTH - 1:0] s01_axis_tdata,
        
        input wire  s00_axis_tvalid,
        input wire  s01_axis_tvalid,
         
        output wire  s00_axis_tready,
        output wire  s01_axis_tready,
        
        output wire [WIDTH - 1:0] m_axis_tdata,  
        output wire  m_axis_tvalid, 
        input wire   m_axis_tready
      	);
	
	wire [WIDTH - 1:0] temp_s_axis_data[1:0];
	assign temp_s_axis_data[0] = s00_axis_tdata;
    assign temp_s_axis_data[1] = s01_axis_tdata;
	assign m_axis_tdata = temp_s_axis_data[set_h_for_s01];
	
    wire [1:0]temp_s_axis_valid;
    assign temp_s_axis_valid[0] = s00_axis_tvalid;
    assign temp_s_axis_valid[1] = s01_axis_tvalid;
    assign m_axis_tvalid = temp_s_axis_valid[set_h_for_s01];

    assign s00_axis_tready = m_axis_tready;
    assign s01_axis_tready = m_axis_tready;

        
	endmodule