`timescale 1ns / 1ps


module pulser#(parameter DATA_WIDTH = 32, PHASE_WIDTH = 27, DELAY_WIDTH = 10)(    
        
         // System signals
         input  wire aclk,
         input wire aresetn,
  
        // Slave side
         output wire                        s00_axis_tready,
         input  wire [DATA_WIDTH-1:0]       s00_axis_tdata,
         input  wire                        s00_axis_tvalid,

         // Master side
         input  wire                        m_axis_tready,
         output wire [DATA_WIDTH-1:0]       m_axis_tdata,
         output wire                        m_axis_tvalid,
         
         output wire                        complete_n,
         input wire [PHASE_WIDTH-1:0]       start_phase,
         input wire [PHASE_WIDTH-1:0]       end_phase,
         input wire [DELAY_WIDTH-1:0]       delay_amount
        
);

  reg [DATA_WIDTH-1:0] int_tdata_reg, int_tdata_next;
  reg int_tvalid_reg, int_tvalid_next;
  reg int_tready_reg, int_tready_next;
  
  reg [PHASE_WIDTH-1:0] int_counter_next;
  reg [PHASE_WIDTH-1:0] int_counter_reg;
  reg [DELAY_WIDTH-1:0] int_delay_next;
  reg [DELAY_WIDTH-1:0] int_delay_reg;

  always @(posedge aclk)
  begin
    if(~aresetn)
    begin
      int_tdata_reg <= {(DATA_WIDTH){1'b0}};
      int_tvalid_reg <= 1'b0;
      int_tready_reg <= 1'b0;
      int_counter_reg <= start_phase;
      int_delay_reg <= {(DELAY_WIDTH){1'b0}};
    end
    else
    begin
      int_tdata_reg  <= int_tdata_next;
      int_tvalid_reg <= int_tvalid_next;
      int_tready_reg <= int_tready_next;
      int_counter_reg <= int_counter_next;
      int_delay_reg <= int_delay_next;
    end
  end

  always @*
  begin
    int_tdata_next = int_tdata_reg;
    int_tvalid_next = int_tvalid_reg;
    int_tready_next = int_tready_reg;
    int_counter_next = int_counter_reg;
    int_delay_next = int_delay_reg;

    if(~int_tready_reg)
    begin
      int_tready_next = 1'b1;
    end
    

    if (~s00_axis_tvalid) begin
        int_tvalid_next = 1'b0;
    end
    
    if(int_tready_reg & s00_axis_tvalid)
    begin
      int_tdata_next = s00_axis_tdata;
      int_tvalid_next = 1'b1;
      
      if (complete_n) begin
      
        if (int_delay_next >= delay_amount) begin
            int_counter_next = int_counter_next + 1;
            int_delay_next = {(DELAY_WIDTH){1'b0}};
        end else begin
            int_delay_next = int_delay_next + 1'b1;
        end
            
      end
      
    end
    
    
    
  end
  
  assign complete_n = int_counter_reg < end_phase;

  assign s00_axis_tready = int_tready_reg;
  assign s01_axis_tready = int_tready_reg;
  assign m_axis_tdata = int_tdata_reg;
  assign m_axis_tvalid = int_tvalid_reg;
    
endmodule
