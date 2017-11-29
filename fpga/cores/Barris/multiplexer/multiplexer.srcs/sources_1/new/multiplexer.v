`timescale 1ns / 1ps

module multiplexer#(
parameter WIDTH = 32
)
(    
        //Multiplexer Constants
        input wire [WIDTH-1:0] cfg_data,
        input wire set_h_for_constant,        
        
         // System signals
         input  wire aclk,
         input wire aresetn,
  
        // Slave side
         output wire                        s_axis_tready,
         input  wire [WIDTH-1:0]            s_axis_tdata,
         input  wire                        s_axis_tvalid,
       
         // Master side
         input  wire                        m_axis_tready,
         output wire [WIDTH-1:0]            m_axis_tdata,
         output wire                        m_axis_tvalid
        
);

  reg [WIDTH-1:0] int_tdata_reg, int_tdata_next;
  reg int_tvalid_reg, int_tvalid_next;
  reg int_tready_reg, int_tready_next;

  wire int_tvalid_wire;

  always @(posedge aclk)
  begin
    if(~aresetn)
    begin
      int_tdata_reg <= {(WIDTH){1'b0}};
      int_tvalid_reg <= 1'b0;
      int_tready_reg <= 1'b0;
    end
    else
    begin
      int_tdata_reg  <= int_tdata_next;
      int_tvalid_reg <= int_tvalid_next;
      int_tready_reg <= int_tready_next;
    end
  end

  assign int_tvalid_wire = int_tready_reg & s_axis_tvalid;

  always @*
  begin
    int_tdata_next = int_tdata_reg;
    int_tvalid_next = int_tvalid_reg;
    int_tready_next = int_tready_reg;

    if(~int_tready_reg)
    begin
      int_tready_next = 1'b1;
    end

    if(int_tvalid_wire & set_h_for_constant)
    begin
      int_tdata_next = cfg_data;
      int_tvalid_next = 1'b1;
    end
    
    if(int_tvalid_wire & ~set_h_for_constant)
    begin
      int_tdata_next = s_axis_tdata;
      int_tvalid_next = 1'b1;
    end

  end

  assign s_axis_tready = int_tready_reg;
  assign m_axis_tdata = int_tdata_reg;
  assign m_axis_tvalid = int_tvalid_reg;
    
endmodule
