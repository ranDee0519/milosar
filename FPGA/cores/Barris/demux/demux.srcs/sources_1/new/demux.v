`timescale 1 ns / 1 ps

	module demux#(parameter integer WIDTH	= 32)
	(
	    input  wire aclk,
        input wire aresetn,
	
        input wire set_h_for_m01,
       
        input wire [WIDTH - 1:0] s00_axis_tdata,        
        input wire  s00_axis_tvalid,
        output wire  s00_axis_tready,
        
        output wire [WIDTH - 1:0] m_00_axis_tdata,  
        output wire [WIDTH - 1:0] m_01_axis_tdata,  
        output wire  m_00_axis_tvalid, 
        output wire  m_01_axis_tvalid, 
        input wire   m_00_axis_tready,
        input wire   m_01_axis_tready

      	);
  
  
    assign m_00_axis_tdata = set_h_for_m01 ? {(WIDTH){1'b0}} : s00_axis_tdata;
    assign m_01_axis_tdata = ~set_h_for_m01 ? {(WIDTH){1'b0}} : s00_axis_tdata;
  
    assign m_00_axis_tvalid = set_h_for_m01 ? 1'b0 : s00_axis_tvalid;
    assign m_01_axis_tvalid = ~set_h_for_m01 ? 1'b0 : s00_axis_tvalid;

    assign s00_axis_tready = set_h_for_m01 ? m_01_axis_tready : m_00_axis_tready;

        
	endmodule