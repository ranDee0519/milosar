`timescale 1ns / 1ps

module unit_delay #(parameter integer AXIS_TDATA_WIDTH = 32)
(
 // System signals
 input  wire                        aclk,
 input  wire                        aresetn,

 // Slave side
 output wire                        s_axis_tready,
 input  wire [AXIS_TDATA_WIDTH-1:0] s_axis_tdata,
 input  wire                        s_axis_tvalid,

 // Master side
 input  wire                        m_axis_tready,
 output wire [AXIS_TDATA_WIDTH-1:0] m_axis_tdata,
 output wire                        m_axis_tvalid
);

 reg [AXIS_TDATA_WIDTH-1:0] int_tdata_reg, int_tdata_next;
 reg [AXIS_TDATA_WIDTH-1:0] int_bucket_reg, int_bucket_next, int_bucket_next_next;
 reg int_tvalid_reg, int_tvalid_next;
 reg int_tready_reg, int_tready_next;
 

 wire int_tvalid_wire;

 always @(posedge aclk)
 begin
   if(~aresetn)
   begin
     int_tdata_reg <= {(AXIS_TDATA_WIDTH){1'b0}};
     int_bucket_reg <=  {(AXIS_TDATA_WIDTH){1'b0}};
     int_bucket_next <=  {(AXIS_TDATA_WIDTH){1'b0}};
     int_bucket_next_next <=  {(AXIS_TDATA_WIDTH){1'b0}};

     int_tvalid_reg <= 1'b0;
     int_tready_reg <= 1'b0;
   end
   else
   begin
   
     int_tdata_reg <= int_bucket_reg;    
     int_bucket_reg <= int_bucket_next;
     int_bucket_next <= int_bucket_next_next;  
     int_bucket_next_next <= int_tdata_next;
          
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

   //Inform the slave we will be ready on the following clock cycle
   if(~int_tready_reg) begin
     int_tready_next = 1'b1;
   end
   
   //If valid data is available
   if (s_axis_tvalid) begin
    int_tready_next = 1'b1;
    int_tdata_next = s_axis_tdata;
    int_tvalid_next = 1'b1;
   end
   
 end

 assign s_axis_tready = int_tready_reg;
 assign m_axis_tdata = int_tdata_reg;
 assign m_axis_tvalid = int_tvalid_reg;

endmodule
