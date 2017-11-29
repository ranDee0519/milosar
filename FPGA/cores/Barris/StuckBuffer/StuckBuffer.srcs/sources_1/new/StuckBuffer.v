module StuckBuffer#(
  parameter integer SWITCH_GAP_WIDTH = 8,
  parameter integer COUNTER_WIDTH = 64,
  parameter integer CAPACITY_WIDTH = 12,    //SHOULD BE LOG_2(CAPACITY_ENTRIES)
  parameter integer CAPACITY_ENTRIES = 4096, //ALWAYS DEFINE IN A POWER OF 2
  parameter integer AXI_DATA_WIDTH = 16)( //Defines the width of a basic entry. Should be 16.

  input wire  aclk,
  input wire  aresetn,
  input wire  hold_reset_n,
  input wire [COUNTER_WIDTH-1:0] countvalue,
  input wire [SWITCH_GAP_WIDTH-1:0] switch_gap_l, //For the leading edge
  input wire [SWITCH_GAP_WIDTH-1:0] switch_gap_r, //For the lagging edge
  inout wire is_transmitting_out,

   // Slave side
  output wire                        s00_axis_tready,
  input  wire [AXI_DATA_WIDTH-1:0]   s00_axis_tdata,
  input  wire                        s00_axis_tvalid,

  // Master side
  input  wire                        m_axis_tready,
  output wire [AXI_DATA_WIDTH-1:0]   m_axis_tdata,
  output wire                        m_axis_tvalid,

  // General Operations
  input wire  [CAPACITY_WIDTH-1:0]   n_entries

);

reg [COUNTER_WIDTH-1:0] counter, counter_next;

reg [AXI_DATA_WIDTH-1:0] push_data, push_data_next;

reg [AXI_DATA_WIDTH-1:0] pop_data, pop_data_next;
reg pop_data_valid, pop_data_valid_next;

reg [CAPACITY_WIDTH-1:0] write_index = {(CAPACITY_WIDTH){1'b0}};
reg [CAPACITY_WIDTH-1:0] write_index_next = {(CAPACITY_WIDTH){1'b0}};
reg [CAPACITY_WIDTH-1:0] read_index = {(CAPACITY_WIDTH){1'b0}};
reg [CAPACITY_WIDTH-1:0] read_index_next = {(CAPACITY_WIDTH){1'b0}};
reg [AXI_DATA_WIDTH-1:0] memory[0:CAPACITY_ENTRIES-1];

always @(posedge aclk) begin
    
    if (~hold_reset_n) begin
        counter <= {{COUNTER_WIDTH}{1'b0}};
    end else begin
        counter <= counter_next;
    end
    
    if(~aresetn) begin
          read_index <= {(CAPACITY_WIDTH){1'b1}};
          write_index <= {(CAPACITY_WIDTH){1'b1}};
          push_data <= {(AXI_DATA_WIDTH){1'b0}};
          pop_data <= {(AXI_DATA_WIDTH){1'b0}};
          pop_data_valid <= 1'b0;
        end
    else
    begin
      push_data <= push_data_next;
      pop_data <= pop_data_next;
      pop_data_valid <= pop_data_valid_next;
      read_index <= read_index_next;
      
      memory[write_index] <= push_data;
      write_index <= write_index_next;
    end
end

always @* begin
    counter_next = counter;
    pop_data_next = pop_data;
    pop_data_valid_next = pop_data_valid;
	push_data_next = push_data;
    read_index_next = read_index;
    write_index_next = write_index;

    // If slave data valid, capture it
    if(s00_axis_tvalid) begin
      push_data_next = s00_axis_tdata;
      write_index_next = (write_index == n_entries - 1) ? {(CAPACITY_WIDTH){1'b0}} : write_index + 1'b1;
    end
          
    //If read is enabled & master is ready for data
    if ((counter < n_entries) && hold_reset_n) begin
        pop_data_next = memory[read_index];
        read_index_next = (read_index == n_entries - 1) ? {(CAPACITY_WIDTH){1'b0}} : read_index + 1'b1;
        pop_data_valid_next = 1'b1;        
    end else begin
        pop_data_next = {(AXI_DATA_WIDTH){1'b0}};
        read_index_next = {(CAPACITY_WIDTH){1'b0}};
        pop_data_valid_next = 1'b1;
    end
    
    if (counter >= countvalue) begin
        counter_next = {COUNTER_WIDTH{1'b0}};
    end else begin
        counter_next = counter + 1'b1; 
    end
    
end

assign m_axis_tdata = pop_data;
assign m_axis_tvalid = pop_data_valid;

assign is_transmitting_out = ~((counter < (n_entries - switch_gap_r)) | counter >= (countvalue - switch_gap_l));

endmodule
