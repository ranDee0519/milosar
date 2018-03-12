
`timescale 1 ns / 1 ps

module pulse_integrator #( parameter integer AXIS_DATA_WIDTH = 32 )
(
  // System signals
  input  wire                        aclk,
  input  wire                        aresetn,

  // Slave side
  output wire                        s_axis_tready,
  input  wire [AXIS_DATA_WIDTH-1:0]  s_axis_tdata,
  input  wire                        s_axis_tvalid,
  
  input  wire                        m_axi_wready,  // AXI master: Write ready  
  output wire [AXIS_DATA_WIDTH-1:0]  m_axi_wdata,   // AXI master: Write data
  output wire                        m_axi_wvalid,  // AXI master: Write valid
  
  
  // FIFO interface
  output wire                        s_axis_tready_fifo,
  input  wire [AXIS_DATA_WIDTH-1:0]  s_axis_tdata_fifo,
  input  wire                        s_axis_tvalid_fifo,
  
  // Master side
  output wire [AXIS_DATA_WIDTH-1:0]  m_axi_wdata_fifo,   // AXI master: Write data
  output wire                        m_axi_wvalid_fifo,  // AXI master: Write valid
  input  wire                        m_axi_wready_fifo,  // AXI master: Write ready
  
  // Configuration
  input wire [31:0]                  int_time,
  input wire [63:0]                  pri_count,  
  input wire [15:0]                  start_index, 
  input wire [15:0]                  end_index
);
  
  reg [AXIS_DATA_WIDTH-1:0] data;
  
  reg rd_en;
  reg wr_en;
  reg [1:0] state;
  reg [31:0] counter;
  reg [31:0] index;
  reg [63:0] pri_counter;
  
  parameter IDLE = 0;
  parameter FIRST_WRITE = 3;
  parameter FIRST_FIRST_WRITE = 2;
  parameter REST_WRITE = 1;
  
  always @(posedge aclk) begin
    if(~aresetn) begin
        state       <= IDLE;
        rd_en       <= 0;
        wr_en       <= 0;
    end
    else begin
        case(state)
            IDLE: 
            begin
                if(s_axis_tvalid) begin
                    state       <= FIRST_FIRST_WRITE;
                    counter     <= 0;
                    wr_en       <= 1;
                    rd_en       <= 0;
                    data        <= s_axis_tdata;
                    index       <= 0;
                    pri_counter <= 0;
                end
            end
            
            
            FIRST_WRITE:
            begin
                if(s_axis_tvalid) begin
                    index <= index + 1;
                    data <= s_axis_tdata;
                    pri_counter <= pri_counter + 1;
                end
                
                // was here
                //this
                if(pri_counter>=pri_count) begin
                    state <= REST_WRITE;
                    pri_counter <= 0;
                    counter <= counter + 1;
                    index   <= 0;
                end
            end
            
            
            REST_WRITE:
            begin
                if(s_axis_tvalid) begin
                    data       <= s_axis_tdata_fifo + s_axis_tdata;
                    index      <= index + 1;
                    
                
                      
                      
                      // this
                    if(pri_counter>=pri_count) begin
                        index   <= 0;
                        pri_counter <= 0;
                        if(counter >= int_time) begin
                            state   <= FIRST_WRITE;
                            counter <= 0;
                        end else begin
                            counter <= counter + 1; 
                        end  
                    end else begin
                        pri_counter <= pri_counter + 1;
                    end 
                           
                                
                end
                
                // was here
                
                
            end
            
            
            FIRST_FIRST_WRITE:
            begin
                if(s_axis_tvalid) begin
                    index      <= index + 1;
                    data <= s_axis_tdata;
                    pri_counter <= pri_counter + 1;
                    
                            
                end
                
                
                // was here
                // this
                if(pri_counter>=pri_count) begin
                    state   <= REST_WRITE;
                    counter <= counter + 1;
                    rd_en   <= 1;
                    index   <= 0;
                    pri_counter <= 0;
                end
                
            end
        endcase
    end
end

  assign m_axi_wdata        = s_axis_tdata_fifo;
  assign m_axi_wvalid       =  (&state) & s_axis_tvalid   &(index>=start_index)&(index < end_index);
  
  assign m_axi_wdata_fifo   = data;
  assign m_axi_wvalid_fifo  = wr_en & s_axis_tvalid ;
  
  assign s_axis_tready_fifo = rd_en & s_axis_tvalid;
  assign s_axis_tready      = 1;

endmodule