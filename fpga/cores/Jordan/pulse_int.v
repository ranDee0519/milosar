
`timescale 1 ns / 1 ps

module pulse_int #( parameter integer AXIS_DATA_WIDTH = 32 )
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
  input wire [7:0]                   n_pulses,
  input wire [15:0]                  n_samples,  
  input wire [15:0]                  start_index, 
  input wire [15:0]                  end_index
);
  
  reg [AXIS_DATA_WIDTH-1:0] data;
  
  reg rd_en;
  reg wr_en;
  reg out_en;
  reg [1:0] state;
  reg [31:0] pulse_index;
  reg [31:0] sample_index;
  
  parameter IDLE                = 0;
  parameter REST_WRITE          = 1;
  parameter FIRST_WRITE         = 2;
  
  always @(posedge aclk)
  begin 
    if (~aresetn) 
    begin
        state       <= IDLE;
        rd_en       <= 0;
        wr_en       <= 0;
        out_en      <= 0;
    end else 
    begin
        case(state)
            IDLE: 
            begin
                if (s_axis_tvalid) 
                begin
                    state           <= FIRST_WRITE;
                    wr_en           <= 1;
                    rd_en           <= 0;
                    out_en          <= 0;
                    pulse_index     <= 0;
                    sample_index    <= 0;
                    data            <= s_axis_tdata;                    
                end
            end
            
            FIRST_WRITE:
            begin
                if (s_axis_tvalid) 
                begin
                    sample_index    <= sample_index + 1;
                    data            <= s_axis_tdata;
                end

                if (sample_index >= n_samples) 
                begin
                    state           <= REST_WRITE;
                    pulse_index     <= pulse_index + 1;
                    rd_en           <= 1;
                    sample_index    <= 1;
                end
            end       
            
            REST_WRITE:
            begin         
                if (s_axis_tvalid) 
                begin
                    sample_index    <= sample_index + 1;  
                    data            <= s_axis_tdata_fifo + s_axis_tdata;                                          
                end
                
                if (sample_index >= n_samples) 
                begin
                    sample_index    <= 1;
                    pulse_index     <= pulse_index + 1;
                    
                    if (pulse_index == n_pulses - 1)
                    begin
                        out_en          <= 1;
                    end 
                    
                    if (pulse_index >= n_pulses) 
                    begin
                        state       <= FIRST_WRITE;
                        pulse_index <= 0;
                        out_en      <= 0;
                    end                     
                end                
            end
            
        endcase
    end
  end

  assign m_axi_wdata        = s_axis_tdata_fifo;
  assign m_axi_wvalid       = s_axis_tvalid & out_en; // & (sample_index >= start_index) & (sample_index <= end_index);
  
  assign m_axi_wdata_fifo   = data;
  assign m_axi_wvalid_fifo  = s_axis_tvalid & wr_en;
  
  assign s_axis_tready_fifo = s_axis_tvalid & rd_en;
  assign s_axis_tready      = 1;

endmodule
