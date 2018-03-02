//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.2 (lin64) Build 1577090 Thu Jun  2 16:32:35 MDT 2016
//Date        : Fri Mar  2 11:42:57 2018
//Host        : ubuntu running 64-bit Ubuntu 17.10
//Command     : generate_target system.bd
//Design      : system
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module channel_a_imp_JYKOO2
   (M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bvalid,
    M_AXI_wdata,
    M_AXI_wid,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    aclk,
    adc_data_tdata,
    adc_data_tvalid,
    aresetn,
    decimation,
    enable,
    status_araddr,
    status_arready,
    status_arvalid,
    status_awaddr,
    status_awready,
    status_awvalid,
    status_bready,
    status_bresp,
    status_bvalid,
    status_rdata,
    status_rready,
    status_rresp,
    status_rvalid,
    status_wdata,
    status_wready,
    status_wvalid);
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [5:0]M_AXI_awid;
  output [3:0]M_AXI_awlen;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input M_AXI_bvalid;
  output [31:0]M_AXI_wdata;
  output [5:0]M_AXI_wid;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input aclk;
  input [15:0]adc_data_tdata;
  input adc_data_tvalid;
  input [0:0]aresetn;
  input [15:0]decimation;
  input [0:0]enable;
  input [31:0]status_araddr;
  output status_arready;
  input status_arvalid;
  input [31:0]status_awaddr;
  output status_awready;
  input status_awvalid;
  input status_bready;
  output [1:0]status_bresp;
  output status_bvalid;
  output [31:0]status_rdata;
  input status_rready;
  output [1:0]status_rresp;
  output status_rvalid;
  input [31:0]status_wdata;
  output status_wready;
  input status_wvalid;

  wire [31:0]Conn1_ARADDR;
  wire Conn1_ARREADY;
  wire Conn1_ARVALID;
  wire [31:0]Conn1_AWADDR;
  wire Conn1_AWREADY;
  wire Conn1_AWVALID;
  wire Conn1_BREADY;
  wire [1:0]Conn1_BRESP;
  wire Conn1_BVALID;
  wire [31:0]Conn1_RDATA;
  wire Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire Conn1_RVALID;
  wire [31:0]Conn1_WDATA;
  wire Conn1_WREADY;
  wire Conn1_WVALID;
  wire [15:0]adc_data_1_TDATA;
  wire adc_data_1_TVALID;
  wire [0:0]aresetn1_1;
  wire [0:0]aresetn_1;
  wire [15:0]axis_decimator_0_m_axis_TDATA;
  wire axis_decimator_0_m_axis_TREADY;
  wire axis_decimator_0_m_axis_TVALID;
  wire [31:0]axis_dwidth_converter_0_M_AXIS_TDATA;
  wire axis_dwidth_converter_0_M_AXIS_TREADY;
  wire axis_dwidth_converter_0_M_AXIS_TVALID;
  wire [31:0]axis_ram_writer_0_M_AXI_AWADDR;
  wire [1:0]axis_ram_writer_0_M_AXI_AWBURST;
  wire [3:0]axis_ram_writer_0_M_AXI_AWCACHE;
  wire [5:0]axis_ram_writer_0_M_AXI_AWID;
  wire [3:0]axis_ram_writer_0_M_AXI_AWLEN;
  wire axis_ram_writer_0_M_AXI_AWREADY;
  wire [2:0]axis_ram_writer_0_M_AXI_AWSIZE;
  wire axis_ram_writer_0_M_AXI_AWVALID;
  wire axis_ram_writer_0_M_AXI_BREADY;
  wire axis_ram_writer_0_M_AXI_BVALID;
  wire [31:0]axis_ram_writer_0_M_AXI_WDATA;
  wire [5:0]axis_ram_writer_0_M_AXI_WID;
  wire axis_ram_writer_0_M_AXI_WLAST;
  wire axis_ram_writer_0_M_AXI_WREADY;
  wire [3:0]axis_ram_writer_0_M_AXI_WSTRB;
  wire axis_ram_writer_0_M_AXI_WVALID;
  wire [15:0]cfg_data_1;
  wire [31:0]ch_a_writer_sts_data;
  wire clk_sync_clk_out1;
  wire [31:0]ram_a_address_dout;

  assign Conn1_ARADDR = status_araddr[31:0];
  assign Conn1_ARVALID = status_arvalid;
  assign Conn1_AWADDR = status_awaddr[31:0];
  assign Conn1_AWVALID = status_awvalid;
  assign Conn1_BREADY = status_bready;
  assign Conn1_RREADY = status_rready;
  assign Conn1_WDATA = status_wdata[31:0];
  assign Conn1_WVALID = status_wvalid;
  assign M_AXI_awaddr[31:0] = axis_ram_writer_0_M_AXI_AWADDR;
  assign M_AXI_awburst[1:0] = axis_ram_writer_0_M_AXI_AWBURST;
  assign M_AXI_awcache[3:0] = axis_ram_writer_0_M_AXI_AWCACHE;
  assign M_AXI_awid[5:0] = axis_ram_writer_0_M_AXI_AWID;
  assign M_AXI_awlen[3:0] = axis_ram_writer_0_M_AXI_AWLEN;
  assign M_AXI_awsize[2:0] = axis_ram_writer_0_M_AXI_AWSIZE;
  assign M_AXI_awvalid = axis_ram_writer_0_M_AXI_AWVALID;
  assign M_AXI_bready = axis_ram_writer_0_M_AXI_BREADY;
  assign M_AXI_wdata[31:0] = axis_ram_writer_0_M_AXI_WDATA;
  assign M_AXI_wid[5:0] = axis_ram_writer_0_M_AXI_WID;
  assign M_AXI_wlast = axis_ram_writer_0_M_AXI_WLAST;
  assign M_AXI_wstrb[3:0] = axis_ram_writer_0_M_AXI_WSTRB;
  assign M_AXI_wvalid = axis_ram_writer_0_M_AXI_WVALID;
  assign adc_data_1_TDATA = adc_data_tdata[15:0];
  assign adc_data_1_TVALID = adc_data_tvalid;
  assign aresetn1_1 = aresetn[0];
  assign aresetn_1 = enable[0];
  assign axis_ram_writer_0_M_AXI_AWREADY = M_AXI_awready;
  assign axis_ram_writer_0_M_AXI_BVALID = M_AXI_bvalid;
  assign axis_ram_writer_0_M_AXI_WREADY = M_AXI_wready;
  assign cfg_data_1 = decimation[15:0];
  assign clk_sync_clk_out1 = aclk;
  assign status_arready = Conn1_ARREADY;
  assign status_awready = Conn1_AWREADY;
  assign status_bresp[1:0] = Conn1_BRESP;
  assign status_bvalid = Conn1_BVALID;
  assign status_rdata[31:0] = Conn1_RDATA;
  assign status_rresp[1:0] = Conn1_RRESP;
  assign status_rvalid = Conn1_RVALID;
  assign status_wready = Conn1_WREADY;
  system_axis_decimator_0_0 axis_decimator_0
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn_1),
        .cfg_data(cfg_data_1),
        .m_axis_tdata(axis_decimator_0_m_axis_TDATA),
        .m_axis_tready(axis_decimator_0_m_axis_TREADY),
        .m_axis_tvalid(axis_decimator_0_m_axis_TVALID),
        .s00_axis_tdata(adc_data_1_TDATA),
        .s00_axis_tvalid(adc_data_1_TVALID));
  system_axis_dwidth_converter_0_0 axis_dwidth_converter_0
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn_1),
        .m_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .m_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID),
        .s_axis_tdata(axis_decimator_0_m_axis_TDATA),
        .s_axis_tready(axis_decimator_0_m_axis_TREADY),
        .s_axis_tvalid(axis_decimator_0_m_axis_TVALID));
  system_axis_ram_writer_0_0 ch_a_writer
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn_1),
        .cfg_data(ram_a_address_dout),
        .m_axi_awaddr(axis_ram_writer_0_M_AXI_AWADDR),
        .m_axi_awburst(axis_ram_writer_0_M_AXI_AWBURST),
        .m_axi_awcache(axis_ram_writer_0_M_AXI_AWCACHE),
        .m_axi_awid(axis_ram_writer_0_M_AXI_AWID),
        .m_axi_awlen(axis_ram_writer_0_M_AXI_AWLEN),
        .m_axi_awready(axis_ram_writer_0_M_AXI_AWREADY),
        .m_axi_awsize(axis_ram_writer_0_M_AXI_AWSIZE),
        .m_axi_awvalid(axis_ram_writer_0_M_AXI_AWVALID),
        .m_axi_bready(axis_ram_writer_0_M_AXI_BREADY),
        .m_axi_bvalid(axis_ram_writer_0_M_AXI_BVALID),
        .m_axi_wdata(axis_ram_writer_0_M_AXI_WDATA),
        .m_axi_wid(axis_ram_writer_0_M_AXI_WID),
        .m_axi_wlast(axis_ram_writer_0_M_AXI_WLAST),
        .m_axi_wready(axis_ram_writer_0_M_AXI_WREADY),
        .m_axi_wstrb(axis_ram_writer_0_M_AXI_WSTRB),
        .m_axi_wvalid(axis_ram_writer_0_M_AXI_WVALID),
        .s_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .s_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID),
        .sts_data(ch_a_writer_sts_data));
  system_const_3_0 ram_a_address
       (.dout(ram_a_address_dout));
  system_sts_0_0 sts_a_channel
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn1_1),
        .s_axi_araddr(Conn1_ARADDR),
        .s_axi_arready(Conn1_ARREADY),
        .s_axi_arvalid(Conn1_ARVALID),
        .s_axi_awaddr(Conn1_AWADDR),
        .s_axi_awready(Conn1_AWREADY),
        .s_axi_awvalid(Conn1_AWVALID),
        .s_axi_bready(Conn1_BREADY),
        .s_axi_bresp(Conn1_BRESP),
        .s_axi_bvalid(Conn1_BVALID),
        .s_axi_rdata(Conn1_RDATA),
        .s_axi_rready(Conn1_RREADY),
        .s_axi_rresp(Conn1_RRESP),
        .s_axi_rvalid(Conn1_RVALID),
        .s_axi_wdata(Conn1_WDATA),
        .s_axi_wready(Conn1_WREADY),
        .s_axi_wvalid(Conn1_WVALID),
        .sts_data(ch_a_writer_sts_data));
endmodule

module channel_b_imp_WRMB9B
   (M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bvalid,
    M_AXI_wdata,
    M_AXI_wid,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    aclk,
    adc_data_tdata,
    adc_data_tvalid,
    aresetn,
    decimation,
    enable,
    status_araddr,
    status_arready,
    status_arvalid,
    status_awaddr,
    status_awready,
    status_awvalid,
    status_bready,
    status_bresp,
    status_bvalid,
    status_rdata,
    status_rready,
    status_rresp,
    status_rvalid,
    status_wdata,
    status_wready,
    status_wvalid);
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [5:0]M_AXI_awid;
  output [3:0]M_AXI_awlen;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input M_AXI_bvalid;
  output [31:0]M_AXI_wdata;
  output [5:0]M_AXI_wid;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input aclk;
  input [15:0]adc_data_tdata;
  input adc_data_tvalid;
  input [0:0]aresetn;
  input [15:0]decimation;
  input [0:0]enable;
  input [31:0]status_araddr;
  output status_arready;
  input status_arvalid;
  input [31:0]status_awaddr;
  output status_awready;
  input status_awvalid;
  input status_bready;
  output [1:0]status_bresp;
  output status_bvalid;
  output [31:0]status_rdata;
  input status_rready;
  output [1:0]status_rresp;
  output status_rvalid;
  input [31:0]status_wdata;
  output status_wready;
  input status_wvalid;

  wire [31:0]Conn1_ARADDR;
  wire Conn1_ARREADY;
  wire Conn1_ARVALID;
  wire [31:0]Conn1_AWADDR;
  wire Conn1_AWREADY;
  wire Conn1_AWVALID;
  wire Conn1_BREADY;
  wire [1:0]Conn1_BRESP;
  wire Conn1_BVALID;
  wire [31:0]Conn1_RDATA;
  wire Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire Conn1_RVALID;
  wire [31:0]Conn1_WDATA;
  wire Conn1_WREADY;
  wire Conn1_WVALID;
  wire [15:0]adc_streamer_m00_axis_TDATA;
  wire adc_streamer_m00_axis_TVALID;
  wire [0:0]aresetn2_1;
  wire [0:0]aresetn_1;
  wire [15:0]axis_decimator_0_m_axis_TDATA;
  wire axis_decimator_0_m_axis_TREADY;
  wire axis_decimator_0_m_axis_TVALID;
  wire [31:0]axis_dwidth_converter_0_M_AXIS_TDATA;
  wire axis_dwidth_converter_0_M_AXIS_TREADY;
  wire axis_dwidth_converter_0_M_AXIS_TVALID;
  wire [31:0]axis_ram_writer_0_M_AXI_AWADDR;
  wire [1:0]axis_ram_writer_0_M_AXI_AWBURST;
  wire [3:0]axis_ram_writer_0_M_AXI_AWCACHE;
  wire [5:0]axis_ram_writer_0_M_AXI_AWID;
  wire [3:0]axis_ram_writer_0_M_AXI_AWLEN;
  wire axis_ram_writer_0_M_AXI_AWREADY;
  wire [2:0]axis_ram_writer_0_M_AXI_AWSIZE;
  wire axis_ram_writer_0_M_AXI_AWVALID;
  wire axis_ram_writer_0_M_AXI_BREADY;
  wire axis_ram_writer_0_M_AXI_BVALID;
  wire [31:0]axis_ram_writer_0_M_AXI_WDATA;
  wire [5:0]axis_ram_writer_0_M_AXI_WID;
  wire axis_ram_writer_0_M_AXI_WLAST;
  wire axis_ram_writer_0_M_AXI_WREADY;
  wire [3:0]axis_ram_writer_0_M_AXI_WSTRB;
  wire axis_ram_writer_0_M_AXI_WVALID;
  wire [15:0]cfg_data_1;
  wire [31:0]ch_a_writer_sts_data;
  wire clk_sync_clk_out1;
  wire [31:0]ram_a_address_dout;

  assign Conn1_ARADDR = status_araddr[31:0];
  assign Conn1_ARVALID = status_arvalid;
  assign Conn1_AWADDR = status_awaddr[31:0];
  assign Conn1_AWVALID = status_awvalid;
  assign Conn1_BREADY = status_bready;
  assign Conn1_RREADY = status_rready;
  assign Conn1_WDATA = status_wdata[31:0];
  assign Conn1_WVALID = status_wvalid;
  assign M_AXI_awaddr[31:0] = axis_ram_writer_0_M_AXI_AWADDR;
  assign M_AXI_awburst[1:0] = axis_ram_writer_0_M_AXI_AWBURST;
  assign M_AXI_awcache[3:0] = axis_ram_writer_0_M_AXI_AWCACHE;
  assign M_AXI_awid[5:0] = axis_ram_writer_0_M_AXI_AWID;
  assign M_AXI_awlen[3:0] = axis_ram_writer_0_M_AXI_AWLEN;
  assign M_AXI_awsize[2:0] = axis_ram_writer_0_M_AXI_AWSIZE;
  assign M_AXI_awvalid = axis_ram_writer_0_M_AXI_AWVALID;
  assign M_AXI_bready = axis_ram_writer_0_M_AXI_BREADY;
  assign M_AXI_wdata[31:0] = axis_ram_writer_0_M_AXI_WDATA;
  assign M_AXI_wid[5:0] = axis_ram_writer_0_M_AXI_WID;
  assign M_AXI_wlast = axis_ram_writer_0_M_AXI_WLAST;
  assign M_AXI_wstrb[3:0] = axis_ram_writer_0_M_AXI_WSTRB;
  assign M_AXI_wvalid = axis_ram_writer_0_M_AXI_WVALID;
  assign adc_streamer_m00_axis_TDATA = adc_data_tdata[15:0];
  assign adc_streamer_m00_axis_TVALID = adc_data_tvalid;
  assign aresetn2_1 = aresetn[0];
  assign aresetn_1 = enable[0];
  assign axis_ram_writer_0_M_AXI_AWREADY = M_AXI_awready;
  assign axis_ram_writer_0_M_AXI_BVALID = M_AXI_bvalid;
  assign axis_ram_writer_0_M_AXI_WREADY = M_AXI_wready;
  assign cfg_data_1 = decimation[15:0];
  assign clk_sync_clk_out1 = aclk;
  assign status_arready = Conn1_ARREADY;
  assign status_awready = Conn1_AWREADY;
  assign status_bresp[1:0] = Conn1_BRESP;
  assign status_bvalid = Conn1_BVALID;
  assign status_rdata[31:0] = Conn1_RDATA;
  assign status_rresp[1:0] = Conn1_RRESP;
  assign status_rvalid = Conn1_RVALID;
  assign status_wready = Conn1_WREADY;
  system_axis_decimator_0_1 axis_decimator_0
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn_1),
        .cfg_data(cfg_data_1),
        .m_axis_tdata(axis_decimator_0_m_axis_TDATA),
        .m_axis_tready(axis_decimator_0_m_axis_TREADY),
        .m_axis_tvalid(axis_decimator_0_m_axis_TVALID),
        .s00_axis_tdata(adc_streamer_m00_axis_TDATA),
        .s00_axis_tvalid(adc_streamer_m00_axis_TVALID));
  system_axis_dwidth_converter_0_1 axis_dwidth_converter_0
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn_1),
        .m_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .m_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .m_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID),
        .s_axis_tdata(axis_decimator_0_m_axis_TDATA),
        .s_axis_tready(axis_decimator_0_m_axis_TREADY),
        .s_axis_tvalid(axis_decimator_0_m_axis_TVALID));
  system_ch_a_writer_0 ch_b_writer
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn_1),
        .cfg_data(ram_a_address_dout),
        .m_axi_awaddr(axis_ram_writer_0_M_AXI_AWADDR),
        .m_axi_awburst(axis_ram_writer_0_M_AXI_AWBURST),
        .m_axi_awcache(axis_ram_writer_0_M_AXI_AWCACHE),
        .m_axi_awid(axis_ram_writer_0_M_AXI_AWID),
        .m_axi_awlen(axis_ram_writer_0_M_AXI_AWLEN),
        .m_axi_awready(axis_ram_writer_0_M_AXI_AWREADY),
        .m_axi_awsize(axis_ram_writer_0_M_AXI_AWSIZE),
        .m_axi_awvalid(axis_ram_writer_0_M_AXI_AWVALID),
        .m_axi_bready(axis_ram_writer_0_M_AXI_BREADY),
        .m_axi_bvalid(axis_ram_writer_0_M_AXI_BVALID),
        .m_axi_wdata(axis_ram_writer_0_M_AXI_WDATA),
        .m_axi_wid(axis_ram_writer_0_M_AXI_WID),
        .m_axi_wlast(axis_ram_writer_0_M_AXI_WLAST),
        .m_axi_wready(axis_ram_writer_0_M_AXI_WREADY),
        .m_axi_wstrb(axis_ram_writer_0_M_AXI_WSTRB),
        .m_axi_wvalid(axis_ram_writer_0_M_AXI_WVALID),
        .s_axis_tdata(axis_dwidth_converter_0_M_AXIS_TDATA),
        .s_axis_tready(axis_dwidth_converter_0_M_AXIS_TREADY),
        .s_axis_tvalid(axis_dwidth_converter_0_M_AXIS_TVALID),
        .sts_data(ch_a_writer_sts_data));
  system_ram_a_address_0 ram_b_address
       (.dout(ram_a_address_dout));
  system_sts_a_channel_0 sts_b_channel
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn2_1),
        .s_axi_araddr(Conn1_ARADDR),
        .s_axi_arready(Conn1_ARREADY),
        .s_axi_arvalid(Conn1_ARVALID),
        .s_axi_awaddr(Conn1_AWADDR),
        .s_axi_awready(Conn1_AWREADY),
        .s_axi_awvalid(Conn1_AWVALID),
        .s_axi_bready(Conn1_BREADY),
        .s_axi_bresp(Conn1_BRESP),
        .s_axi_bvalid(Conn1_BVALID),
        .s_axi_rdata(Conn1_RDATA),
        .s_axi_rready(Conn1_RREADY),
        .s_axi_rresp(Conn1_RRESP),
        .s_axi_rvalid(Conn1_RVALID),
        .s_axi_wdata(Conn1_WDATA),
        .s_axi_wready(Conn1_WREADY),
        .s_axi_wvalid(Conn1_WVALID),
        .sts_data(ch_a_writer_sts_data));
endmodule

module clocking_system_imp_7QV4LN
   (IBUF_DS_N,
    IBUF_DS_P,
    clk_out1);
  input [0:0]IBUF_DS_N;
  input [0:0]IBUF_DS_P;
  output clk_out1;

  wire [0:0]adc_clk_n_i_1;
  wire [0:0]adc_clk_p_i_1;
  wire clk_wiz_0_clk_out1;
  wire [0:0]util_ds_buf_0_IBUF_OUT;

  assign adc_clk_n_i_1 = IBUF_DS_N[0];
  assign adc_clk_p_i_1 = IBUF_DS_P[0];
  assign clk_out1 = clk_wiz_0_clk_out1;
  system_clk_wiz_0_1 clk_wiz_0
       (.clk_in1(util_ds_buf_0_IBUF_OUT),
        .clk_out1(clk_wiz_0_clk_out1));
  system_util_ds_buf_0_1 util_ds_buf_0
       (.IBUF_DS_N(adc_clk_n_i_1),
        .IBUF_DS_P(adc_clk_p_i_1),
        .IBUF_OUT(util_ds_buf_0_IBUF_OUT));
endmodule

module config_settings_imp_18GRB1F
   (S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid,
    aclk,
    aresetn,
    decimation);
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;
  input aclk;
  input [0:0]aresetn;
  output [15:0]decimation;

  wire [31:0]cfg_0_cfg_data;
  wire clk_sync_clk_out1;
  wire [31:0]ps_0_axi_periph_M00_AXI_ARADDR;
  wire ps_0_axi_periph_M00_AXI_ARREADY;
  wire ps_0_axi_periph_M00_AXI_ARVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_AWADDR;
  wire ps_0_axi_periph_M00_AXI_AWREADY;
  wire ps_0_axi_periph_M00_AXI_AWVALID;
  wire ps_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]ps_0_axi_periph_M00_AXI_BRESP;
  wire ps_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_RDATA;
  wire ps_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]ps_0_axi_periph_M00_AXI_RRESP;
  wire ps_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_WDATA;
  wire ps_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]ps_0_axi_periph_M00_AXI_WSTRB;
  wire ps_0_axi_periph_M00_AXI_WVALID;
  wire [0:0]xlconstant_0_dout;
  wire [15:0]xlslice_0_Dout;

  assign S_AXI_arready = ps_0_axi_periph_M00_AXI_ARREADY;
  assign S_AXI_awready = ps_0_axi_periph_M00_AXI_AWREADY;
  assign S_AXI_bresp[1:0] = ps_0_axi_periph_M00_AXI_BRESP;
  assign S_AXI_bvalid = ps_0_axi_periph_M00_AXI_BVALID;
  assign S_AXI_rdata[31:0] = ps_0_axi_periph_M00_AXI_RDATA;
  assign S_AXI_rresp[1:0] = ps_0_axi_periph_M00_AXI_RRESP;
  assign S_AXI_rvalid = ps_0_axi_periph_M00_AXI_RVALID;
  assign S_AXI_wready = ps_0_axi_periph_M00_AXI_WREADY;
  assign clk_sync_clk_out1 = aclk;
  assign decimation[15:0] = xlslice_0_Dout;
  assign ps_0_axi_periph_M00_AXI_ARADDR = S_AXI_araddr[31:0];
  assign ps_0_axi_periph_M00_AXI_ARVALID = S_AXI_arvalid;
  assign ps_0_axi_periph_M00_AXI_AWADDR = S_AXI_awaddr[31:0];
  assign ps_0_axi_periph_M00_AXI_AWVALID = S_AXI_awvalid;
  assign ps_0_axi_periph_M00_AXI_BREADY = S_AXI_bready;
  assign ps_0_axi_periph_M00_AXI_RREADY = S_AXI_rready;
  assign ps_0_axi_periph_M00_AXI_WDATA = S_AXI_wdata[31:0];
  assign ps_0_axi_periph_M00_AXI_WSTRB = S_AXI_wstrb[3:0];
  assign ps_0_axi_periph_M00_AXI_WVALID = S_AXI_wvalid;
  assign xlconstant_0_dout = aresetn[0];
  system_cfg_0_0 cfg
       (.aclk(clk_sync_clk_out1),
        .aresetn(xlconstant_0_dout),
        .cfg_data(cfg_0_cfg_data),
        .s_axi_araddr(ps_0_axi_periph_M00_AXI_ARADDR),
        .s_axi_arready(ps_0_axi_periph_M00_AXI_ARREADY),
        .s_axi_arvalid(ps_0_axi_periph_M00_AXI_ARVALID),
        .s_axi_awaddr(ps_0_axi_periph_M00_AXI_AWADDR),
        .s_axi_awready(ps_0_axi_periph_M00_AXI_AWREADY),
        .s_axi_awvalid(ps_0_axi_periph_M00_AXI_AWVALID),
        .s_axi_bready(ps_0_axi_periph_M00_AXI_BREADY),
        .s_axi_bresp(ps_0_axi_periph_M00_AXI_BRESP),
        .s_axi_bvalid(ps_0_axi_periph_M00_AXI_BVALID),
        .s_axi_rdata(ps_0_axi_periph_M00_AXI_RDATA),
        .s_axi_rready(ps_0_axi_periph_M00_AXI_RREADY),
        .s_axi_rresp(ps_0_axi_periph_M00_AXI_RRESP),
        .s_axi_rvalid(ps_0_axi_periph_M00_AXI_RVALID),
        .s_axi_wdata(ps_0_axi_periph_M00_AXI_WDATA),
        .s_axi_wready(ps_0_axi_periph_M00_AXI_WREADY),
        .s_axi_wstrb(ps_0_axi_periph_M00_AXI_WSTRB),
        .s_axi_wvalid(ps_0_axi_periph_M00_AXI_WVALID));
  system_xlslice_0_0 xlslice_0
       (.Din(cfg_0_cfg_data),
        .Dout(xlslice_0_Dout));
endmodule

module daisy_chain_imp_1A80GWR
   (IBUF_DS_N,
    IBUF_DS_P,
    OBUF_DS_N,
    OBUF_DS_P);
  input [1:0]IBUF_DS_N;
  input [1:0]IBUF_DS_P;
  output [1:0]OBUF_DS_N;
  output [1:0]OBUF_DS_P;

  wire [1:0]daisy_chain_buffer_IBUF_OUT;
  wire [1:0]daisy_n_i_1;
  wire [1:0]daisy_p_i_1;
  wire [1:0]util_ds_buf_2_OBUF_DS_N;
  wire [1:0]util_ds_buf_2_OBUF_DS_P;

  assign OBUF_DS_N[1:0] = util_ds_buf_2_OBUF_DS_N;
  assign OBUF_DS_P[1:0] = util_ds_buf_2_OBUF_DS_P;
  assign daisy_n_i_1 = IBUF_DS_N[1:0];
  assign daisy_p_i_1 = IBUF_DS_P[1:0];
  system_util_ds_buf_1_0 daisy_chain_buffer
       (.IBUF_DS_N(daisy_n_i_1),
        .IBUF_DS_P(daisy_p_i_1),
        .IBUF_OUT(daisy_chain_buffer_IBUF_OUT));
  system_util_ds_buf_2_0 daisy_chain_output
       (.OBUF_DS_N(util_ds_buf_2_OBUF_DS_N),
        .OBUF_DS_P(util_ds_buf_2_OBUF_DS_P),
        .OBUF_IN(daisy_chain_buffer_IBUF_OUT));
endmodule

module gpio_interface_imp_1EU3LZ6
   (S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid,
    aclk,
    aresetn,
    enable,
    exp_data_n,
    exp_data_p);
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;
  input aclk;
  input [0:0]aresetn;
  output [0:0]enable;
  inout [7:0]exp_data_n;
  inout [7:0]exp_data_p;

  wire [7:0]Net;
  wire [7:0]Net1;
  wire [31:0]axi_cfg_register_0_cfg_data;
  wire clk_sync_clk_out1;
  wire [0:0]enable_prf_Dout;
  wire [7:0]gpio_n_upper_Dout;
  wire [31:0]processing_system_M04_AXI_ARADDR;
  wire processing_system_M04_AXI_ARREADY;
  wire processing_system_M04_AXI_ARVALID;
  wire [31:0]processing_system_M04_AXI_AWADDR;
  wire processing_system_M04_AXI_AWREADY;
  wire processing_system_M04_AXI_AWVALID;
  wire processing_system_M04_AXI_BREADY;
  wire [1:0]processing_system_M04_AXI_BRESP;
  wire processing_system_M04_AXI_BVALID;
  wire [31:0]processing_system_M04_AXI_RDATA;
  wire processing_system_M04_AXI_RREADY;
  wire [1:0]processing_system_M04_AXI_RRESP;
  wire processing_system_M04_AXI_RVALID;
  wire [31:0]processing_system_M04_AXI_WDATA;
  wire processing_system_M04_AXI_WREADY;
  wire [3:0]processing_system_M04_AXI_WSTRB;
  wire processing_system_M04_AXI_WVALID;
  wire trigger_1;
  wire [7:0]xlconcat_0_dout;
  wire [0:0]xlconstant_0_dout;
  wire [2:0]xlconstant_0_dout1;
  wire [22:0]xlslice_0_Dout;

  assign S_AXI_arready = processing_system_M04_AXI_ARREADY;
  assign S_AXI_awready = processing_system_M04_AXI_AWREADY;
  assign S_AXI_bresp[1:0] = processing_system_M04_AXI_BRESP;
  assign S_AXI_bvalid = processing_system_M04_AXI_BVALID;
  assign S_AXI_rdata[31:0] = processing_system_M04_AXI_RDATA;
  assign S_AXI_rresp[1:0] = processing_system_M04_AXI_RRESP;
  assign S_AXI_rvalid = processing_system_M04_AXI_RVALID;
  assign S_AXI_wready = processing_system_M04_AXI_WREADY;
  assign clk_sync_clk_out1 = aclk;
  assign enable[0] = enable_prf_Dout;
  assign processing_system_M04_AXI_ARADDR = S_AXI_araddr[31:0];
  assign processing_system_M04_AXI_ARVALID = S_AXI_arvalid;
  assign processing_system_M04_AXI_AWADDR = S_AXI_awaddr[31:0];
  assign processing_system_M04_AXI_AWVALID = S_AXI_awvalid;
  assign processing_system_M04_AXI_BREADY = S_AXI_bready;
  assign processing_system_M04_AXI_RREADY = S_AXI_rready;
  assign processing_system_M04_AXI_WDATA = S_AXI_wdata[31:0];
  assign processing_system_M04_AXI_WSTRB = S_AXI_wstrb[3:0];
  assign processing_system_M04_AXI_WVALID = S_AXI_wvalid;
  assign xlconstant_0_dout = aresetn[0];
  system_xlslice_0_4 divisor_slice
       (.Din(axi_cfg_register_0_cfg_data),
        .Dout(xlslice_0_Dout));
  system_xlslice_2_0 enable_RnM
       (.Din(axi_cfg_register_0_cfg_data),
        .Dout(enable_prf_Dout));
  system_exp_interface_0_0 exp_interface_n
       (.data(gpio_n_upper_Dout),
        .exp_data(exp_data_n[7:0]));
  system_exp_interface_0_1 exp_interface_p
       (.data(xlconcat_0_dout),
        .exp_data(exp_data_p[7:0]));
  system_frequency_divider_0_0 frequency_divider
       (.clk_in(clk_sync_clk_out1),
        .clk_out(trigger_1),
        .divisor(xlslice_0_Dout),
        .enable(enable_prf_Dout));
  system_gpio_n_lower_0 gpio_n
       (.Din(axi_cfg_register_0_cfg_data),
        .Dout(gpio_n_upper_Dout));
  system_axi_cfg_register_0_1 gpio_register
       (.aclk(clk_sync_clk_out1),
        .aresetn(xlconstant_0_dout),
        .cfg_data(axi_cfg_register_0_cfg_data),
        .s_axi_araddr(processing_system_M04_AXI_ARADDR),
        .s_axi_arready(processing_system_M04_AXI_ARREADY),
        .s_axi_arvalid(processing_system_M04_AXI_ARVALID),
        .s_axi_awaddr(processing_system_M04_AXI_AWADDR),
        .s_axi_awready(processing_system_M04_AXI_AWREADY),
        .s_axi_awvalid(processing_system_M04_AXI_AWVALID),
        .s_axi_bready(processing_system_M04_AXI_BREADY),
        .s_axi_bresp(processing_system_M04_AXI_BRESP),
        .s_axi_bvalid(processing_system_M04_AXI_BVALID),
        .s_axi_rdata(processing_system_M04_AXI_RDATA),
        .s_axi_rready(processing_system_M04_AXI_RREADY),
        .s_axi_rresp(processing_system_M04_AXI_RRESP),
        .s_axi_rvalid(processing_system_M04_AXI_RVALID),
        .s_axi_wdata(processing_system_M04_AXI_WDATA),
        .s_axi_wready(processing_system_M04_AXI_WREADY),
        .s_axi_wstrb(processing_system_M04_AXI_WSTRB),
        .s_axi_wvalid(processing_system_M04_AXI_WVALID));
  system_xlconcat_0_0 xlconcat_0
       (.In0(trigger_1),
        .In1(xlconstant_0_dout1),
        .In2(trigger_1),
        .In3(xlconstant_0_dout1),
        .dout(xlconcat_0_dout));
  system_xlconstant_0_0 zero_const
       (.dout(xlconstant_0_dout1));
endmodule

module m00_couplers_imp_1GIFH4O
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire m00_couplers_to_m00_couplers_ARREADY;
  wire m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire m00_couplers_to_m00_couplers_AWREADY;
  wire m00_couplers_to_m00_couplers_AWVALID;
  wire m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready;
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready;
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready;
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready;
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready;
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid;
endmodule

module m01_couplers_imp_5BE6LL
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire m01_couplers_to_m01_couplers_ARREADY;
  wire m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire m01_couplers_to_m01_couplers_AWREADY;
  wire m01_couplers_to_m01_couplers_AWVALID;
  wire m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire m01_couplers_to_m01_couplers_WREADY;
  wire m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wvalid = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready;
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready;
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready;
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready;
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready;
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid;
endmodule

module m02_couplers_imp_GC57VF
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input S_AXI_wvalid;

  wire [31:0]m02_couplers_to_m02_couplers_ARADDR;
  wire m02_couplers_to_m02_couplers_ARREADY;
  wire m02_couplers_to_m02_couplers_ARVALID;
  wire [31:0]m02_couplers_to_m02_couplers_AWADDR;
  wire m02_couplers_to_m02_couplers_AWREADY;
  wire m02_couplers_to_m02_couplers_AWVALID;
  wire m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire m02_couplers_to_m02_couplers_WREADY;
  wire m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wvalid = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready;
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready;
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready;
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready;
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready;
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid;
endmodule

module m03_couplers_imp_157OG3U
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m03_couplers_to_m03_couplers_ARADDR;
  wire m03_couplers_to_m03_couplers_ARREADY;
  wire m03_couplers_to_m03_couplers_ARVALID;
  wire [31:0]m03_couplers_to_m03_couplers_AWADDR;
  wire m03_couplers_to_m03_couplers_AWREADY;
  wire m03_couplers_to_m03_couplers_AWVALID;
  wire m03_couplers_to_m03_couplers_BREADY;
  wire [1:0]m03_couplers_to_m03_couplers_BRESP;
  wire m03_couplers_to_m03_couplers_BVALID;
  wire [31:0]m03_couplers_to_m03_couplers_RDATA;
  wire m03_couplers_to_m03_couplers_RREADY;
  wire [1:0]m03_couplers_to_m03_couplers_RRESP;
  wire m03_couplers_to_m03_couplers_RVALID;
  wire [31:0]m03_couplers_to_m03_couplers_WDATA;
  wire m03_couplers_to_m03_couplers_WREADY;
  wire [3:0]m03_couplers_to_m03_couplers_WSTRB;
  wire m03_couplers_to_m03_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m03_couplers_to_m03_couplers_ARADDR;
  assign M_AXI_arvalid = m03_couplers_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m03_couplers_to_m03_couplers_AWADDR;
  assign M_AXI_awvalid = m03_couplers_to_m03_couplers_AWVALID;
  assign M_AXI_bready = m03_couplers_to_m03_couplers_BREADY;
  assign M_AXI_rready = m03_couplers_to_m03_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m03_couplers_to_m03_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m03_couplers_to_m03_couplers_WSTRB;
  assign M_AXI_wvalid = m03_couplers_to_m03_couplers_WVALID;
  assign S_AXI_arready = m03_couplers_to_m03_couplers_ARREADY;
  assign S_AXI_awready = m03_couplers_to_m03_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m03_couplers_to_m03_couplers_BRESP;
  assign S_AXI_bvalid = m03_couplers_to_m03_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m03_couplers_to_m03_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m03_couplers_to_m03_couplers_RRESP;
  assign S_AXI_rvalid = m03_couplers_to_m03_couplers_RVALID;
  assign S_AXI_wready = m03_couplers_to_m03_couplers_WREADY;
  assign m03_couplers_to_m03_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m03_couplers_to_m03_couplers_ARREADY = M_AXI_arready;
  assign m03_couplers_to_m03_couplers_ARVALID = S_AXI_arvalid;
  assign m03_couplers_to_m03_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m03_couplers_to_m03_couplers_AWREADY = M_AXI_awready;
  assign m03_couplers_to_m03_couplers_AWVALID = S_AXI_awvalid;
  assign m03_couplers_to_m03_couplers_BREADY = S_AXI_bready;
  assign m03_couplers_to_m03_couplers_BRESP = M_AXI_bresp[1:0];
  assign m03_couplers_to_m03_couplers_BVALID = M_AXI_bvalid;
  assign m03_couplers_to_m03_couplers_RDATA = M_AXI_rdata[31:0];
  assign m03_couplers_to_m03_couplers_RREADY = S_AXI_rready;
  assign m03_couplers_to_m03_couplers_RRESP = M_AXI_rresp[1:0];
  assign m03_couplers_to_m03_couplers_RVALID = M_AXI_rvalid;
  assign m03_couplers_to_m03_couplers_WDATA = S_AXI_wdata[31:0];
  assign m03_couplers_to_m03_couplers_WREADY = M_AXI_wready;
  assign m03_couplers_to_m03_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m03_couplers_to_m03_couplers_WVALID = S_AXI_wvalid;
endmodule

module m04_couplers_imp_T97Z7J
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m04_couplers_to_m04_couplers_ARADDR;
  wire m04_couplers_to_m04_couplers_ARREADY;
  wire m04_couplers_to_m04_couplers_ARVALID;
  wire [31:0]m04_couplers_to_m04_couplers_AWADDR;
  wire m04_couplers_to_m04_couplers_AWREADY;
  wire m04_couplers_to_m04_couplers_AWVALID;
  wire m04_couplers_to_m04_couplers_BREADY;
  wire [1:0]m04_couplers_to_m04_couplers_BRESP;
  wire m04_couplers_to_m04_couplers_BVALID;
  wire [31:0]m04_couplers_to_m04_couplers_RDATA;
  wire m04_couplers_to_m04_couplers_RREADY;
  wire [1:0]m04_couplers_to_m04_couplers_RRESP;
  wire m04_couplers_to_m04_couplers_RVALID;
  wire [31:0]m04_couplers_to_m04_couplers_WDATA;
  wire m04_couplers_to_m04_couplers_WREADY;
  wire [3:0]m04_couplers_to_m04_couplers_WSTRB;
  wire m04_couplers_to_m04_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m04_couplers_to_m04_couplers_ARADDR;
  assign M_AXI_arvalid = m04_couplers_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m04_couplers_to_m04_couplers_AWADDR;
  assign M_AXI_awvalid = m04_couplers_to_m04_couplers_AWVALID;
  assign M_AXI_bready = m04_couplers_to_m04_couplers_BREADY;
  assign M_AXI_rready = m04_couplers_to_m04_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m04_couplers_to_m04_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m04_couplers_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid = m04_couplers_to_m04_couplers_WVALID;
  assign S_AXI_arready = m04_couplers_to_m04_couplers_ARREADY;
  assign S_AXI_awready = m04_couplers_to_m04_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m04_couplers_to_m04_couplers_BRESP;
  assign S_AXI_bvalid = m04_couplers_to_m04_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m04_couplers_to_m04_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m04_couplers_to_m04_couplers_RRESP;
  assign S_AXI_rvalid = m04_couplers_to_m04_couplers_RVALID;
  assign S_AXI_wready = m04_couplers_to_m04_couplers_WREADY;
  assign m04_couplers_to_m04_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m04_couplers_to_m04_couplers_ARREADY = M_AXI_arready;
  assign m04_couplers_to_m04_couplers_ARVALID = S_AXI_arvalid;
  assign m04_couplers_to_m04_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m04_couplers_to_m04_couplers_AWREADY = M_AXI_awready;
  assign m04_couplers_to_m04_couplers_AWVALID = S_AXI_awvalid;
  assign m04_couplers_to_m04_couplers_BREADY = S_AXI_bready;
  assign m04_couplers_to_m04_couplers_BRESP = M_AXI_bresp[1:0];
  assign m04_couplers_to_m04_couplers_BVALID = M_AXI_bvalid;
  assign m04_couplers_to_m04_couplers_RDATA = M_AXI_rdata[31:0];
  assign m04_couplers_to_m04_couplers_RREADY = S_AXI_rready;
  assign m04_couplers_to_m04_couplers_RRESP = M_AXI_rresp[1:0];
  assign m04_couplers_to_m04_couplers_RVALID = M_AXI_rvalid;
  assign m04_couplers_to_m04_couplers_WDATA = S_AXI_wdata[31:0];
  assign m04_couplers_to_m04_couplers_WREADY = M_AXI_wready;
  assign m04_couplers_to_m04_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m04_couplers_to_m04_couplers_WVALID = S_AXI_wvalid;
endmodule

module m05_couplers_imp_1J8PL66
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m05_couplers_to_m05_couplers_ARADDR;
  wire m05_couplers_to_m05_couplers_ARREADY;
  wire m05_couplers_to_m05_couplers_ARVALID;
  wire [31:0]m05_couplers_to_m05_couplers_AWADDR;
  wire m05_couplers_to_m05_couplers_AWREADY;
  wire m05_couplers_to_m05_couplers_AWVALID;
  wire m05_couplers_to_m05_couplers_BREADY;
  wire [1:0]m05_couplers_to_m05_couplers_BRESP;
  wire m05_couplers_to_m05_couplers_BVALID;
  wire [31:0]m05_couplers_to_m05_couplers_RDATA;
  wire m05_couplers_to_m05_couplers_RREADY;
  wire [1:0]m05_couplers_to_m05_couplers_RRESP;
  wire m05_couplers_to_m05_couplers_RVALID;
  wire [31:0]m05_couplers_to_m05_couplers_WDATA;
  wire m05_couplers_to_m05_couplers_WREADY;
  wire [3:0]m05_couplers_to_m05_couplers_WSTRB;
  wire m05_couplers_to_m05_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m05_couplers_to_m05_couplers_ARADDR;
  assign M_AXI_arvalid = m05_couplers_to_m05_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m05_couplers_to_m05_couplers_AWADDR;
  assign M_AXI_awvalid = m05_couplers_to_m05_couplers_AWVALID;
  assign M_AXI_bready = m05_couplers_to_m05_couplers_BREADY;
  assign M_AXI_rready = m05_couplers_to_m05_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m05_couplers_to_m05_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m05_couplers_to_m05_couplers_WSTRB;
  assign M_AXI_wvalid = m05_couplers_to_m05_couplers_WVALID;
  assign S_AXI_arready = m05_couplers_to_m05_couplers_ARREADY;
  assign S_AXI_awready = m05_couplers_to_m05_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m05_couplers_to_m05_couplers_BRESP;
  assign S_AXI_bvalid = m05_couplers_to_m05_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m05_couplers_to_m05_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m05_couplers_to_m05_couplers_RRESP;
  assign S_AXI_rvalid = m05_couplers_to_m05_couplers_RVALID;
  assign S_AXI_wready = m05_couplers_to_m05_couplers_WREADY;
  assign m05_couplers_to_m05_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m05_couplers_to_m05_couplers_ARREADY = M_AXI_arready;
  assign m05_couplers_to_m05_couplers_ARVALID = S_AXI_arvalid;
  assign m05_couplers_to_m05_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m05_couplers_to_m05_couplers_AWREADY = M_AXI_awready;
  assign m05_couplers_to_m05_couplers_AWVALID = S_AXI_awvalid;
  assign m05_couplers_to_m05_couplers_BREADY = S_AXI_bready;
  assign m05_couplers_to_m05_couplers_BRESP = M_AXI_bresp[1:0];
  assign m05_couplers_to_m05_couplers_BVALID = M_AXI_bvalid;
  assign m05_couplers_to_m05_couplers_RDATA = M_AXI_rdata[31:0];
  assign m05_couplers_to_m05_couplers_RREADY = S_AXI_rready;
  assign m05_couplers_to_m05_couplers_RRESP = M_AXI_rresp[1:0];
  assign m05_couplers_to_m05_couplers_RVALID = M_AXI_rvalid;
  assign m05_couplers_to_m05_couplers_WDATA = S_AXI_wdata[31:0];
  assign m05_couplers_to_m05_couplers_WREADY = M_AXI_wready;
  assign m05_couplers_to_m05_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m05_couplers_to_m05_couplers_WVALID = S_AXI_wvalid;
endmodule

module m06_couplers_imp_1U9GO7W
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [31:0]M_AXI_araddr;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]m06_couplers_to_m06_couplers_ARADDR;
  wire m06_couplers_to_m06_couplers_ARREADY;
  wire m06_couplers_to_m06_couplers_ARVALID;
  wire [31:0]m06_couplers_to_m06_couplers_AWADDR;
  wire m06_couplers_to_m06_couplers_AWREADY;
  wire m06_couplers_to_m06_couplers_AWVALID;
  wire m06_couplers_to_m06_couplers_BREADY;
  wire [1:0]m06_couplers_to_m06_couplers_BRESP;
  wire m06_couplers_to_m06_couplers_BVALID;
  wire [31:0]m06_couplers_to_m06_couplers_RDATA;
  wire m06_couplers_to_m06_couplers_RREADY;
  wire [1:0]m06_couplers_to_m06_couplers_RRESP;
  wire m06_couplers_to_m06_couplers_RVALID;
  wire [31:0]m06_couplers_to_m06_couplers_WDATA;
  wire m06_couplers_to_m06_couplers_WREADY;
  wire [3:0]m06_couplers_to_m06_couplers_WSTRB;
  wire m06_couplers_to_m06_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m06_couplers_to_m06_couplers_ARADDR;
  assign M_AXI_arvalid = m06_couplers_to_m06_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m06_couplers_to_m06_couplers_AWADDR;
  assign M_AXI_awvalid = m06_couplers_to_m06_couplers_AWVALID;
  assign M_AXI_bready = m06_couplers_to_m06_couplers_BREADY;
  assign M_AXI_rready = m06_couplers_to_m06_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m06_couplers_to_m06_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m06_couplers_to_m06_couplers_WSTRB;
  assign M_AXI_wvalid = m06_couplers_to_m06_couplers_WVALID;
  assign S_AXI_arready = m06_couplers_to_m06_couplers_ARREADY;
  assign S_AXI_awready = m06_couplers_to_m06_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m06_couplers_to_m06_couplers_BRESP;
  assign S_AXI_bvalid = m06_couplers_to_m06_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m06_couplers_to_m06_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m06_couplers_to_m06_couplers_RRESP;
  assign S_AXI_rvalid = m06_couplers_to_m06_couplers_RVALID;
  assign S_AXI_wready = m06_couplers_to_m06_couplers_WREADY;
  assign m06_couplers_to_m06_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m06_couplers_to_m06_couplers_ARREADY = M_AXI_arready;
  assign m06_couplers_to_m06_couplers_ARVALID = S_AXI_arvalid;
  assign m06_couplers_to_m06_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m06_couplers_to_m06_couplers_AWREADY = M_AXI_awready;
  assign m06_couplers_to_m06_couplers_AWVALID = S_AXI_awvalid;
  assign m06_couplers_to_m06_couplers_BREADY = S_AXI_bready;
  assign m06_couplers_to_m06_couplers_BRESP = M_AXI_bresp[1:0];
  assign m06_couplers_to_m06_couplers_BVALID = M_AXI_bvalid;
  assign m06_couplers_to_m06_couplers_RDATA = M_AXI_rdata[31:0];
  assign m06_couplers_to_m06_couplers_RREADY = S_AXI_rready;
  assign m06_couplers_to_m06_couplers_RRESP = M_AXI_rresp[1:0];
  assign m06_couplers_to_m06_couplers_RVALID = M_AXI_rvalid;
  assign m06_couplers_to_m06_couplers_WDATA = S_AXI_wdata[31:0];
  assign m06_couplers_to_m06_couplers_WREADY = M_AXI_wready;
  assign m06_couplers_to_m06_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m06_couplers_to_m06_couplers_WVALID = S_AXI_wvalid;
endmodule

module processing_system_imp_W26YM1
   (ARESETN,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wvalid,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wvalid,
    M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_AXI_araddr,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_AXI_araddr,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_AXI_araddr,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    S_AXI_HP0_awaddr,
    S_AXI_HP0_awburst,
    S_AXI_HP0_awcache,
    S_AXI_HP0_awid,
    S_AXI_HP0_awlen,
    S_AXI_HP0_awready,
    S_AXI_HP0_awsize,
    S_AXI_HP0_awvalid,
    S_AXI_HP0_bready,
    S_AXI_HP0_bvalid,
    S_AXI_HP0_wdata,
    S_AXI_HP0_wid,
    S_AXI_HP0_wlast,
    S_AXI_HP0_wready,
    S_AXI_HP0_wstrb,
    S_AXI_HP0_wvalid,
    S_AXI_HP1_awaddr,
    S_AXI_HP1_awburst,
    S_AXI_HP1_awcache,
    S_AXI_HP1_awid,
    S_AXI_HP1_awlen,
    S_AXI_HP1_awready,
    S_AXI_HP1_awsize,
    S_AXI_HP1_awvalid,
    S_AXI_HP1_bready,
    S_AXI_HP1_bvalid,
    S_AXI_HP1_wdata,
    S_AXI_HP1_wid,
    S_AXI_HP1_wlast,
    S_AXI_HP1_wready,
    S_AXI_HP1_wstrb,
    S_AXI_HP1_wvalid,
    slowest_sync_clk);
  output [0:0]ARESETN;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [31:0]M00_AXI_araddr;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  output [31:0]M01_AXI_araddr;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output M01_AXI_wvalid;
  output [31:0]M02_AXI_araddr;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output M02_AXI_wvalid;
  output [31:0]M03_AXI_araddr;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [31:0]M03_AXI_awaddr;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  output [31:0]M04_AXI_araddr;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [31:0]M04_AXI_awaddr;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  output [31:0]M05_AXI_araddr;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [31:0]M05_AXI_awaddr;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output M05_AXI_wvalid;
  output [31:0]M06_AXI_araddr;
  input M06_AXI_arready;
  output M06_AXI_arvalid;
  output [31:0]M06_AXI_awaddr;
  input M06_AXI_awready;
  output M06_AXI_awvalid;
  output M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output M06_AXI_wvalid;
  input [31:0]S_AXI_HP0_awaddr;
  input [1:0]S_AXI_HP0_awburst;
  input [3:0]S_AXI_HP0_awcache;
  input [5:0]S_AXI_HP0_awid;
  input [3:0]S_AXI_HP0_awlen;
  output S_AXI_HP0_awready;
  input [2:0]S_AXI_HP0_awsize;
  input S_AXI_HP0_awvalid;
  input S_AXI_HP0_bready;
  output S_AXI_HP0_bvalid;
  input [31:0]S_AXI_HP0_wdata;
  input [5:0]S_AXI_HP0_wid;
  input S_AXI_HP0_wlast;
  output S_AXI_HP0_wready;
  input [3:0]S_AXI_HP0_wstrb;
  input S_AXI_HP0_wvalid;
  input [31:0]S_AXI_HP1_awaddr;
  input [1:0]S_AXI_HP1_awburst;
  input [3:0]S_AXI_HP1_awcache;
  input [5:0]S_AXI_HP1_awid;
  input [3:0]S_AXI_HP1_awlen;
  output S_AXI_HP1_awready;
  input [2:0]S_AXI_HP1_awsize;
  input S_AXI_HP1_awvalid;
  input S_AXI_HP1_bready;
  output S_AXI_HP1_bvalid;
  input [31:0]S_AXI_HP1_wdata;
  input [5:0]S_AXI_HP1_wid;
  input S_AXI_HP1_wlast;
  output S_AXI_HP1_wready;
  input [3:0]S_AXI_HP1_wstrb;
  input S_AXI_HP1_wvalid;
  input slowest_sync_clk;

  wire [31:0]Conn1_ARADDR;
  wire Conn1_ARREADY;
  wire Conn1_ARVALID;
  wire [31:0]Conn1_AWADDR;
  wire Conn1_AWREADY;
  wire Conn1_AWVALID;
  wire Conn1_BREADY;
  wire [1:0]Conn1_BRESP;
  wire Conn1_BVALID;
  wire [31:0]Conn1_RDATA;
  wire Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire Conn1_RVALID;
  wire [31:0]Conn1_WDATA;
  wire Conn1_WREADY;
  wire [3:0]Conn1_WSTRB;
  wire Conn1_WVALID;
  wire [31:0]Conn2_ARADDR;
  wire Conn2_ARREADY;
  wire Conn2_ARVALID;
  wire [31:0]Conn2_AWADDR;
  wire Conn2_AWREADY;
  wire Conn2_AWVALID;
  wire Conn2_BREADY;
  wire [1:0]Conn2_BRESP;
  wire Conn2_BVALID;
  wire [31:0]Conn2_RDATA;
  wire Conn2_RREADY;
  wire [1:0]Conn2_RRESP;
  wire Conn2_RVALID;
  wire [31:0]Conn2_WDATA;
  wire Conn2_WREADY;
  wire [3:0]Conn2_WSTRB;
  wire Conn2_WVALID;
  wire [31:0]S_AXI_1_ARADDR;
  wire S_AXI_1_ARREADY;
  wire S_AXI_1_ARVALID;
  wire [31:0]S_AXI_1_AWADDR;
  wire S_AXI_1_AWREADY;
  wire S_AXI_1_AWVALID;
  wire S_AXI_1_BREADY;
  wire [1:0]S_AXI_1_BRESP;
  wire S_AXI_1_BVALID;
  wire [31:0]S_AXI_1_RDATA;
  wire S_AXI_1_RREADY;
  wire [1:0]S_AXI_1_RRESP;
  wire S_AXI_1_RVALID;
  wire [31:0]S_AXI_1_WDATA;
  wire S_AXI_1_WREADY;
  wire S_AXI_1_WVALID;
  wire [31:0]axis_ram_writer_0_M_AXI_AWADDR;
  wire [1:0]axis_ram_writer_0_M_AXI_AWBURST;
  wire [3:0]axis_ram_writer_0_M_AXI_AWCACHE;
  wire [5:0]axis_ram_writer_0_M_AXI_AWID;
  wire [3:0]axis_ram_writer_0_M_AXI_AWLEN;
  wire axis_ram_writer_0_M_AXI_AWREADY;
  wire [2:0]axis_ram_writer_0_M_AXI_AWSIZE;
  wire axis_ram_writer_0_M_AXI_AWVALID;
  wire axis_ram_writer_0_M_AXI_BREADY;
  wire axis_ram_writer_0_M_AXI_BVALID;
  wire [31:0]axis_ram_writer_0_M_AXI_WDATA;
  wire [5:0]axis_ram_writer_0_M_AXI_WID;
  wire axis_ram_writer_0_M_AXI_WLAST;
  wire axis_ram_writer_0_M_AXI_WREADY;
  wire [3:0]axis_ram_writer_0_M_AXI_WSTRB;
  wire axis_ram_writer_0_M_AXI_WVALID;
  wire [31:0]channel_b_M_AXI_AWADDR;
  wire [1:0]channel_b_M_AXI_AWBURST;
  wire [3:0]channel_b_M_AXI_AWCACHE;
  wire [5:0]channel_b_M_AXI_AWID;
  wire [3:0]channel_b_M_AXI_AWLEN;
  wire channel_b_M_AXI_AWREADY;
  wire [2:0]channel_b_M_AXI_AWSIZE;
  wire channel_b_M_AXI_AWVALID;
  wire channel_b_M_AXI_BREADY;
  wire channel_b_M_AXI_BVALID;
  wire [31:0]channel_b_M_AXI_WDATA;
  wire [5:0]channel_b_M_AXI_WID;
  wire channel_b_M_AXI_WLAST;
  wire channel_b_M_AXI_WREADY;
  wire [3:0]channel_b_M_AXI_WSTRB;
  wire channel_b_M_AXI_WVALID;
  wire clk_sync_clk_out1;
  wire [14:0]ps_0_DDR_ADDR;
  wire [2:0]ps_0_DDR_BA;
  wire ps_0_DDR_CAS_N;
  wire ps_0_DDR_CKE;
  wire ps_0_DDR_CK_N;
  wire ps_0_DDR_CK_P;
  wire ps_0_DDR_CS_N;
  wire [3:0]ps_0_DDR_DM;
  wire [31:0]ps_0_DDR_DQ;
  wire [3:0]ps_0_DDR_DQS_N;
  wire [3:0]ps_0_DDR_DQS_P;
  wire ps_0_DDR_ODT;
  wire ps_0_DDR_RAS_N;
  wire ps_0_DDR_RESET_N;
  wire ps_0_DDR_WE_N;
  wire ps_0_FCLK_RESET0_N;
  wire ps_0_FIXED_IO_DDR_VRN;
  wire ps_0_FIXED_IO_DDR_VRP;
  wire [53:0]ps_0_FIXED_IO_MIO;
  wire ps_0_FIXED_IO_PS_CLK;
  wire ps_0_FIXED_IO_PS_PORB;
  wire ps_0_FIXED_IO_PS_SRSTB;
  wire [31:0]ps_0_M_AXI_GP0_ARADDR;
  wire [1:0]ps_0_M_AXI_GP0_ARBURST;
  wire [3:0]ps_0_M_AXI_GP0_ARCACHE;
  wire [11:0]ps_0_M_AXI_GP0_ARID;
  wire [3:0]ps_0_M_AXI_GP0_ARLEN;
  wire [1:0]ps_0_M_AXI_GP0_ARLOCK;
  wire [2:0]ps_0_M_AXI_GP0_ARPROT;
  wire [3:0]ps_0_M_AXI_GP0_ARQOS;
  wire ps_0_M_AXI_GP0_ARREADY;
  wire [2:0]ps_0_M_AXI_GP0_ARSIZE;
  wire ps_0_M_AXI_GP0_ARVALID;
  wire [31:0]ps_0_M_AXI_GP0_AWADDR;
  wire [1:0]ps_0_M_AXI_GP0_AWBURST;
  wire [3:0]ps_0_M_AXI_GP0_AWCACHE;
  wire [11:0]ps_0_M_AXI_GP0_AWID;
  wire [3:0]ps_0_M_AXI_GP0_AWLEN;
  wire [1:0]ps_0_M_AXI_GP0_AWLOCK;
  wire [2:0]ps_0_M_AXI_GP0_AWPROT;
  wire [3:0]ps_0_M_AXI_GP0_AWQOS;
  wire ps_0_M_AXI_GP0_AWREADY;
  wire [2:0]ps_0_M_AXI_GP0_AWSIZE;
  wire ps_0_M_AXI_GP0_AWVALID;
  wire [11:0]ps_0_M_AXI_GP0_BID;
  wire ps_0_M_AXI_GP0_BREADY;
  wire [1:0]ps_0_M_AXI_GP0_BRESP;
  wire ps_0_M_AXI_GP0_BVALID;
  wire [31:0]ps_0_M_AXI_GP0_RDATA;
  wire [11:0]ps_0_M_AXI_GP0_RID;
  wire ps_0_M_AXI_GP0_RLAST;
  wire ps_0_M_AXI_GP0_RREADY;
  wire [1:0]ps_0_M_AXI_GP0_RRESP;
  wire ps_0_M_AXI_GP0_RVALID;
  wire [31:0]ps_0_M_AXI_GP0_WDATA;
  wire [11:0]ps_0_M_AXI_GP0_WID;
  wire ps_0_M_AXI_GP0_WLAST;
  wire ps_0_M_AXI_GP0_WREADY;
  wire [3:0]ps_0_M_AXI_GP0_WSTRB;
  wire ps_0_M_AXI_GP0_WVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_ARADDR;
  wire ps_0_axi_periph_M00_AXI_ARREADY;
  wire ps_0_axi_periph_M00_AXI_ARVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_AWADDR;
  wire ps_0_axi_periph_M00_AXI_AWREADY;
  wire ps_0_axi_periph_M00_AXI_AWVALID;
  wire ps_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]ps_0_axi_periph_M00_AXI_BRESP;
  wire ps_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_RDATA;
  wire ps_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]ps_0_axi_periph_M00_AXI_RRESP;
  wire ps_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_WDATA;
  wire ps_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]ps_0_axi_periph_M00_AXI_WSTRB;
  wire ps_0_axi_periph_M00_AXI_WVALID;
  wire [31:0]ps_axi_periph_M01_AXI_ARADDR;
  wire ps_axi_periph_M01_AXI_ARREADY;
  wire ps_axi_periph_M01_AXI_ARVALID;
  wire [31:0]ps_axi_periph_M01_AXI_AWADDR;
  wire ps_axi_periph_M01_AXI_AWREADY;
  wire ps_axi_periph_M01_AXI_AWVALID;
  wire ps_axi_periph_M01_AXI_BREADY;
  wire [1:0]ps_axi_periph_M01_AXI_BRESP;
  wire ps_axi_periph_M01_AXI_BVALID;
  wire [31:0]ps_axi_periph_M01_AXI_RDATA;
  wire ps_axi_periph_M01_AXI_RREADY;
  wire [1:0]ps_axi_periph_M01_AXI_RRESP;
  wire ps_axi_periph_M01_AXI_RVALID;
  wire [31:0]ps_axi_periph_M01_AXI_WDATA;
  wire ps_axi_periph_M01_AXI_WREADY;
  wire ps_axi_periph_M01_AXI_WVALID;
  wire [31:0]ps_axi_periph_M05_AXI_ARADDR;
  wire ps_axi_periph_M05_AXI_ARREADY;
  wire ps_axi_periph_M05_AXI_ARVALID;
  wire [31:0]ps_axi_periph_M05_AXI_AWADDR;
  wire ps_axi_periph_M05_AXI_AWREADY;
  wire ps_axi_periph_M05_AXI_AWVALID;
  wire ps_axi_periph_M05_AXI_BREADY;
  wire [1:0]ps_axi_periph_M05_AXI_BRESP;
  wire ps_axi_periph_M05_AXI_BVALID;
  wire [31:0]ps_axi_periph_M05_AXI_RDATA;
  wire ps_axi_periph_M05_AXI_RREADY;
  wire [1:0]ps_axi_periph_M05_AXI_RRESP;
  wire ps_axi_periph_M05_AXI_RVALID;
  wire [31:0]ps_axi_periph_M05_AXI_WDATA;
  wire ps_axi_periph_M05_AXI_WREADY;
  wire [3:0]ps_axi_periph_M05_AXI_WSTRB;
  wire ps_axi_periph_M05_AXI_WVALID;
  wire [31:0]ps_axi_periph_M06_AXI_ARADDR;
  wire ps_axi_periph_M06_AXI_ARREADY;
  wire ps_axi_periph_M06_AXI_ARVALID;
  wire [31:0]ps_axi_periph_M06_AXI_AWADDR;
  wire ps_axi_periph_M06_AXI_AWREADY;
  wire ps_axi_periph_M06_AXI_AWVALID;
  wire ps_axi_periph_M06_AXI_BREADY;
  wire [1:0]ps_axi_periph_M06_AXI_BRESP;
  wire ps_axi_periph_M06_AXI_BVALID;
  wire [31:0]ps_axi_periph_M06_AXI_RDATA;
  wire ps_axi_periph_M06_AXI_RREADY;
  wire [1:0]ps_axi_periph_M06_AXI_RRESP;
  wire ps_axi_periph_M06_AXI_RVALID;
  wire [31:0]ps_axi_periph_M06_AXI_WDATA;
  wire ps_axi_periph_M06_AXI_WREADY;
  wire [3:0]ps_axi_periph_M06_AXI_WSTRB;
  wire ps_axi_periph_M06_AXI_WVALID;
  wire [0:0]rst_0_interconnect_aresetn;
  wire [0:0]xlconstant_0_dout;

  assign ARESETN[0] = xlconstant_0_dout;
  assign Conn1_ARREADY = M03_AXI_arready;
  assign Conn1_AWREADY = M03_AXI_awready;
  assign Conn1_BRESP = M03_AXI_bresp[1:0];
  assign Conn1_BVALID = M03_AXI_bvalid;
  assign Conn1_RDATA = M03_AXI_rdata[31:0];
  assign Conn1_RRESP = M03_AXI_rresp[1:0];
  assign Conn1_RVALID = M03_AXI_rvalid;
  assign Conn1_WREADY = M03_AXI_wready;
  assign Conn2_ARREADY = M04_AXI_arready;
  assign Conn2_AWREADY = M04_AXI_awready;
  assign Conn2_BRESP = M04_AXI_bresp[1:0];
  assign Conn2_BVALID = M04_AXI_bvalid;
  assign Conn2_RDATA = M04_AXI_rdata[31:0];
  assign Conn2_RRESP = M04_AXI_rresp[1:0];
  assign Conn2_RVALID = M04_AXI_rvalid;
  assign Conn2_WREADY = M04_AXI_wready;
  assign M00_AXI_araddr[31:0] = ps_0_axi_periph_M00_AXI_ARADDR;
  assign M00_AXI_arvalid = ps_0_axi_periph_M00_AXI_ARVALID;
  assign M00_AXI_awaddr[31:0] = ps_0_axi_periph_M00_AXI_AWADDR;
  assign M00_AXI_awvalid = ps_0_axi_periph_M00_AXI_AWVALID;
  assign M00_AXI_bready = ps_0_axi_periph_M00_AXI_BREADY;
  assign M00_AXI_rready = ps_0_axi_periph_M00_AXI_RREADY;
  assign M00_AXI_wdata[31:0] = ps_0_axi_periph_M00_AXI_WDATA;
  assign M00_AXI_wstrb[3:0] = ps_0_axi_periph_M00_AXI_WSTRB;
  assign M00_AXI_wvalid = ps_0_axi_periph_M00_AXI_WVALID;
  assign M01_AXI_araddr[31:0] = ps_axi_periph_M01_AXI_ARADDR;
  assign M01_AXI_arvalid = ps_axi_periph_M01_AXI_ARVALID;
  assign M01_AXI_awaddr[31:0] = ps_axi_periph_M01_AXI_AWADDR;
  assign M01_AXI_awvalid = ps_axi_periph_M01_AXI_AWVALID;
  assign M01_AXI_bready = ps_axi_periph_M01_AXI_BREADY;
  assign M01_AXI_rready = ps_axi_periph_M01_AXI_RREADY;
  assign M01_AXI_wdata[31:0] = ps_axi_periph_M01_AXI_WDATA;
  assign M01_AXI_wvalid = ps_axi_periph_M01_AXI_WVALID;
  assign M02_AXI_araddr[31:0] = S_AXI_1_ARADDR;
  assign M02_AXI_arvalid = S_AXI_1_ARVALID;
  assign M02_AXI_awaddr[31:0] = S_AXI_1_AWADDR;
  assign M02_AXI_awvalid = S_AXI_1_AWVALID;
  assign M02_AXI_bready = S_AXI_1_BREADY;
  assign M02_AXI_rready = S_AXI_1_RREADY;
  assign M02_AXI_wdata[31:0] = S_AXI_1_WDATA;
  assign M02_AXI_wvalid = S_AXI_1_WVALID;
  assign M03_AXI_araddr[31:0] = Conn1_ARADDR;
  assign M03_AXI_arvalid = Conn1_ARVALID;
  assign M03_AXI_awaddr[31:0] = Conn1_AWADDR;
  assign M03_AXI_awvalid = Conn1_AWVALID;
  assign M03_AXI_bready = Conn1_BREADY;
  assign M03_AXI_rready = Conn1_RREADY;
  assign M03_AXI_wdata[31:0] = Conn1_WDATA;
  assign M03_AXI_wstrb[3:0] = Conn1_WSTRB;
  assign M03_AXI_wvalid = Conn1_WVALID;
  assign M04_AXI_araddr[31:0] = Conn2_ARADDR;
  assign M04_AXI_arvalid = Conn2_ARVALID;
  assign M04_AXI_awaddr[31:0] = Conn2_AWADDR;
  assign M04_AXI_awvalid = Conn2_AWVALID;
  assign M04_AXI_bready = Conn2_BREADY;
  assign M04_AXI_rready = Conn2_RREADY;
  assign M04_AXI_wdata[31:0] = Conn2_WDATA;
  assign M04_AXI_wstrb[3:0] = Conn2_WSTRB;
  assign M04_AXI_wvalid = Conn2_WVALID;
  assign M05_AXI_araddr[31:0] = ps_axi_periph_M05_AXI_ARADDR;
  assign M05_AXI_arvalid = ps_axi_periph_M05_AXI_ARVALID;
  assign M05_AXI_awaddr[31:0] = ps_axi_periph_M05_AXI_AWADDR;
  assign M05_AXI_awvalid = ps_axi_periph_M05_AXI_AWVALID;
  assign M05_AXI_bready = ps_axi_periph_M05_AXI_BREADY;
  assign M05_AXI_rready = ps_axi_periph_M05_AXI_RREADY;
  assign M05_AXI_wdata[31:0] = ps_axi_periph_M05_AXI_WDATA;
  assign M05_AXI_wstrb[3:0] = ps_axi_periph_M05_AXI_WSTRB;
  assign M05_AXI_wvalid = ps_axi_periph_M05_AXI_WVALID;
  assign M06_AXI_araddr[31:0] = ps_axi_periph_M06_AXI_ARADDR;
  assign M06_AXI_arvalid = ps_axi_periph_M06_AXI_ARVALID;
  assign M06_AXI_awaddr[31:0] = ps_axi_periph_M06_AXI_AWADDR;
  assign M06_AXI_awvalid = ps_axi_periph_M06_AXI_AWVALID;
  assign M06_AXI_bready = ps_axi_periph_M06_AXI_BREADY;
  assign M06_AXI_rready = ps_axi_periph_M06_AXI_RREADY;
  assign M06_AXI_wdata[31:0] = ps_axi_periph_M06_AXI_WDATA;
  assign M06_AXI_wstrb[3:0] = ps_axi_periph_M06_AXI_WSTRB;
  assign M06_AXI_wvalid = ps_axi_periph_M06_AXI_WVALID;
  assign S_AXI_1_ARREADY = M02_AXI_arready;
  assign S_AXI_1_AWREADY = M02_AXI_awready;
  assign S_AXI_1_BRESP = M02_AXI_bresp[1:0];
  assign S_AXI_1_BVALID = M02_AXI_bvalid;
  assign S_AXI_1_RDATA = M02_AXI_rdata[31:0];
  assign S_AXI_1_RRESP = M02_AXI_rresp[1:0];
  assign S_AXI_1_RVALID = M02_AXI_rvalid;
  assign S_AXI_1_WREADY = M02_AXI_wready;
  assign S_AXI_HP0_awready = axis_ram_writer_0_M_AXI_AWREADY;
  assign S_AXI_HP0_bvalid = axis_ram_writer_0_M_AXI_BVALID;
  assign S_AXI_HP0_wready = axis_ram_writer_0_M_AXI_WREADY;
  assign S_AXI_HP1_awready = channel_b_M_AXI_AWREADY;
  assign S_AXI_HP1_bvalid = channel_b_M_AXI_BVALID;
  assign S_AXI_HP1_wready = channel_b_M_AXI_WREADY;
  assign axis_ram_writer_0_M_AXI_AWADDR = S_AXI_HP0_awaddr[31:0];
  assign axis_ram_writer_0_M_AXI_AWBURST = S_AXI_HP0_awburst[1:0];
  assign axis_ram_writer_0_M_AXI_AWCACHE = S_AXI_HP0_awcache[3:0];
  assign axis_ram_writer_0_M_AXI_AWID = S_AXI_HP0_awid[5:0];
  assign axis_ram_writer_0_M_AXI_AWLEN = S_AXI_HP0_awlen[3:0];
  assign axis_ram_writer_0_M_AXI_AWSIZE = S_AXI_HP0_awsize[2:0];
  assign axis_ram_writer_0_M_AXI_AWVALID = S_AXI_HP0_awvalid;
  assign axis_ram_writer_0_M_AXI_BREADY = S_AXI_HP0_bready;
  assign axis_ram_writer_0_M_AXI_WDATA = S_AXI_HP0_wdata[31:0];
  assign axis_ram_writer_0_M_AXI_WID = S_AXI_HP0_wid[5:0];
  assign axis_ram_writer_0_M_AXI_WLAST = S_AXI_HP0_wlast;
  assign axis_ram_writer_0_M_AXI_WSTRB = S_AXI_HP0_wstrb[3:0];
  assign axis_ram_writer_0_M_AXI_WVALID = S_AXI_HP0_wvalid;
  assign channel_b_M_AXI_AWADDR = S_AXI_HP1_awaddr[31:0];
  assign channel_b_M_AXI_AWBURST = S_AXI_HP1_awburst[1:0];
  assign channel_b_M_AXI_AWCACHE = S_AXI_HP1_awcache[3:0];
  assign channel_b_M_AXI_AWID = S_AXI_HP1_awid[5:0];
  assign channel_b_M_AXI_AWLEN = S_AXI_HP1_awlen[3:0];
  assign channel_b_M_AXI_AWSIZE = S_AXI_HP1_awsize[2:0];
  assign channel_b_M_AXI_AWVALID = S_AXI_HP1_awvalid;
  assign channel_b_M_AXI_BREADY = S_AXI_HP1_bready;
  assign channel_b_M_AXI_WDATA = S_AXI_HP1_wdata[31:0];
  assign channel_b_M_AXI_WID = S_AXI_HP1_wid[5:0];
  assign channel_b_M_AXI_WLAST = S_AXI_HP1_wlast;
  assign channel_b_M_AXI_WSTRB = S_AXI_HP1_wstrb[3:0];
  assign channel_b_M_AXI_WVALID = S_AXI_HP1_wvalid;
  assign clk_sync_clk_out1 = slowest_sync_clk;
  assign ps_0_axi_periph_M00_AXI_ARREADY = M00_AXI_arready;
  assign ps_0_axi_periph_M00_AXI_AWREADY = M00_AXI_awready;
  assign ps_0_axi_periph_M00_AXI_BRESP = M00_AXI_bresp[1:0];
  assign ps_0_axi_periph_M00_AXI_BVALID = M00_AXI_bvalid;
  assign ps_0_axi_periph_M00_AXI_RDATA = M00_AXI_rdata[31:0];
  assign ps_0_axi_periph_M00_AXI_RRESP = M00_AXI_rresp[1:0];
  assign ps_0_axi_periph_M00_AXI_RVALID = M00_AXI_rvalid;
  assign ps_0_axi_periph_M00_AXI_WREADY = M00_AXI_wready;
  assign ps_axi_periph_M01_AXI_ARREADY = M01_AXI_arready;
  assign ps_axi_periph_M01_AXI_AWREADY = M01_AXI_awready;
  assign ps_axi_periph_M01_AXI_BRESP = M01_AXI_bresp[1:0];
  assign ps_axi_periph_M01_AXI_BVALID = M01_AXI_bvalid;
  assign ps_axi_periph_M01_AXI_RDATA = M01_AXI_rdata[31:0];
  assign ps_axi_periph_M01_AXI_RRESP = M01_AXI_rresp[1:0];
  assign ps_axi_periph_M01_AXI_RVALID = M01_AXI_rvalid;
  assign ps_axi_periph_M01_AXI_WREADY = M01_AXI_wready;
  assign ps_axi_periph_M05_AXI_ARREADY = M05_AXI_arready;
  assign ps_axi_periph_M05_AXI_AWREADY = M05_AXI_awready;
  assign ps_axi_periph_M05_AXI_BRESP = M05_AXI_bresp[1:0];
  assign ps_axi_periph_M05_AXI_BVALID = M05_AXI_bvalid;
  assign ps_axi_periph_M05_AXI_RDATA = M05_AXI_rdata[31:0];
  assign ps_axi_periph_M05_AXI_RRESP = M05_AXI_rresp[1:0];
  assign ps_axi_periph_M05_AXI_RVALID = M05_AXI_rvalid;
  assign ps_axi_periph_M05_AXI_WREADY = M05_AXI_wready;
  assign ps_axi_periph_M06_AXI_ARREADY = M06_AXI_arready;
  assign ps_axi_periph_M06_AXI_AWREADY = M06_AXI_awready;
  assign ps_axi_periph_M06_AXI_BRESP = M06_AXI_bresp[1:0];
  assign ps_axi_periph_M06_AXI_BVALID = M06_AXI_bvalid;
  assign ps_axi_periph_M06_AXI_RDATA = M06_AXI_rdata[31:0];
  assign ps_axi_periph_M06_AXI_RRESP = M06_AXI_rresp[1:0];
  assign ps_axi_periph_M06_AXI_RVALID = M06_AXI_rvalid;
  assign ps_axi_periph_M06_AXI_WREADY = M06_AXI_wready;
  system_ps_0_0 ps_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_RESET0_N(ps_0_FCLK_RESET0_N),
        .GPIO_I({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(clk_sync_clk_out1),
        .M_AXI_GP0_ARADDR(ps_0_M_AXI_GP0_ARADDR),
        .M_AXI_GP0_ARBURST(ps_0_M_AXI_GP0_ARBURST),
        .M_AXI_GP0_ARCACHE(ps_0_M_AXI_GP0_ARCACHE),
        .M_AXI_GP0_ARID(ps_0_M_AXI_GP0_ARID),
        .M_AXI_GP0_ARLEN(ps_0_M_AXI_GP0_ARLEN),
        .M_AXI_GP0_ARLOCK(ps_0_M_AXI_GP0_ARLOCK),
        .M_AXI_GP0_ARPROT(ps_0_M_AXI_GP0_ARPROT),
        .M_AXI_GP0_ARQOS(ps_0_M_AXI_GP0_ARQOS),
        .M_AXI_GP0_ARREADY(ps_0_M_AXI_GP0_ARREADY),
        .M_AXI_GP0_ARSIZE(ps_0_M_AXI_GP0_ARSIZE),
        .M_AXI_GP0_ARVALID(ps_0_M_AXI_GP0_ARVALID),
        .M_AXI_GP0_AWADDR(ps_0_M_AXI_GP0_AWADDR),
        .M_AXI_GP0_AWBURST(ps_0_M_AXI_GP0_AWBURST),
        .M_AXI_GP0_AWCACHE(ps_0_M_AXI_GP0_AWCACHE),
        .M_AXI_GP0_AWID(ps_0_M_AXI_GP0_AWID),
        .M_AXI_GP0_AWLEN(ps_0_M_AXI_GP0_AWLEN),
        .M_AXI_GP0_AWLOCK(ps_0_M_AXI_GP0_AWLOCK),
        .M_AXI_GP0_AWPROT(ps_0_M_AXI_GP0_AWPROT),
        .M_AXI_GP0_AWQOS(ps_0_M_AXI_GP0_AWQOS),
        .M_AXI_GP0_AWREADY(ps_0_M_AXI_GP0_AWREADY),
        .M_AXI_GP0_AWSIZE(ps_0_M_AXI_GP0_AWSIZE),
        .M_AXI_GP0_AWVALID(ps_0_M_AXI_GP0_AWVALID),
        .M_AXI_GP0_BID(ps_0_M_AXI_GP0_BID),
        .M_AXI_GP0_BREADY(ps_0_M_AXI_GP0_BREADY),
        .M_AXI_GP0_BRESP(ps_0_M_AXI_GP0_BRESP),
        .M_AXI_GP0_BVALID(ps_0_M_AXI_GP0_BVALID),
        .M_AXI_GP0_RDATA(ps_0_M_AXI_GP0_RDATA),
        .M_AXI_GP0_RID(ps_0_M_AXI_GP0_RID),
        .M_AXI_GP0_RLAST(ps_0_M_AXI_GP0_RLAST),
        .M_AXI_GP0_RREADY(ps_0_M_AXI_GP0_RREADY),
        .M_AXI_GP0_RRESP(ps_0_M_AXI_GP0_RRESP),
        .M_AXI_GP0_RVALID(ps_0_M_AXI_GP0_RVALID),
        .M_AXI_GP0_WDATA(ps_0_M_AXI_GP0_WDATA),
        .M_AXI_GP0_WID(ps_0_M_AXI_GP0_WID),
        .M_AXI_GP0_WLAST(ps_0_M_AXI_GP0_WLAST),
        .M_AXI_GP0_WREADY(ps_0_M_AXI_GP0_WREADY),
        .M_AXI_GP0_WSTRB(ps_0_M_AXI_GP0_WSTRB),
        .M_AXI_GP0_WVALID(ps_0_M_AXI_GP0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .SPI0_MISO_I(1'b0),
        .SPI0_MOSI_I(1'b0),
        .SPI0_SCLK_I(1'b0),
        .SPI0_SS_I(1'b0),
        .S_AXI_HP0_ACLK(clk_sync_clk_out1),
        .S_AXI_HP0_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARBURST({1'b0,1'b0}),
        .S_AXI_HP0_ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARLOCK({1'b0,1'b0}),
        .S_AXI_HP0_ARPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_HP0_ARVALID(1'b0),
        .S_AXI_HP0_AWADDR(axis_ram_writer_0_M_AXI_AWADDR),
        .S_AXI_HP0_AWBURST(axis_ram_writer_0_M_AXI_AWBURST),
        .S_AXI_HP0_AWCACHE(axis_ram_writer_0_M_AXI_AWCACHE),
        .S_AXI_HP0_AWID(axis_ram_writer_0_M_AXI_AWID),
        .S_AXI_HP0_AWLEN(axis_ram_writer_0_M_AXI_AWLEN),
        .S_AXI_HP0_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP0_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP0_AWREADY(axis_ram_writer_0_M_AXI_AWREADY),
        .S_AXI_HP0_AWSIZE(axis_ram_writer_0_M_AXI_AWSIZE),
        .S_AXI_HP0_AWVALID(axis_ram_writer_0_M_AXI_AWVALID),
        .S_AXI_HP0_BREADY(axis_ram_writer_0_M_AXI_BREADY),
        .S_AXI_HP0_BVALID(axis_ram_writer_0_M_AXI_BVALID),
        .S_AXI_HP0_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP0_RREADY(1'b0),
        .S_AXI_HP0_WDATA(axis_ram_writer_0_M_AXI_WDATA),
        .S_AXI_HP0_WID(axis_ram_writer_0_M_AXI_WID),
        .S_AXI_HP0_WLAST(axis_ram_writer_0_M_AXI_WLAST),
        .S_AXI_HP0_WREADY(axis_ram_writer_0_M_AXI_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP0_WSTRB(axis_ram_writer_0_M_AXI_WSTRB),
        .S_AXI_HP0_WVALID(axis_ram_writer_0_M_AXI_WVALID),
        .S_AXI_HP1_ACLK(clk_sync_clk_out1),
        .S_AXI_HP1_ARADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARBURST({1'b0,1'b0}),
        .S_AXI_HP1_ARCACHE({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARID({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARLEN({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARLOCK({1'b0,1'b0}),
        .S_AXI_HP1_ARPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARSIZE({1'b0,1'b0,1'b0}),
        .S_AXI_HP1_ARVALID(1'b0),
        .S_AXI_HP1_AWADDR(channel_b_M_AXI_AWADDR),
        .S_AXI_HP1_AWBURST(channel_b_M_AXI_AWBURST),
        .S_AXI_HP1_AWCACHE(channel_b_M_AXI_AWCACHE),
        .S_AXI_HP1_AWID(channel_b_M_AXI_AWID),
        .S_AXI_HP1_AWLEN(channel_b_M_AXI_AWLEN),
        .S_AXI_HP1_AWLOCK({1'b0,1'b0}),
        .S_AXI_HP1_AWPROT({1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWQOS({1'b0,1'b0,1'b0,1'b0}),
        .S_AXI_HP1_AWREADY(channel_b_M_AXI_AWREADY),
        .S_AXI_HP1_AWSIZE(channel_b_M_AXI_AWSIZE),
        .S_AXI_HP1_AWVALID(channel_b_M_AXI_AWVALID),
        .S_AXI_HP1_BREADY(channel_b_M_AXI_BREADY),
        .S_AXI_HP1_BVALID(channel_b_M_AXI_BVALID),
        .S_AXI_HP1_RDISSUECAP1_EN(1'b0),
        .S_AXI_HP1_RREADY(1'b0),
        .S_AXI_HP1_WDATA(channel_b_M_AXI_WDATA),
        .S_AXI_HP1_WID(channel_b_M_AXI_WID),
        .S_AXI_HP1_WLAST(channel_b_M_AXI_WLAST),
        .S_AXI_HP1_WREADY(channel_b_M_AXI_WREADY),
        .S_AXI_HP1_WRISSUECAP1_EN(1'b0),
        .S_AXI_HP1_WSTRB(channel_b_M_AXI_WSTRB),
        .S_AXI_HP1_WVALID(channel_b_M_AXI_WVALID),
        .USB0_VBUS_PWRFAULT(1'b0));
  system_ps_0_axi_periph_0 ps_axi_periph
       (.ACLK(clk_sync_clk_out1),
        .ARESETN(rst_0_interconnect_aresetn),
        .M00_ACLK(clk_sync_clk_out1),
        .M00_ARESETN(xlconstant_0_dout),
        .M00_AXI_araddr(ps_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(ps_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(ps_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(ps_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(ps_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(ps_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(ps_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(ps_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(ps_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(ps_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(ps_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(ps_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(ps_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(ps_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(ps_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(ps_0_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(ps_0_axi_periph_M00_AXI_WVALID),
        .M01_ACLK(clk_sync_clk_out1),
        .M01_ARESETN(xlconstant_0_dout),
        .M01_AXI_araddr(ps_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(ps_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(ps_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(ps_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(ps_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(ps_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(ps_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(ps_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(ps_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(ps_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(ps_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(ps_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(ps_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(ps_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(ps_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wvalid(ps_axi_periph_M01_AXI_WVALID),
        .M02_ACLK(clk_sync_clk_out1),
        .M02_ARESETN(xlconstant_0_dout),
        .M02_AXI_araddr(S_AXI_1_ARADDR),
        .M02_AXI_arready(S_AXI_1_ARREADY),
        .M02_AXI_arvalid(S_AXI_1_ARVALID),
        .M02_AXI_awaddr(S_AXI_1_AWADDR),
        .M02_AXI_awready(S_AXI_1_AWREADY),
        .M02_AXI_awvalid(S_AXI_1_AWVALID),
        .M02_AXI_bready(S_AXI_1_BREADY),
        .M02_AXI_bresp(S_AXI_1_BRESP),
        .M02_AXI_bvalid(S_AXI_1_BVALID),
        .M02_AXI_rdata(S_AXI_1_RDATA),
        .M02_AXI_rready(S_AXI_1_RREADY),
        .M02_AXI_rresp(S_AXI_1_RRESP),
        .M02_AXI_rvalid(S_AXI_1_RVALID),
        .M02_AXI_wdata(S_AXI_1_WDATA),
        .M02_AXI_wready(S_AXI_1_WREADY),
        .M02_AXI_wvalid(S_AXI_1_WVALID),
        .M03_ACLK(clk_sync_clk_out1),
        .M03_ARESETN(xlconstant_0_dout),
        .M03_AXI_araddr(Conn1_ARADDR),
        .M03_AXI_arready(Conn1_ARREADY),
        .M03_AXI_arvalid(Conn1_ARVALID),
        .M03_AXI_awaddr(Conn1_AWADDR),
        .M03_AXI_awready(Conn1_AWREADY),
        .M03_AXI_awvalid(Conn1_AWVALID),
        .M03_AXI_bready(Conn1_BREADY),
        .M03_AXI_bresp(Conn1_BRESP),
        .M03_AXI_bvalid(Conn1_BVALID),
        .M03_AXI_rdata(Conn1_RDATA),
        .M03_AXI_rready(Conn1_RREADY),
        .M03_AXI_rresp(Conn1_RRESP),
        .M03_AXI_rvalid(Conn1_RVALID),
        .M03_AXI_wdata(Conn1_WDATA),
        .M03_AXI_wready(Conn1_WREADY),
        .M03_AXI_wstrb(Conn1_WSTRB),
        .M03_AXI_wvalid(Conn1_WVALID),
        .M04_ACLK(clk_sync_clk_out1),
        .M04_ARESETN(xlconstant_0_dout),
        .M04_AXI_araddr(Conn2_ARADDR),
        .M04_AXI_arready(Conn2_ARREADY),
        .M04_AXI_arvalid(Conn2_ARVALID),
        .M04_AXI_awaddr(Conn2_AWADDR),
        .M04_AXI_awready(Conn2_AWREADY),
        .M04_AXI_awvalid(Conn2_AWVALID),
        .M04_AXI_bready(Conn2_BREADY),
        .M04_AXI_bresp(Conn2_BRESP),
        .M04_AXI_bvalid(Conn2_BVALID),
        .M04_AXI_rdata(Conn2_RDATA),
        .M04_AXI_rready(Conn2_RREADY),
        .M04_AXI_rresp(Conn2_RRESP),
        .M04_AXI_rvalid(Conn2_RVALID),
        .M04_AXI_wdata(Conn2_WDATA),
        .M04_AXI_wready(Conn2_WREADY),
        .M04_AXI_wstrb(Conn2_WSTRB),
        .M04_AXI_wvalid(Conn2_WVALID),
        .M05_ACLK(clk_sync_clk_out1),
        .M05_ARESETN(xlconstant_0_dout),
        .M05_AXI_araddr(ps_axi_periph_M05_AXI_ARADDR),
        .M05_AXI_arready(ps_axi_periph_M05_AXI_ARREADY),
        .M05_AXI_arvalid(ps_axi_periph_M05_AXI_ARVALID),
        .M05_AXI_awaddr(ps_axi_periph_M05_AXI_AWADDR),
        .M05_AXI_awready(ps_axi_periph_M05_AXI_AWREADY),
        .M05_AXI_awvalid(ps_axi_periph_M05_AXI_AWVALID),
        .M05_AXI_bready(ps_axi_periph_M05_AXI_BREADY),
        .M05_AXI_bresp(ps_axi_periph_M05_AXI_BRESP),
        .M05_AXI_bvalid(ps_axi_periph_M05_AXI_BVALID),
        .M05_AXI_rdata(ps_axi_periph_M05_AXI_RDATA),
        .M05_AXI_rready(ps_axi_periph_M05_AXI_RREADY),
        .M05_AXI_rresp(ps_axi_periph_M05_AXI_RRESP),
        .M05_AXI_rvalid(ps_axi_periph_M05_AXI_RVALID),
        .M05_AXI_wdata(ps_axi_periph_M05_AXI_WDATA),
        .M05_AXI_wready(ps_axi_periph_M05_AXI_WREADY),
        .M05_AXI_wstrb(ps_axi_periph_M05_AXI_WSTRB),
        .M05_AXI_wvalid(ps_axi_periph_M05_AXI_WVALID),
        .M06_ACLK(clk_sync_clk_out1),
        .M06_ARESETN(xlconstant_0_dout),
        .M06_AXI_araddr(ps_axi_periph_M06_AXI_ARADDR),
        .M06_AXI_arready(ps_axi_periph_M06_AXI_ARREADY),
        .M06_AXI_arvalid(ps_axi_periph_M06_AXI_ARVALID),
        .M06_AXI_awaddr(ps_axi_periph_M06_AXI_AWADDR),
        .M06_AXI_awready(ps_axi_periph_M06_AXI_AWREADY),
        .M06_AXI_awvalid(ps_axi_periph_M06_AXI_AWVALID),
        .M06_AXI_bready(ps_axi_periph_M06_AXI_BREADY),
        .M06_AXI_bresp(ps_axi_periph_M06_AXI_BRESP),
        .M06_AXI_bvalid(ps_axi_periph_M06_AXI_BVALID),
        .M06_AXI_rdata(ps_axi_periph_M06_AXI_RDATA),
        .M06_AXI_rready(ps_axi_periph_M06_AXI_RREADY),
        .M06_AXI_rresp(ps_axi_periph_M06_AXI_RRESP),
        .M06_AXI_rvalid(ps_axi_periph_M06_AXI_RVALID),
        .M06_AXI_wdata(ps_axi_periph_M06_AXI_WDATA),
        .M06_AXI_wready(ps_axi_periph_M06_AXI_WREADY),
        .M06_AXI_wstrb(ps_axi_periph_M06_AXI_WSTRB),
        .M06_AXI_wvalid(ps_axi_periph_M06_AXI_WVALID),
        .S00_ACLK(clk_sync_clk_out1),
        .S00_ARESETN(xlconstant_0_dout),
        .S00_AXI_araddr(ps_0_M_AXI_GP0_ARADDR),
        .S00_AXI_arburst(ps_0_M_AXI_GP0_ARBURST),
        .S00_AXI_arcache(ps_0_M_AXI_GP0_ARCACHE),
        .S00_AXI_arid(ps_0_M_AXI_GP0_ARID),
        .S00_AXI_arlen(ps_0_M_AXI_GP0_ARLEN),
        .S00_AXI_arlock(ps_0_M_AXI_GP0_ARLOCK),
        .S00_AXI_arprot(ps_0_M_AXI_GP0_ARPROT),
        .S00_AXI_arqos(ps_0_M_AXI_GP0_ARQOS),
        .S00_AXI_arready(ps_0_M_AXI_GP0_ARREADY),
        .S00_AXI_arsize(ps_0_M_AXI_GP0_ARSIZE),
        .S00_AXI_arvalid(ps_0_M_AXI_GP0_ARVALID),
        .S00_AXI_awaddr(ps_0_M_AXI_GP0_AWADDR),
        .S00_AXI_awburst(ps_0_M_AXI_GP0_AWBURST),
        .S00_AXI_awcache(ps_0_M_AXI_GP0_AWCACHE),
        .S00_AXI_awid(ps_0_M_AXI_GP0_AWID),
        .S00_AXI_awlen(ps_0_M_AXI_GP0_AWLEN),
        .S00_AXI_awlock(ps_0_M_AXI_GP0_AWLOCK),
        .S00_AXI_awprot(ps_0_M_AXI_GP0_AWPROT),
        .S00_AXI_awqos(ps_0_M_AXI_GP0_AWQOS),
        .S00_AXI_awready(ps_0_M_AXI_GP0_AWREADY),
        .S00_AXI_awsize(ps_0_M_AXI_GP0_AWSIZE),
        .S00_AXI_awvalid(ps_0_M_AXI_GP0_AWVALID),
        .S00_AXI_bid(ps_0_M_AXI_GP0_BID),
        .S00_AXI_bready(ps_0_M_AXI_GP0_BREADY),
        .S00_AXI_bresp(ps_0_M_AXI_GP0_BRESP),
        .S00_AXI_bvalid(ps_0_M_AXI_GP0_BVALID),
        .S00_AXI_rdata(ps_0_M_AXI_GP0_RDATA),
        .S00_AXI_rid(ps_0_M_AXI_GP0_RID),
        .S00_AXI_rlast(ps_0_M_AXI_GP0_RLAST),
        .S00_AXI_rready(ps_0_M_AXI_GP0_RREADY),
        .S00_AXI_rresp(ps_0_M_AXI_GP0_RRESP),
        .S00_AXI_rvalid(ps_0_M_AXI_GP0_RVALID),
        .S00_AXI_wdata(ps_0_M_AXI_GP0_WDATA),
        .S00_AXI_wid(ps_0_M_AXI_GP0_WID),
        .S00_AXI_wlast(ps_0_M_AXI_GP0_WLAST),
        .S00_AXI_wready(ps_0_M_AXI_GP0_WREADY),
        .S00_AXI_wstrb(ps_0_M_AXI_GP0_WSTRB),
        .S00_AXI_wvalid(ps_0_M_AXI_GP0_WVALID));
  system_rst_0_0 sys_reset_controller
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(ps_0_FCLK_RESET0_N),
        .interconnect_aresetn(rst_0_interconnect_aresetn),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(xlconstant_0_dout),
        .slowest_sync_clk(clk_sync_clk_out1));
endmodule

module receive_chain_imp_N0MRX5
   (M_AXI1_awaddr,
    M_AXI1_awburst,
    M_AXI1_awcache,
    M_AXI1_awid,
    M_AXI1_awlen,
    M_AXI1_awready,
    M_AXI1_awsize,
    M_AXI1_awvalid,
    M_AXI1_bready,
    M_AXI1_bvalid,
    M_AXI1_wdata,
    M_AXI1_wid,
    M_AXI1_wlast,
    M_AXI1_wready,
    M_AXI1_wstrb,
    M_AXI1_wvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bvalid,
    M_AXI_wdata,
    M_AXI_wid,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid,
    aclk,
    adc_csn,
    adc_dat_a,
    adc_dat_b,
    aresetn,
    ch_a_status_araddr,
    ch_a_status_arready,
    ch_a_status_arvalid,
    ch_a_status_awaddr,
    ch_a_status_awready,
    ch_a_status_awvalid,
    ch_a_status_bready,
    ch_a_status_bresp,
    ch_a_status_bvalid,
    ch_a_status_rdata,
    ch_a_status_rready,
    ch_a_status_rresp,
    ch_a_status_rvalid,
    ch_a_status_wdata,
    ch_a_status_wready,
    ch_a_status_wvalid,
    ch_b_status_araddr,
    ch_b_status_arready,
    ch_b_status_arvalid,
    ch_b_status_awaddr,
    ch_b_status_awready,
    ch_b_status_awvalid,
    ch_b_status_bready,
    ch_b_status_bresp,
    ch_b_status_bvalid,
    ch_b_status_rdata,
    ch_b_status_rready,
    ch_b_status_rresp,
    ch_b_status_rvalid,
    ch_b_status_wdata,
    ch_b_status_wready,
    ch_b_status_wvalid,
    decimation,
    enable,
    int_clk);
  output [31:0]M_AXI1_awaddr;
  output [1:0]M_AXI1_awburst;
  output [3:0]M_AXI1_awcache;
  output [5:0]M_AXI1_awid;
  output [3:0]M_AXI1_awlen;
  input M_AXI1_awready;
  output [2:0]M_AXI1_awsize;
  output M_AXI1_awvalid;
  output M_AXI1_bready;
  input M_AXI1_bvalid;
  output [31:0]M_AXI1_wdata;
  output [5:0]M_AXI1_wid;
  output M_AXI1_wlast;
  input M_AXI1_wready;
  output [3:0]M_AXI1_wstrb;
  output M_AXI1_wvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [5:0]M_AXI_awid;
  output [3:0]M_AXI_awlen;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input M_AXI_bvalid;
  output [31:0]M_AXI_wdata;
  output [5:0]M_AXI_wid;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input [31:0]S_AXI_araddr;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;
  output aclk;
  output adc_csn;
  input [13:0]adc_dat_a;
  input [13:0]adc_dat_b;
  input [0:0]aresetn;
  input [31:0]ch_a_status_araddr;
  output ch_a_status_arready;
  input ch_a_status_arvalid;
  input [31:0]ch_a_status_awaddr;
  output ch_a_status_awready;
  input ch_a_status_awvalid;
  input ch_a_status_bready;
  output [1:0]ch_a_status_bresp;
  output ch_a_status_bvalid;
  output [31:0]ch_a_status_rdata;
  input ch_a_status_rready;
  output [1:0]ch_a_status_rresp;
  output ch_a_status_rvalid;
  input [31:0]ch_a_status_wdata;
  output ch_a_status_wready;
  input ch_a_status_wvalid;
  input [31:0]ch_b_status_araddr;
  output ch_b_status_arready;
  input ch_b_status_arvalid;
  input [31:0]ch_b_status_awaddr;
  output ch_b_status_awready;
  input ch_b_status_awvalid;
  input ch_b_status_bready;
  output [1:0]ch_b_status_bresp;
  output ch_b_status_bvalid;
  output [31:0]ch_b_status_rdata;
  input ch_b_status_rready;
  output [1:0]ch_b_status_rresp;
  output ch_b_status_rvalid;
  input [31:0]ch_b_status_wdata;
  output ch_b_status_wready;
  input ch_b_status_wvalid;
  output [15:0]decimation;
  input [0:0]enable;
  input int_clk;

  wire [31:0]S_AXI_1_ARADDR;
  wire S_AXI_1_ARREADY;
  wire S_AXI_1_ARVALID;
  wire [31:0]S_AXI_1_AWADDR;
  wire S_AXI_1_AWREADY;
  wire S_AXI_1_AWVALID;
  wire S_AXI_1_BREADY;
  wire [1:0]S_AXI_1_BRESP;
  wire S_AXI_1_BVALID;
  wire [31:0]S_AXI_1_RDATA;
  wire S_AXI_1_RREADY;
  wire [1:0]S_AXI_1_RRESP;
  wire S_AXI_1_RVALID;
  wire [31:0]S_AXI_1_WDATA;
  wire S_AXI_1_WREADY;
  wire S_AXI_1_WVALID;
  wire [13:0]adc_dat_a_i_1;
  wire [13:0]adc_dat_b_i_1;
  wire [15:0]adc_streamer_m00_axis_TDATA;
  wire adc_streamer_m00_axis_TVALID;
  wire [0:0]aresetn2_1;
  wire [31:0]axis_ram_writer_0_M_AXI_AWADDR;
  wire [1:0]axis_ram_writer_0_M_AXI_AWBURST;
  wire [3:0]axis_ram_writer_0_M_AXI_AWCACHE;
  wire [5:0]axis_ram_writer_0_M_AXI_AWID;
  wire [3:0]axis_ram_writer_0_M_AXI_AWLEN;
  wire axis_ram_writer_0_M_AXI_AWREADY;
  wire [2:0]axis_ram_writer_0_M_AXI_AWSIZE;
  wire axis_ram_writer_0_M_AXI_AWVALID;
  wire axis_ram_writer_0_M_AXI_BREADY;
  wire axis_ram_writer_0_M_AXI_BVALID;
  wire [31:0]axis_ram_writer_0_M_AXI_WDATA;
  wire [5:0]axis_ram_writer_0_M_AXI_WID;
  wire axis_ram_writer_0_M_AXI_WLAST;
  wire axis_ram_writer_0_M_AXI_WREADY;
  wire [3:0]axis_ram_writer_0_M_AXI_WSTRB;
  wire axis_ram_writer_0_M_AXI_WVALID;
  wire axis_red_pitaya_adc_0_adc_csn;
  wire [31:0]channel_b_M_AXI_AWADDR;
  wire [1:0]channel_b_M_AXI_AWBURST;
  wire [3:0]channel_b_M_AXI_AWCACHE;
  wire [5:0]channel_b_M_AXI_AWID;
  wire [3:0]channel_b_M_AXI_AWLEN;
  wire channel_b_M_AXI_AWREADY;
  wire [2:0]channel_b_M_AXI_AWSIZE;
  wire channel_b_M_AXI_AWVALID;
  wire channel_b_M_AXI_BREADY;
  wire channel_b_M_AXI_BVALID;
  wire [31:0]channel_b_M_AXI_WDATA;
  wire [5:0]channel_b_M_AXI_WID;
  wire channel_b_M_AXI_WLAST;
  wire channel_b_M_AXI_WREADY;
  wire [3:0]channel_b_M_AXI_WSTRB;
  wire channel_b_M_AXI_WVALID;
  wire clk_sync_clk_out1;
  wire clk_wiz_0_clk_out1;
  wire [0:0]enable_1;
  wire [31:0]ps_0_axi_periph_M00_AXI_ARADDR;
  wire ps_0_axi_periph_M00_AXI_ARREADY;
  wire ps_0_axi_periph_M00_AXI_ARVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_AWADDR;
  wire ps_0_axi_periph_M00_AXI_AWREADY;
  wire ps_0_axi_periph_M00_AXI_AWVALID;
  wire ps_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]ps_0_axi_periph_M00_AXI_BRESP;
  wire ps_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_RDATA;
  wire ps_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]ps_0_axi_periph_M00_AXI_RRESP;
  wire ps_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_WDATA;
  wire ps_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]ps_0_axi_periph_M00_AXI_WSTRB;
  wire ps_0_axi_periph_M00_AXI_WVALID;
  wire [31:0]ps_axi_periph_M01_AXI_ARADDR;
  wire ps_axi_periph_M01_AXI_ARREADY;
  wire ps_axi_periph_M01_AXI_ARVALID;
  wire [31:0]ps_axi_periph_M01_AXI_AWADDR;
  wire ps_axi_periph_M01_AXI_AWREADY;
  wire ps_axi_periph_M01_AXI_AWVALID;
  wire ps_axi_periph_M01_AXI_BREADY;
  wire [1:0]ps_axi_periph_M01_AXI_BRESP;
  wire ps_axi_periph_M01_AXI_BVALID;
  wire [31:0]ps_axi_periph_M01_AXI_RDATA;
  wire ps_axi_periph_M01_AXI_RREADY;
  wire [1:0]ps_axi_periph_M01_AXI_RRESP;
  wire ps_axi_periph_M01_AXI_RVALID;
  wire [31:0]ps_axi_periph_M01_AXI_WDATA;
  wire ps_axi_periph_M01_AXI_WREADY;
  wire ps_axi_periph_M01_AXI_WVALID;
  wire [15:0]s00_axis_1_TDATA;
  wire s00_axis_1_TVALID;
  wire [15:0]xlslice_0_Dout;

  assign M_AXI1_awaddr[31:0] = channel_b_M_AXI_AWADDR;
  assign M_AXI1_awburst[1:0] = channel_b_M_AXI_AWBURST;
  assign M_AXI1_awcache[3:0] = channel_b_M_AXI_AWCACHE;
  assign M_AXI1_awid[5:0] = channel_b_M_AXI_AWID;
  assign M_AXI1_awlen[3:0] = channel_b_M_AXI_AWLEN;
  assign M_AXI1_awsize[2:0] = channel_b_M_AXI_AWSIZE;
  assign M_AXI1_awvalid = channel_b_M_AXI_AWVALID;
  assign M_AXI1_bready = channel_b_M_AXI_BREADY;
  assign M_AXI1_wdata[31:0] = channel_b_M_AXI_WDATA;
  assign M_AXI1_wid[5:0] = channel_b_M_AXI_WID;
  assign M_AXI1_wlast = channel_b_M_AXI_WLAST;
  assign M_AXI1_wstrb[3:0] = channel_b_M_AXI_WSTRB;
  assign M_AXI1_wvalid = channel_b_M_AXI_WVALID;
  assign M_AXI_awaddr[31:0] = axis_ram_writer_0_M_AXI_AWADDR;
  assign M_AXI_awburst[1:0] = axis_ram_writer_0_M_AXI_AWBURST;
  assign M_AXI_awcache[3:0] = axis_ram_writer_0_M_AXI_AWCACHE;
  assign M_AXI_awid[5:0] = axis_ram_writer_0_M_AXI_AWID;
  assign M_AXI_awlen[3:0] = axis_ram_writer_0_M_AXI_AWLEN;
  assign M_AXI_awsize[2:0] = axis_ram_writer_0_M_AXI_AWSIZE;
  assign M_AXI_awvalid = axis_ram_writer_0_M_AXI_AWVALID;
  assign M_AXI_bready = axis_ram_writer_0_M_AXI_BREADY;
  assign M_AXI_wdata[31:0] = axis_ram_writer_0_M_AXI_WDATA;
  assign M_AXI_wid[5:0] = axis_ram_writer_0_M_AXI_WID;
  assign M_AXI_wlast = axis_ram_writer_0_M_AXI_WLAST;
  assign M_AXI_wstrb[3:0] = axis_ram_writer_0_M_AXI_WSTRB;
  assign M_AXI_wvalid = axis_ram_writer_0_M_AXI_WVALID;
  assign S_AXI_1_ARADDR = ch_b_status_araddr[31:0];
  assign S_AXI_1_ARVALID = ch_b_status_arvalid;
  assign S_AXI_1_AWADDR = ch_b_status_awaddr[31:0];
  assign S_AXI_1_AWVALID = ch_b_status_awvalid;
  assign S_AXI_1_BREADY = ch_b_status_bready;
  assign S_AXI_1_RREADY = ch_b_status_rready;
  assign S_AXI_1_WDATA = ch_b_status_wdata[31:0];
  assign S_AXI_1_WVALID = ch_b_status_wvalid;
  assign S_AXI_arready = ps_0_axi_periph_M00_AXI_ARREADY;
  assign S_AXI_awready = ps_0_axi_periph_M00_AXI_AWREADY;
  assign S_AXI_bresp[1:0] = ps_0_axi_periph_M00_AXI_BRESP;
  assign S_AXI_bvalid = ps_0_axi_periph_M00_AXI_BVALID;
  assign S_AXI_rdata[31:0] = ps_0_axi_periph_M00_AXI_RDATA;
  assign S_AXI_rresp[1:0] = ps_0_axi_periph_M00_AXI_RRESP;
  assign S_AXI_rvalid = ps_0_axi_periph_M00_AXI_RVALID;
  assign S_AXI_wready = ps_0_axi_periph_M00_AXI_WREADY;
  assign aclk = clk_sync_clk_out1;
  assign adc_csn = axis_red_pitaya_adc_0_adc_csn;
  assign adc_dat_a_i_1 = adc_dat_a[13:0];
  assign adc_dat_b_i_1 = adc_dat_b[13:0];
  assign aresetn2_1 = aresetn[0];
  assign axis_ram_writer_0_M_AXI_AWREADY = M_AXI_awready;
  assign axis_ram_writer_0_M_AXI_BVALID = M_AXI_bvalid;
  assign axis_ram_writer_0_M_AXI_WREADY = M_AXI_wready;
  assign ch_a_status_arready = ps_axi_periph_M01_AXI_ARREADY;
  assign ch_a_status_awready = ps_axi_periph_M01_AXI_AWREADY;
  assign ch_a_status_bresp[1:0] = ps_axi_periph_M01_AXI_BRESP;
  assign ch_a_status_bvalid = ps_axi_periph_M01_AXI_BVALID;
  assign ch_a_status_rdata[31:0] = ps_axi_periph_M01_AXI_RDATA;
  assign ch_a_status_rresp[1:0] = ps_axi_periph_M01_AXI_RRESP;
  assign ch_a_status_rvalid = ps_axi_periph_M01_AXI_RVALID;
  assign ch_a_status_wready = ps_axi_periph_M01_AXI_WREADY;
  assign ch_b_status_arready = S_AXI_1_ARREADY;
  assign ch_b_status_awready = S_AXI_1_AWREADY;
  assign ch_b_status_bresp[1:0] = S_AXI_1_BRESP;
  assign ch_b_status_bvalid = S_AXI_1_BVALID;
  assign ch_b_status_rdata[31:0] = S_AXI_1_RDATA;
  assign ch_b_status_rresp[1:0] = S_AXI_1_RRESP;
  assign ch_b_status_rvalid = S_AXI_1_RVALID;
  assign ch_b_status_wready = S_AXI_1_WREADY;
  assign channel_b_M_AXI_AWREADY = M_AXI1_awready;
  assign channel_b_M_AXI_BVALID = M_AXI1_bvalid;
  assign channel_b_M_AXI_WREADY = M_AXI1_wready;
  assign clk_wiz_0_clk_out1 = int_clk;
  assign decimation[15:0] = xlslice_0_Dout;
  assign enable_1 = enable[0];
  assign ps_0_axi_periph_M00_AXI_ARADDR = S_AXI_araddr[31:0];
  assign ps_0_axi_periph_M00_AXI_ARVALID = S_AXI_arvalid;
  assign ps_0_axi_periph_M00_AXI_AWADDR = S_AXI_awaddr[31:0];
  assign ps_0_axi_periph_M00_AXI_AWVALID = S_AXI_awvalid;
  assign ps_0_axi_periph_M00_AXI_BREADY = S_AXI_bready;
  assign ps_0_axi_periph_M00_AXI_RREADY = S_AXI_rready;
  assign ps_0_axi_periph_M00_AXI_WDATA = S_AXI_wdata[31:0];
  assign ps_0_axi_periph_M00_AXI_WSTRB = S_AXI_wstrb[3:0];
  assign ps_0_axi_periph_M00_AXI_WVALID = S_AXI_wvalid;
  assign ps_axi_periph_M01_AXI_ARADDR = ch_a_status_araddr[31:0];
  assign ps_axi_periph_M01_AXI_ARVALID = ch_a_status_arvalid;
  assign ps_axi_periph_M01_AXI_AWADDR = ch_a_status_awaddr[31:0];
  assign ps_axi_periph_M01_AXI_AWVALID = ch_a_status_awvalid;
  assign ps_axi_periph_M01_AXI_BREADY = ch_a_status_bready;
  assign ps_axi_periph_M01_AXI_RREADY = ch_a_status_rready;
  assign ps_axi_periph_M01_AXI_WDATA = ch_a_status_wdata[31:0];
  assign ps_axi_periph_M01_AXI_WVALID = ch_a_status_wvalid;
  system_axis_red_pitaya_adc_0_0 adc_streamer
       (.adc_clk(clk_sync_clk_out1),
        .adc_csn(axis_red_pitaya_adc_0_adc_csn),
        .adc_dat_a(adc_dat_a_i_1),
        .adc_dat_b(adc_dat_b_i_1),
        .aresetn(aresetn2_1),
        .int_clk(clk_wiz_0_clk_out1),
        .m00_axis_tdata(adc_streamer_m00_axis_TDATA),
        .m00_axis_tvalid(adc_streamer_m00_axis_TVALID),
        .m01_axis_tdata(s00_axis_1_TDATA),
        .m01_axis_tvalid(s00_axis_1_TVALID));
  channel_a_imp_JYKOO2 channel_a
       (.M_AXI_awaddr(axis_ram_writer_0_M_AXI_AWADDR),
        .M_AXI_awburst(axis_ram_writer_0_M_AXI_AWBURST),
        .M_AXI_awcache(axis_ram_writer_0_M_AXI_AWCACHE),
        .M_AXI_awid(axis_ram_writer_0_M_AXI_AWID),
        .M_AXI_awlen(axis_ram_writer_0_M_AXI_AWLEN),
        .M_AXI_awready(axis_ram_writer_0_M_AXI_AWREADY),
        .M_AXI_awsize(axis_ram_writer_0_M_AXI_AWSIZE),
        .M_AXI_awvalid(axis_ram_writer_0_M_AXI_AWVALID),
        .M_AXI_bready(axis_ram_writer_0_M_AXI_BREADY),
        .M_AXI_bvalid(axis_ram_writer_0_M_AXI_BVALID),
        .M_AXI_wdata(axis_ram_writer_0_M_AXI_WDATA),
        .M_AXI_wid(axis_ram_writer_0_M_AXI_WID),
        .M_AXI_wlast(axis_ram_writer_0_M_AXI_WLAST),
        .M_AXI_wready(axis_ram_writer_0_M_AXI_WREADY),
        .M_AXI_wstrb(axis_ram_writer_0_M_AXI_WSTRB),
        .M_AXI_wvalid(axis_ram_writer_0_M_AXI_WVALID),
        .aclk(clk_sync_clk_out1),
        .adc_data_tdata(adc_streamer_m00_axis_TDATA),
        .adc_data_tvalid(adc_streamer_m00_axis_TVALID),
        .aresetn(aresetn2_1),
        .decimation(xlslice_0_Dout),
        .enable(enable_1),
        .status_araddr(ps_axi_periph_M01_AXI_ARADDR),
        .status_arready(ps_axi_periph_M01_AXI_ARREADY),
        .status_arvalid(ps_axi_periph_M01_AXI_ARVALID),
        .status_awaddr(ps_axi_periph_M01_AXI_AWADDR),
        .status_awready(ps_axi_periph_M01_AXI_AWREADY),
        .status_awvalid(ps_axi_periph_M01_AXI_AWVALID),
        .status_bready(ps_axi_periph_M01_AXI_BREADY),
        .status_bresp(ps_axi_periph_M01_AXI_BRESP),
        .status_bvalid(ps_axi_periph_M01_AXI_BVALID),
        .status_rdata(ps_axi_periph_M01_AXI_RDATA),
        .status_rready(ps_axi_periph_M01_AXI_RREADY),
        .status_rresp(ps_axi_periph_M01_AXI_RRESP),
        .status_rvalid(ps_axi_periph_M01_AXI_RVALID),
        .status_wdata(ps_axi_periph_M01_AXI_WDATA),
        .status_wready(ps_axi_periph_M01_AXI_WREADY),
        .status_wvalid(ps_axi_periph_M01_AXI_WVALID));
  channel_b_imp_WRMB9B channel_b
       (.M_AXI_awaddr(channel_b_M_AXI_AWADDR),
        .M_AXI_awburst(channel_b_M_AXI_AWBURST),
        .M_AXI_awcache(channel_b_M_AXI_AWCACHE),
        .M_AXI_awid(channel_b_M_AXI_AWID),
        .M_AXI_awlen(channel_b_M_AXI_AWLEN),
        .M_AXI_awready(channel_b_M_AXI_AWREADY),
        .M_AXI_awsize(channel_b_M_AXI_AWSIZE),
        .M_AXI_awvalid(channel_b_M_AXI_AWVALID),
        .M_AXI_bready(channel_b_M_AXI_BREADY),
        .M_AXI_bvalid(channel_b_M_AXI_BVALID),
        .M_AXI_wdata(channel_b_M_AXI_WDATA),
        .M_AXI_wid(channel_b_M_AXI_WID),
        .M_AXI_wlast(channel_b_M_AXI_WLAST),
        .M_AXI_wready(channel_b_M_AXI_WREADY),
        .M_AXI_wstrb(channel_b_M_AXI_WSTRB),
        .M_AXI_wvalid(channel_b_M_AXI_WVALID),
        .aclk(clk_sync_clk_out1),
        .adc_data_tdata(s00_axis_1_TDATA),
        .adc_data_tvalid(s00_axis_1_TVALID),
        .aresetn(aresetn2_1),
        .decimation(xlslice_0_Dout),
        .enable(enable_1),
        .status_araddr(S_AXI_1_ARADDR),
        .status_arready(S_AXI_1_ARREADY),
        .status_arvalid(S_AXI_1_ARVALID),
        .status_awaddr(S_AXI_1_AWADDR),
        .status_awready(S_AXI_1_AWREADY),
        .status_awvalid(S_AXI_1_AWVALID),
        .status_bready(S_AXI_1_BREADY),
        .status_bresp(S_AXI_1_BRESP),
        .status_bvalid(S_AXI_1_BVALID),
        .status_rdata(S_AXI_1_RDATA),
        .status_rready(S_AXI_1_RREADY),
        .status_rresp(S_AXI_1_RRESP),
        .status_rvalid(S_AXI_1_RVALID),
        .status_wdata(S_AXI_1_WDATA),
        .status_wready(S_AXI_1_WREADY),
        .status_wvalid(S_AXI_1_WVALID));
  config_settings_imp_18GRB1F config_settings
       (.S_AXI_araddr(ps_0_axi_periph_M00_AXI_ARADDR),
        .S_AXI_arready(ps_0_axi_periph_M00_AXI_ARREADY),
        .S_AXI_arvalid(ps_0_axi_periph_M00_AXI_ARVALID),
        .S_AXI_awaddr(ps_0_axi_periph_M00_AXI_AWADDR),
        .S_AXI_awready(ps_0_axi_periph_M00_AXI_AWREADY),
        .S_AXI_awvalid(ps_0_axi_periph_M00_AXI_AWVALID),
        .S_AXI_bready(ps_0_axi_periph_M00_AXI_BREADY),
        .S_AXI_bresp(ps_0_axi_periph_M00_AXI_BRESP),
        .S_AXI_bvalid(ps_0_axi_periph_M00_AXI_BVALID),
        .S_AXI_rdata(ps_0_axi_periph_M00_AXI_RDATA),
        .S_AXI_rready(ps_0_axi_periph_M00_AXI_RREADY),
        .S_AXI_rresp(ps_0_axi_periph_M00_AXI_RRESP),
        .S_AXI_rvalid(ps_0_axi_periph_M00_AXI_RVALID),
        .S_AXI_wdata(ps_0_axi_periph_M00_AXI_WDATA),
        .S_AXI_wready(ps_0_axi_periph_M00_AXI_WREADY),
        .S_AXI_wstrb(ps_0_axi_periph_M00_AXI_WSTRB),
        .S_AXI_wvalid(ps_0_axi_periph_M00_AXI_WVALID),
        .aclk(clk_sync_clk_out1),
        .aresetn(aresetn2_1),
        .decimation(xlslice_0_Dout));
endmodule

module s00_couplers_imp_12IK0DL
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input [0:0]M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input [0:0]S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire [0:0]S_ARESETN_1;
  wire [31:0]auto_pc_to_s00_couplers_ARADDR;
  wire [2:0]auto_pc_to_s00_couplers_ARPROT;
  wire auto_pc_to_s00_couplers_ARREADY;
  wire auto_pc_to_s00_couplers_ARVALID;
  wire [31:0]auto_pc_to_s00_couplers_AWADDR;
  wire [2:0]auto_pc_to_s00_couplers_AWPROT;
  wire auto_pc_to_s00_couplers_AWREADY;
  wire auto_pc_to_s00_couplers_AWVALID;
  wire auto_pc_to_s00_couplers_BREADY;
  wire [1:0]auto_pc_to_s00_couplers_BRESP;
  wire auto_pc_to_s00_couplers_BVALID;
  wire [31:0]auto_pc_to_s00_couplers_RDATA;
  wire auto_pc_to_s00_couplers_RREADY;
  wire [1:0]auto_pc_to_s00_couplers_RRESP;
  wire auto_pc_to_s00_couplers_RVALID;
  wire [31:0]auto_pc_to_s00_couplers_WDATA;
  wire auto_pc_to_s00_couplers_WREADY;
  wire [3:0]auto_pc_to_s00_couplers_WSTRB;
  wire auto_pc_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_auto_pc_ARADDR;
  wire [1:0]s00_couplers_to_auto_pc_ARBURST;
  wire [3:0]s00_couplers_to_auto_pc_ARCACHE;
  wire [11:0]s00_couplers_to_auto_pc_ARID;
  wire [3:0]s00_couplers_to_auto_pc_ARLEN;
  wire [1:0]s00_couplers_to_auto_pc_ARLOCK;
  wire [2:0]s00_couplers_to_auto_pc_ARPROT;
  wire [3:0]s00_couplers_to_auto_pc_ARQOS;
  wire s00_couplers_to_auto_pc_ARREADY;
  wire [2:0]s00_couplers_to_auto_pc_ARSIZE;
  wire s00_couplers_to_auto_pc_ARVALID;
  wire [31:0]s00_couplers_to_auto_pc_AWADDR;
  wire [1:0]s00_couplers_to_auto_pc_AWBURST;
  wire [3:0]s00_couplers_to_auto_pc_AWCACHE;
  wire [11:0]s00_couplers_to_auto_pc_AWID;
  wire [3:0]s00_couplers_to_auto_pc_AWLEN;
  wire [1:0]s00_couplers_to_auto_pc_AWLOCK;
  wire [2:0]s00_couplers_to_auto_pc_AWPROT;
  wire [3:0]s00_couplers_to_auto_pc_AWQOS;
  wire s00_couplers_to_auto_pc_AWREADY;
  wire [2:0]s00_couplers_to_auto_pc_AWSIZE;
  wire s00_couplers_to_auto_pc_AWVALID;
  wire [11:0]s00_couplers_to_auto_pc_BID;
  wire s00_couplers_to_auto_pc_BREADY;
  wire [1:0]s00_couplers_to_auto_pc_BRESP;
  wire s00_couplers_to_auto_pc_BVALID;
  wire [31:0]s00_couplers_to_auto_pc_RDATA;
  wire [11:0]s00_couplers_to_auto_pc_RID;
  wire s00_couplers_to_auto_pc_RLAST;
  wire s00_couplers_to_auto_pc_RREADY;
  wire [1:0]s00_couplers_to_auto_pc_RRESP;
  wire s00_couplers_to_auto_pc_RVALID;
  wire [31:0]s00_couplers_to_auto_pc_WDATA;
  wire [11:0]s00_couplers_to_auto_pc_WID;
  wire s00_couplers_to_auto_pc_WLAST;
  wire s00_couplers_to_auto_pc_WREADY;
  wire [3:0]s00_couplers_to_auto_pc_WSTRB;
  wire s00_couplers_to_auto_pc_WVALID;

  assign M_AXI_araddr[31:0] = auto_pc_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = auto_pc_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = auto_pc_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = auto_pc_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = auto_pc_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = auto_pc_to_s00_couplers_AWVALID;
  assign M_AXI_bready = auto_pc_to_s00_couplers_BREADY;
  assign M_AXI_rready = auto_pc_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = auto_pc_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = auto_pc_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = auto_pc_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN[0];
  assign S_AXI_arready = s00_couplers_to_auto_pc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_pc_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_auto_pc_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_pc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_pc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_pc_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_auto_pc_RID;
  assign S_AXI_rlast = s00_couplers_to_auto_pc_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_pc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_pc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_pc_WREADY;
  assign auto_pc_to_s00_couplers_ARREADY = M_AXI_arready;
  assign auto_pc_to_s00_couplers_AWREADY = M_AXI_awready;
  assign auto_pc_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign auto_pc_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign auto_pc_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign auto_pc_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign auto_pc_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign auto_pc_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_auto_pc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_pc_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_auto_pc_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_auto_pc_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_auto_pc_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_auto_pc_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_auto_pc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_pc_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_auto_pc_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_auto_pc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_pc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_pc_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_auto_pc_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_auto_pc_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_auto_pc_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_auto_pc_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_auto_pc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_pc_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_auto_pc_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_auto_pc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_pc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_pc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_pc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_pc_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_auto_pc_WLAST = S_AXI_wlast;
  assign s00_couplers_to_auto_pc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_pc_WVALID = S_AXI_wvalid;
  system_auto_pc_0 auto_pc
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(auto_pc_to_s00_couplers_ARADDR),
        .m_axi_arprot(auto_pc_to_s00_couplers_ARPROT),
        .m_axi_arready(auto_pc_to_s00_couplers_ARREADY),
        .m_axi_arvalid(auto_pc_to_s00_couplers_ARVALID),
        .m_axi_awaddr(auto_pc_to_s00_couplers_AWADDR),
        .m_axi_awprot(auto_pc_to_s00_couplers_AWPROT),
        .m_axi_awready(auto_pc_to_s00_couplers_AWREADY),
        .m_axi_awvalid(auto_pc_to_s00_couplers_AWVALID),
        .m_axi_bready(auto_pc_to_s00_couplers_BREADY),
        .m_axi_bresp(auto_pc_to_s00_couplers_BRESP),
        .m_axi_bvalid(auto_pc_to_s00_couplers_BVALID),
        .m_axi_rdata(auto_pc_to_s00_couplers_RDATA),
        .m_axi_rready(auto_pc_to_s00_couplers_RREADY),
        .m_axi_rresp(auto_pc_to_s00_couplers_RRESP),
        .m_axi_rvalid(auto_pc_to_s00_couplers_RVALID),
        .m_axi_wdata(auto_pc_to_s00_couplers_WDATA),
        .m_axi_wready(auto_pc_to_s00_couplers_WREADY),
        .m_axi_wstrb(auto_pc_to_s00_couplers_WSTRB),
        .m_axi_wvalid(auto_pc_to_s00_couplers_WVALID),
        .s_axi_araddr(s00_couplers_to_auto_pc_ARADDR),
        .s_axi_arburst(s00_couplers_to_auto_pc_ARBURST),
        .s_axi_arcache(s00_couplers_to_auto_pc_ARCACHE),
        .s_axi_arid(s00_couplers_to_auto_pc_ARID),
        .s_axi_arlen(s00_couplers_to_auto_pc_ARLEN),
        .s_axi_arlock(s00_couplers_to_auto_pc_ARLOCK),
        .s_axi_arprot(s00_couplers_to_auto_pc_ARPROT),
        .s_axi_arqos(s00_couplers_to_auto_pc_ARQOS),
        .s_axi_arready(s00_couplers_to_auto_pc_ARREADY),
        .s_axi_arsize(s00_couplers_to_auto_pc_ARSIZE),
        .s_axi_arvalid(s00_couplers_to_auto_pc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_pc_AWADDR),
        .s_axi_awburst(s00_couplers_to_auto_pc_AWBURST),
        .s_axi_awcache(s00_couplers_to_auto_pc_AWCACHE),
        .s_axi_awid(s00_couplers_to_auto_pc_AWID),
        .s_axi_awlen(s00_couplers_to_auto_pc_AWLEN),
        .s_axi_awlock(s00_couplers_to_auto_pc_AWLOCK),
        .s_axi_awprot(s00_couplers_to_auto_pc_AWPROT),
        .s_axi_awqos(s00_couplers_to_auto_pc_AWQOS),
        .s_axi_awready(s00_couplers_to_auto_pc_AWREADY),
        .s_axi_awsize(s00_couplers_to_auto_pc_AWSIZE),
        .s_axi_awvalid(s00_couplers_to_auto_pc_AWVALID),
        .s_axi_bid(s00_couplers_to_auto_pc_BID),
        .s_axi_bready(s00_couplers_to_auto_pc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_pc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_pc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_pc_RDATA),
        .s_axi_rid(s00_couplers_to_auto_pc_RID),
        .s_axi_rlast(s00_couplers_to_auto_pc_RLAST),
        .s_axi_rready(s00_couplers_to_auto_pc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_pc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_pc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_pc_WDATA),
        .s_axi_wid(s00_couplers_to_auto_pc_WID),
        .s_axi_wlast(s00_couplers_to_auto_pc_WLAST),
        .s_axi_wready(s00_couplers_to_auto_pc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_pc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_pc_WVALID));
endmodule

module signal_generator_imp_HADG47
   (aclk,
    aresetn,
    c_phase_inc_araddr,
    c_phase_inc_arready,
    c_phase_inc_arvalid,
    c_phase_inc_awaddr,
    c_phase_inc_awready,
    c_phase_inc_awvalid,
    c_phase_inc_bready,
    c_phase_inc_bresp,
    c_phase_inc_bvalid,
    c_phase_inc_rdata,
    c_phase_inc_rready,
    c_phase_inc_rresp,
    c_phase_inc_rvalid,
    c_phase_inc_wdata,
    c_phase_inc_wready,
    c_phase_inc_wstrb,
    c_phase_inc_wvalid,
    c_phase_off_araddr,
    c_phase_off_arready,
    c_phase_off_arvalid,
    c_phase_off_awaddr,
    c_phase_off_awready,
    c_phase_off_awvalid,
    c_phase_off_bready,
    c_phase_off_bresp,
    c_phase_off_bvalid,
    c_phase_off_rdata,
    c_phase_off_rready,
    c_phase_off_rresp,
    c_phase_off_rvalid,
    c_phase_off_wdata,
    c_phase_off_wready,
    c_phase_off_wstrb,
    c_phase_off_wvalid,
    dac_clk,
    dac_dat,
    dac_rst,
    dac_sel,
    dac_wrt,
    enable,
    r_phase_inc_araddr,
    r_phase_inc_arready,
    r_phase_inc_arvalid,
    r_phase_inc_awaddr,
    r_phase_inc_awready,
    r_phase_inc_awvalid,
    r_phase_inc_bready,
    r_phase_inc_bresp,
    r_phase_inc_bvalid,
    r_phase_inc_rdata,
    r_phase_inc_rready,
    r_phase_inc_rresp,
    r_phase_inc_rvalid,
    r_phase_inc_wdata,
    r_phase_inc_wready,
    r_phase_inc_wstrb,
    r_phase_inc_wvalid);
  input aclk;
  input [0:0]aresetn;
  input [31:0]c_phase_inc_araddr;
  output c_phase_inc_arready;
  input c_phase_inc_arvalid;
  input [31:0]c_phase_inc_awaddr;
  output c_phase_inc_awready;
  input c_phase_inc_awvalid;
  input c_phase_inc_bready;
  output [1:0]c_phase_inc_bresp;
  output c_phase_inc_bvalid;
  output [31:0]c_phase_inc_rdata;
  input c_phase_inc_rready;
  output [1:0]c_phase_inc_rresp;
  output c_phase_inc_rvalid;
  input [31:0]c_phase_inc_wdata;
  output c_phase_inc_wready;
  input [3:0]c_phase_inc_wstrb;
  input c_phase_inc_wvalid;
  input [31:0]c_phase_off_araddr;
  output c_phase_off_arready;
  input c_phase_off_arvalid;
  input [31:0]c_phase_off_awaddr;
  output c_phase_off_awready;
  input c_phase_off_awvalid;
  input c_phase_off_bready;
  output [1:0]c_phase_off_bresp;
  output c_phase_off_bvalid;
  output [31:0]c_phase_off_rdata;
  input c_phase_off_rready;
  output [1:0]c_phase_off_rresp;
  output c_phase_off_rvalid;
  input [31:0]c_phase_off_wdata;
  output c_phase_off_wready;
  input [3:0]c_phase_off_wstrb;
  input c_phase_off_wvalid;
  output dac_clk;
  output [13:0]dac_dat;
  output dac_rst;
  output dac_sel;
  output dac_wrt;
  input [0:0]enable;
  input [31:0]r_phase_inc_araddr;
  output r_phase_inc_arready;
  input r_phase_inc_arvalid;
  input [31:0]r_phase_inc_awaddr;
  output r_phase_inc_awready;
  input r_phase_inc_awvalid;
  input r_phase_inc_bready;
  output [1:0]r_phase_inc_bresp;
  output r_phase_inc_bvalid;
  output [31:0]r_phase_inc_rdata;
  input r_phase_inc_rready;
  output [1:0]r_phase_inc_rresp;
  output r_phase_inc_rvalid;
  input [31:0]r_phase_inc_wdata;
  output r_phase_inc_wready;
  input [3:0]r_phase_inc_wstrb;
  input r_phase_inc_wvalid;

  wire [31:0]Conn1_ARADDR;
  wire Conn1_ARREADY;
  wire Conn1_ARVALID;
  wire [31:0]Conn1_AWADDR;
  wire Conn1_AWREADY;
  wire Conn1_AWVALID;
  wire Conn1_BREADY;
  wire [1:0]Conn1_BRESP;
  wire Conn1_BVALID;
  wire [31:0]Conn1_RDATA;
  wire Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire Conn1_RVALID;
  wire [31:0]Conn1_WDATA;
  wire Conn1_WREADY;
  wire [3:0]Conn1_WSTRB;
  wire Conn1_WVALID;
  wire [31:0]S_AXI1_1_ARADDR;
  wire S_AXI1_1_ARREADY;
  wire S_AXI1_1_ARVALID;
  wire [31:0]S_AXI1_1_AWADDR;
  wire S_AXI1_1_AWREADY;
  wire S_AXI1_1_AWVALID;
  wire S_AXI1_1_BREADY;
  wire [1:0]S_AXI1_1_BRESP;
  wire S_AXI1_1_BVALID;
  wire [31:0]S_AXI1_1_RDATA;
  wire S_AXI1_1_RREADY;
  wire [1:0]S_AXI1_1_RRESP;
  wire S_AXI1_1_RVALID;
  wire [31:0]S_AXI1_1_WDATA;
  wire S_AXI1_1_WREADY;
  wire [3:0]S_AXI1_1_WSTRB;
  wire S_AXI1_1_WVALID;
  wire [31:0]S_AXI2_ARADDR;
  wire S_AXI2_ARREADY;
  wire S_AXI2_ARVALID;
  wire [31:0]S_AXI2_AWADDR;
  wire S_AXI2_AWREADY;
  wire S_AXI2_AWVALID;
  wire S_AXI2_BREADY;
  wire [1:0]S_AXI2_BRESP;
  wire S_AXI2_BVALID;
  wire [31:0]S_AXI2_RDATA;
  wire S_AXI2_RREADY;
  wire [1:0]S_AXI2_RRESP;
  wire S_AXI2_RVALID;
  wire [31:0]S_AXI2_WDATA;
  wire S_AXI2_WREADY;
  wire [3:0]S_AXI2_WSTRB;
  wire S_AXI2_WVALID;
  wire [0:0]aresetn1_1;
  wire [0:0]aresetn_1;
  wire [31:0]axi_cfg_register_0_cfg_data;
  wire [31:0]axis_constant_0_M_AXIS1_TDATA;
  wire axis_constant_0_M_AXIS1_TVALID;
  wire [31:0]axis_constant_0_M_AXIS_TDATA;
  wire axis_constant_0_M_AXIS_TVALID;
  wire axis_red_pitaya_dac_0_dac_clk;
  wire [13:0]axis_red_pitaya_dac_0_dac_dat;
  wire axis_red_pitaya_dac_0_dac_rst;
  wire axis_red_pitaya_dac_0_dac_sel;
  wire axis_red_pitaya_dac_0_dac_wrt;
  wire [31:0]canc_cfg_cfg_data;
  wire [31:0]canc_const_M_AXIS_TDATA;
  wire canc_const_M_AXIS_TVALID;
  wire [15:0]cancellation_signal_M_AXIS_DATA_TDATA;
  wire cancellation_signal_M_AXIS_DATA_TVALID;
  wire clk_sync_clk_out1;
  wire clk_wiz_1_clk_out1;
  wire clk_wiz_1_locked;
  wire [31:0]dac_signal_combiner_M_AXIS_TDATA;
  wire dac_signal_combiner_M_AXIS_TREADY;
  wire dac_signal_combiner_M_AXIS_TVALID;
  wire [15:0]reference_signal_M_AXIS_DATA_TDATA;
  wire reference_signal_M_AXIS_DATA_TVALID;
  wire [31:0]sig_gen_config_cfg_data;

  assign Conn1_ARADDR = r_phase_inc_araddr[31:0];
  assign Conn1_ARVALID = r_phase_inc_arvalid;
  assign Conn1_AWADDR = r_phase_inc_awaddr[31:0];
  assign Conn1_AWVALID = r_phase_inc_awvalid;
  assign Conn1_BREADY = r_phase_inc_bready;
  assign Conn1_RREADY = r_phase_inc_rready;
  assign Conn1_WDATA = r_phase_inc_wdata[31:0];
  assign Conn1_WSTRB = r_phase_inc_wstrb[3:0];
  assign Conn1_WVALID = r_phase_inc_wvalid;
  assign S_AXI1_1_ARADDR = c_phase_inc_araddr[31:0];
  assign S_AXI1_1_ARVALID = c_phase_inc_arvalid;
  assign S_AXI1_1_AWADDR = c_phase_inc_awaddr[31:0];
  assign S_AXI1_1_AWVALID = c_phase_inc_awvalid;
  assign S_AXI1_1_BREADY = c_phase_inc_bready;
  assign S_AXI1_1_RREADY = c_phase_inc_rready;
  assign S_AXI1_1_WDATA = c_phase_inc_wdata[31:0];
  assign S_AXI1_1_WSTRB = c_phase_inc_wstrb[3:0];
  assign S_AXI1_1_WVALID = c_phase_inc_wvalid;
  assign S_AXI2_ARADDR = c_phase_off_araddr[31:0];
  assign S_AXI2_ARVALID = c_phase_off_arvalid;
  assign S_AXI2_AWADDR = c_phase_off_awaddr[31:0];
  assign S_AXI2_AWVALID = c_phase_off_awvalid;
  assign S_AXI2_BREADY = c_phase_off_bready;
  assign S_AXI2_RREADY = c_phase_off_rready;
  assign S_AXI2_WDATA = c_phase_off_wdata[31:0];
  assign S_AXI2_WSTRB = c_phase_off_wstrb[3:0];
  assign S_AXI2_WVALID = c_phase_off_wvalid;
  assign aresetn1_1 = enable[0];
  assign aresetn_1 = aresetn[0];
  assign c_phase_inc_arready = S_AXI1_1_ARREADY;
  assign c_phase_inc_awready = S_AXI1_1_AWREADY;
  assign c_phase_inc_bresp[1:0] = S_AXI1_1_BRESP;
  assign c_phase_inc_bvalid = S_AXI1_1_BVALID;
  assign c_phase_inc_rdata[31:0] = S_AXI1_1_RDATA;
  assign c_phase_inc_rresp[1:0] = S_AXI1_1_RRESP;
  assign c_phase_inc_rvalid = S_AXI1_1_RVALID;
  assign c_phase_inc_wready = S_AXI1_1_WREADY;
  assign c_phase_off_arready = S_AXI2_ARREADY;
  assign c_phase_off_awready = S_AXI2_AWREADY;
  assign c_phase_off_bresp[1:0] = S_AXI2_BRESP;
  assign c_phase_off_bvalid = S_AXI2_BVALID;
  assign c_phase_off_rdata[31:0] = S_AXI2_RDATA;
  assign c_phase_off_rresp[1:0] = S_AXI2_RRESP;
  assign c_phase_off_rvalid = S_AXI2_RVALID;
  assign c_phase_off_wready = S_AXI2_WREADY;
  assign clk_sync_clk_out1 = aclk;
  assign dac_clk = axis_red_pitaya_dac_0_dac_clk;
  assign dac_dat[13:0] = axis_red_pitaya_dac_0_dac_dat;
  assign dac_rst = axis_red_pitaya_dac_0_dac_rst;
  assign dac_sel = axis_red_pitaya_dac_0_dac_sel;
  assign dac_wrt = axis_red_pitaya_dac_0_dac_wrt;
  assign r_phase_inc_arready = Conn1_ARREADY;
  assign r_phase_inc_awready = Conn1_AWREADY;
  assign r_phase_inc_bresp[1:0] = Conn1_BRESP;
  assign r_phase_inc_bvalid = Conn1_BVALID;
  assign r_phase_inc_rdata[31:0] = Conn1_RDATA;
  assign r_phase_inc_rresp[1:0] = Conn1_RRESP;
  assign r_phase_inc_rvalid = Conn1_RVALID;
  assign r_phase_inc_wready = Conn1_WREADY;
  system_axis_red_pitaya_dac_0_0 axis_red_pitaya_dac_0
       (.aclk(clk_sync_clk_out1),
        .dac_clk(axis_red_pitaya_dac_0_dac_clk),
        .dac_dat(axis_red_pitaya_dac_0_dac_dat),
        .dac_rst(axis_red_pitaya_dac_0_dac_rst),
        .dac_sel(axis_red_pitaya_dac_0_dac_sel),
        .dac_wrt(axis_red_pitaya_dac_0_dac_wrt),
        .ddr_clk(clk_wiz_1_clk_out1),
        .locked(clk_wiz_1_locked),
        .s_axis_tdata(dac_signal_combiner_M_AXIS_TDATA),
        .s_axis_tready(dac_signal_combiner_M_AXIS_TREADY),
        .s_axis_tvalid(dac_signal_combiner_M_AXIS_TVALID));
  system_axis_constant_1_0 canc_const
       (.aclk(clk_sync_clk_out1),
        .cfg_data(canc_cfg_cfg_data),
        .m_axis_tdata(canc_const_M_AXIS_TDATA),
        .m_axis_tvalid(canc_const_M_AXIS_TVALID));
  system_axi_cfg_register_0_2 canc_phase_inc
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn_1),
        .cfg_data(canc_cfg_cfg_data),
        .s_axi_araddr(S_AXI1_1_ARADDR),
        .s_axi_arready(S_AXI1_1_ARREADY),
        .s_axi_arvalid(S_AXI1_1_ARVALID),
        .s_axi_awaddr(S_AXI1_1_AWADDR),
        .s_axi_awready(S_AXI1_1_AWREADY),
        .s_axi_awvalid(S_AXI1_1_AWVALID),
        .s_axi_bready(S_AXI1_1_BREADY),
        .s_axi_bresp(S_AXI1_1_BRESP),
        .s_axi_bvalid(S_AXI1_1_BVALID),
        .s_axi_rdata(S_AXI1_1_RDATA),
        .s_axi_rready(S_AXI1_1_RREADY),
        .s_axi_rresp(S_AXI1_1_RRESP),
        .s_axi_rvalid(S_AXI1_1_RVALID),
        .s_axi_wdata(S_AXI1_1_WDATA),
        .s_axi_wready(S_AXI1_1_WREADY),
        .s_axi_wstrb(S_AXI1_1_WSTRB),
        .s_axi_wvalid(S_AXI1_1_WVALID));
  system_axi_cfg_register_0_3 canc_phase_offset
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn_1),
        .cfg_data(axi_cfg_register_0_cfg_data),
        .s_axi_araddr(S_AXI2_ARADDR),
        .s_axi_arready(S_AXI2_ARREADY),
        .s_axi_arvalid(S_AXI2_ARVALID),
        .s_axi_awaddr(S_AXI2_AWADDR),
        .s_axi_awready(S_AXI2_AWREADY),
        .s_axi_awvalid(S_AXI2_AWVALID),
        .s_axi_bready(S_AXI2_BREADY),
        .s_axi_bresp(S_AXI2_BRESP),
        .s_axi_bvalid(S_AXI2_BVALID),
        .s_axi_rdata(S_AXI2_RDATA),
        .s_axi_rready(S_AXI2_RREADY),
        .s_axi_rresp(S_AXI2_RRESP),
        .s_axi_rvalid(S_AXI2_RVALID),
        .s_axi_wdata(S_AXI2_WDATA),
        .s_axi_wready(S_AXI2_WREADY),
        .s_axi_wstrb(S_AXI2_WSTRB),
        .s_axi_wvalid(S_AXI2_WVALID));
  system_synthesizer_reference_0 cancellation_signal
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn1_1),
        .m_axis_data_tdata(cancellation_signal_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(cancellation_signal_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(canc_const_M_AXIS_TDATA),
        .s_axis_config_tvalid(canc_const_M_AXIS_TVALID),
        .s_axis_phase_tdata(axis_constant_0_M_AXIS1_TDATA),
        .s_axis_phase_tvalid(axis_constant_0_M_AXIS1_TVALID));
  system_clk_wiz_0_0 clk_wiz_1
       (.clk_in1(clk_sync_clk_out1),
        .clk_out1(clk_wiz_1_clk_out1),
        .locked(clk_wiz_1_locked));
  system_axis_combiner_0_0 dac_signal_combiner
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn1_1),
        .m_axis_tdata(dac_signal_combiner_M_AXIS_TDATA),
        .m_axis_tready(dac_signal_combiner_M_AXIS_TREADY),
        .m_axis_tvalid(dac_signal_combiner_M_AXIS_TVALID),
        .s_axis_tdata({cancellation_signal_M_AXIS_DATA_TDATA,reference_signal_M_AXIS_DATA_TDATA}),
        .s_axis_tvalid({cancellation_signal_M_AXIS_DATA_TVALID,reference_signal_M_AXIS_DATA_TVALID}));
  system_axis_constant_0_1 phase_const
       (.aclk(clk_sync_clk_out1),
        .cfg_data(axi_cfg_register_0_cfg_data),
        .m_axis_tdata(axis_constant_0_M_AXIS1_TDATA),
        .m_axis_tvalid(axis_constant_0_M_AXIS1_TVALID));
  system_axis_constant_0_0 ref_const
       (.aclk(clk_sync_clk_out1),
        .cfg_data(sig_gen_config_cfg_data),
        .m_axis_tdata(axis_constant_0_M_AXIS_TDATA),
        .m_axis_tvalid(axis_constant_0_M_AXIS_TVALID));
  system_axi_cfg_register_0_0 ref_phase_inc
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn_1),
        .cfg_data(sig_gen_config_cfg_data),
        .s_axi_araddr(Conn1_ARADDR),
        .s_axi_arready(Conn1_ARREADY),
        .s_axi_arvalid(Conn1_ARVALID),
        .s_axi_awaddr(Conn1_AWADDR),
        .s_axi_awready(Conn1_AWREADY),
        .s_axi_awvalid(Conn1_AWVALID),
        .s_axi_bready(Conn1_BREADY),
        .s_axi_bresp(Conn1_BRESP),
        .s_axi_bvalid(Conn1_BVALID),
        .s_axi_rdata(Conn1_RDATA),
        .s_axi_rready(Conn1_RREADY),
        .s_axi_rresp(Conn1_RRESP),
        .s_axi_rvalid(Conn1_RVALID),
        .s_axi_wdata(Conn1_WDATA),
        .s_axi_wready(Conn1_WREADY),
        .s_axi_wstrb(Conn1_WSTRB),
        .s_axi_wvalid(Conn1_WVALID));
  system_dds_compiler_0_0 reference_signal
       (.aclk(clk_sync_clk_out1),
        .aresetn(aresetn1_1),
        .m_axis_data_tdata(reference_signal_M_AXIS_DATA_TDATA),
        .m_axis_data_tvalid(reference_signal_M_AXIS_DATA_TVALID),
        .s_axis_config_tdata(axis_constant_0_M_AXIS_TDATA),
        .s_axis_config_tvalid(axis_constant_0_M_AXIS_TVALID));
endmodule

(* CORE_GENERATION_INFO = "system,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=system,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=59,numReposBlks=41,numNonXlnxBlks=19,numHierBlks=18,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=3,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "system.hwdef" *) 
module system
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    adc_clk_n_i,
    adc_clk_p_i,
    adc_csn_o,
    adc_dat_a_i,
    adc_dat_b_i,
    adc_enc_n_o,
    adc_enc_p_o,
    dac_clk_o,
    dac_dat_o,
    dac_pwm_o,
    dac_rst_o,
    dac_sel_o,
    dac_wrt_o,
    daisy_n_i,
    daisy_n_o,
    daisy_p_i,
    daisy_p_o,
    exp_n_tri_io,
    exp_p_tri_io,
    led_o);
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  input adc_clk_n_i;
  input adc_clk_p_i;
  output adc_csn_o;
  input [13:0]adc_dat_a_i;
  input [13:0]adc_dat_b_i;
  output adc_enc_n_o;
  output adc_enc_p_o;
  output dac_clk_o;
  output [13:0]dac_dat_o;
  output [3:0]dac_pwm_o;
  output dac_rst_o;
  output dac_sel_o;
  output dac_wrt_o;
  input [1:0]daisy_n_i;
  output [1:0]daisy_n_o;
  input [1:0]daisy_p_i;
  output [1:0]daisy_p_o;
  inout [7:0]exp_n_tri_io;
  inout [7:0]exp_p_tri_io;
  output [7:0]led_o;

  wire [7:0]Net;
  wire [7:0]Net1;
  wire [31:0]S_AXI2_1_ARADDR;
  wire S_AXI2_1_ARREADY;
  wire S_AXI2_1_ARVALID;
  wire [31:0]S_AXI2_1_AWADDR;
  wire S_AXI2_1_AWREADY;
  wire S_AXI2_1_AWVALID;
  wire S_AXI2_1_BREADY;
  wire [1:0]S_AXI2_1_BRESP;
  wire S_AXI2_1_BVALID;
  wire [31:0]S_AXI2_1_RDATA;
  wire S_AXI2_1_RREADY;
  wire [1:0]S_AXI2_1_RRESP;
  wire S_AXI2_1_RVALID;
  wire [31:0]S_AXI2_1_WDATA;
  wire S_AXI2_1_WREADY;
  wire [3:0]S_AXI2_1_WSTRB;
  wire S_AXI2_1_WVALID;
  wire [31:0]S_AXI_1_ARADDR;
  wire S_AXI_1_ARREADY;
  wire S_AXI_1_ARVALID;
  wire [31:0]S_AXI_1_AWADDR;
  wire S_AXI_1_AWREADY;
  wire S_AXI_1_AWVALID;
  wire S_AXI_1_BREADY;
  wire [1:0]S_AXI_1_BRESP;
  wire S_AXI_1_BVALID;
  wire [31:0]S_AXI_1_RDATA;
  wire S_AXI_1_RREADY;
  wire [1:0]S_AXI_1_RRESP;
  wire S_AXI_1_RVALID;
  wire [31:0]S_AXI_1_WDATA;
  wire S_AXI_1_WREADY;
  wire S_AXI_1_WVALID;
  wire [31:0]S_AXI_2_ARADDR;
  wire S_AXI_2_ARREADY;
  wire S_AXI_2_ARVALID;
  wire [31:0]S_AXI_2_AWADDR;
  wire S_AXI_2_AWREADY;
  wire S_AXI_2_AWVALID;
  wire S_AXI_2_BREADY;
  wire [1:0]S_AXI_2_BRESP;
  wire S_AXI_2_BVALID;
  wire [31:0]S_AXI_2_RDATA;
  wire S_AXI_2_RREADY;
  wire [1:0]S_AXI_2_RRESP;
  wire S_AXI_2_RVALID;
  wire [31:0]S_AXI_2_WDATA;
  wire S_AXI_2_WREADY;
  wire [3:0]S_AXI_2_WSTRB;
  wire S_AXI_2_WVALID;
  wire adc_clk_n_i_1;
  wire adc_clk_p_i_1;
  wire [13:0]adc_dat_a_i_1;
  wire [13:0]adc_dat_b_i_1;
  wire [31:0]axis_ram_writer_0_M_AXI_AWADDR;
  wire [1:0]axis_ram_writer_0_M_AXI_AWBURST;
  wire [3:0]axis_ram_writer_0_M_AXI_AWCACHE;
  wire [5:0]axis_ram_writer_0_M_AXI_AWID;
  wire [3:0]axis_ram_writer_0_M_AXI_AWLEN;
  wire axis_ram_writer_0_M_AXI_AWREADY;
  wire [2:0]axis_ram_writer_0_M_AXI_AWSIZE;
  wire axis_ram_writer_0_M_AXI_AWVALID;
  wire axis_ram_writer_0_M_AXI_BREADY;
  wire axis_ram_writer_0_M_AXI_BVALID;
  wire [31:0]axis_ram_writer_0_M_AXI_WDATA;
  wire [5:0]axis_ram_writer_0_M_AXI_WID;
  wire axis_ram_writer_0_M_AXI_WLAST;
  wire axis_ram_writer_0_M_AXI_WREADY;
  wire [3:0]axis_ram_writer_0_M_AXI_WSTRB;
  wire axis_ram_writer_0_M_AXI_WVALID;
  wire axis_red_pitaya_adc_0_adc_csn;
  wire axis_red_pitaya_dac_0_dac_clk;
  wire [13:0]axis_red_pitaya_dac_0_dac_dat;
  wire axis_red_pitaya_dac_0_dac_rst;
  wire axis_red_pitaya_dac_0_dac_sel;
  wire axis_red_pitaya_dac_0_dac_wrt;
  wire [31:0]channel_b_M_AXI_AWADDR;
  wire [1:0]channel_b_M_AXI_AWBURST;
  wire [3:0]channel_b_M_AXI_AWCACHE;
  wire [5:0]channel_b_M_AXI_AWID;
  wire [3:0]channel_b_M_AXI_AWLEN;
  wire channel_b_M_AXI_AWREADY;
  wire [2:0]channel_b_M_AXI_AWSIZE;
  wire channel_b_M_AXI_AWVALID;
  wire channel_b_M_AXI_BREADY;
  wire channel_b_M_AXI_BVALID;
  wire [31:0]channel_b_M_AXI_WDATA;
  wire [5:0]channel_b_M_AXI_WID;
  wire channel_b_M_AXI_WLAST;
  wire channel_b_M_AXI_WREADY;
  wire [3:0]channel_b_M_AXI_WSTRB;
  wire channel_b_M_AXI_WVALID;
  wire clk_sync_clk_out1;
  wire clk_wiz_0_clk_out1;
  wire [1:0]daisy_n_i_1;
  wire [1:0]daisy_p_i_1;
  wire [0:0]enable_1;
  wire [31:0]processing_system_M03_AXI_ARADDR;
  wire processing_system_M03_AXI_ARREADY;
  wire processing_system_M03_AXI_ARVALID;
  wire [31:0]processing_system_M03_AXI_AWADDR;
  wire processing_system_M03_AXI_AWREADY;
  wire processing_system_M03_AXI_AWVALID;
  wire processing_system_M03_AXI_BREADY;
  wire [1:0]processing_system_M03_AXI_BRESP;
  wire processing_system_M03_AXI_BVALID;
  wire [31:0]processing_system_M03_AXI_RDATA;
  wire processing_system_M03_AXI_RREADY;
  wire [1:0]processing_system_M03_AXI_RRESP;
  wire processing_system_M03_AXI_RVALID;
  wire [31:0]processing_system_M03_AXI_WDATA;
  wire processing_system_M03_AXI_WREADY;
  wire [3:0]processing_system_M03_AXI_WSTRB;
  wire processing_system_M03_AXI_WVALID;
  wire [31:0]processing_system_M05_AXI_ARADDR;
  wire processing_system_M05_AXI_ARREADY;
  wire processing_system_M05_AXI_ARVALID;
  wire [31:0]processing_system_M05_AXI_AWADDR;
  wire processing_system_M05_AXI_AWREADY;
  wire processing_system_M05_AXI_AWVALID;
  wire processing_system_M05_AXI_BREADY;
  wire [1:0]processing_system_M05_AXI_BRESP;
  wire processing_system_M05_AXI_BVALID;
  wire [31:0]processing_system_M05_AXI_RDATA;
  wire processing_system_M05_AXI_RREADY;
  wire [1:0]processing_system_M05_AXI_RRESP;
  wire processing_system_M05_AXI_RVALID;
  wire [31:0]processing_system_M05_AXI_WDATA;
  wire processing_system_M05_AXI_WREADY;
  wire [3:0]processing_system_M05_AXI_WSTRB;
  wire processing_system_M05_AXI_WVALID;
  wire [14:0]ps_0_DDR_ADDR;
  wire [2:0]ps_0_DDR_BA;
  wire ps_0_DDR_CAS_N;
  wire ps_0_DDR_CKE;
  wire ps_0_DDR_CK_N;
  wire ps_0_DDR_CK_P;
  wire ps_0_DDR_CS_N;
  wire [3:0]ps_0_DDR_DM;
  wire [31:0]ps_0_DDR_DQ;
  wire [3:0]ps_0_DDR_DQS_N;
  wire [3:0]ps_0_DDR_DQS_P;
  wire ps_0_DDR_ODT;
  wire ps_0_DDR_RAS_N;
  wire ps_0_DDR_RESET_N;
  wire ps_0_DDR_WE_N;
  wire ps_0_FIXED_IO_DDR_VRN;
  wire ps_0_FIXED_IO_DDR_VRP;
  wire [53:0]ps_0_FIXED_IO_MIO;
  wire ps_0_FIXED_IO_PS_CLK;
  wire ps_0_FIXED_IO_PS_PORB;
  wire ps_0_FIXED_IO_PS_SRSTB;
  wire [31:0]ps_0_axi_periph_M00_AXI_ARADDR;
  wire ps_0_axi_periph_M00_AXI_ARREADY;
  wire ps_0_axi_periph_M00_AXI_ARVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_AWADDR;
  wire ps_0_axi_periph_M00_AXI_AWREADY;
  wire ps_0_axi_periph_M00_AXI_AWVALID;
  wire ps_0_axi_periph_M00_AXI_BREADY;
  wire [1:0]ps_0_axi_periph_M00_AXI_BRESP;
  wire ps_0_axi_periph_M00_AXI_BVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_RDATA;
  wire ps_0_axi_periph_M00_AXI_RREADY;
  wire [1:0]ps_0_axi_periph_M00_AXI_RRESP;
  wire ps_0_axi_periph_M00_AXI_RVALID;
  wire [31:0]ps_0_axi_periph_M00_AXI_WDATA;
  wire ps_0_axi_periph_M00_AXI_WREADY;
  wire [3:0]ps_0_axi_periph_M00_AXI_WSTRB;
  wire ps_0_axi_periph_M00_AXI_WVALID;
  wire [31:0]ps_axi_periph_M01_AXI_ARADDR;
  wire ps_axi_periph_M01_AXI_ARREADY;
  wire ps_axi_periph_M01_AXI_ARVALID;
  wire [31:0]ps_axi_periph_M01_AXI_AWADDR;
  wire ps_axi_periph_M01_AXI_AWREADY;
  wire ps_axi_periph_M01_AXI_AWVALID;
  wire ps_axi_periph_M01_AXI_BREADY;
  wire [1:0]ps_axi_periph_M01_AXI_BRESP;
  wire ps_axi_periph_M01_AXI_BVALID;
  wire [31:0]ps_axi_periph_M01_AXI_RDATA;
  wire ps_axi_periph_M01_AXI_RREADY;
  wire [1:0]ps_axi_periph_M01_AXI_RRESP;
  wire ps_axi_periph_M01_AXI_RVALID;
  wire [31:0]ps_axi_periph_M01_AXI_WDATA;
  wire ps_axi_periph_M01_AXI_WREADY;
  wire ps_axi_periph_M01_AXI_WVALID;
  wire [1:0]util_ds_buf_2_OBUF_DS_N;
  wire [1:0]util_ds_buf_2_OBUF_DS_P;
  wire [0:0]xlconstant_0_dout;

  assign adc_clk_n_i_1 = adc_clk_n_i;
  assign adc_clk_p_i_1 = adc_clk_p_i;
  assign adc_csn_o = axis_red_pitaya_adc_0_adc_csn;
  assign adc_dat_a_i_1 = adc_dat_a_i[13:0];
  assign adc_dat_b_i_1 = adc_dat_b_i[13:0];
  assign dac_clk_o = axis_red_pitaya_dac_0_dac_clk;
  assign dac_dat_o[13:0] = axis_red_pitaya_dac_0_dac_dat;
  assign dac_rst_o = axis_red_pitaya_dac_0_dac_rst;
  assign dac_sel_o = axis_red_pitaya_dac_0_dac_sel;
  assign dac_wrt_o = axis_red_pitaya_dac_0_dac_wrt;
  assign daisy_n_i_1 = daisy_n_i[1:0];
  assign daisy_n_o[1:0] = util_ds_buf_2_OBUF_DS_N;
  assign daisy_p_i_1 = daisy_p_i[1:0];
  assign daisy_p_o[1:0] = util_ds_buf_2_OBUF_DS_P;
  clocking_system_imp_7QV4LN clocking_system
       (.IBUF_DS_N(adc_clk_n_i_1),
        .IBUF_DS_P(adc_clk_p_i_1),
        .clk_out1(clk_wiz_0_clk_out1));
  daisy_chain_imp_1A80GWR daisy_chain
       (.IBUF_DS_N(daisy_n_i_1),
        .IBUF_DS_P(daisy_p_i_1),
        .OBUF_DS_N(util_ds_buf_2_OBUF_DS_N),
        .OBUF_DS_P(util_ds_buf_2_OBUF_DS_P));
  gpio_interface_imp_1EU3LZ6 gpio_interface
       (.S_AXI_araddr(S_AXI_2_ARADDR),
        .S_AXI_arready(S_AXI_2_ARREADY),
        .S_AXI_arvalid(S_AXI_2_ARVALID),
        .S_AXI_awaddr(S_AXI_2_AWADDR),
        .S_AXI_awready(S_AXI_2_AWREADY),
        .S_AXI_awvalid(S_AXI_2_AWVALID),
        .S_AXI_bready(S_AXI_2_BREADY),
        .S_AXI_bresp(S_AXI_2_BRESP),
        .S_AXI_bvalid(S_AXI_2_BVALID),
        .S_AXI_rdata(S_AXI_2_RDATA),
        .S_AXI_rready(S_AXI_2_RREADY),
        .S_AXI_rresp(S_AXI_2_RRESP),
        .S_AXI_rvalid(S_AXI_2_RVALID),
        .S_AXI_wdata(S_AXI_2_WDATA),
        .S_AXI_wready(S_AXI_2_WREADY),
        .S_AXI_wstrb(S_AXI_2_WSTRB),
        .S_AXI_wvalid(S_AXI_2_WVALID),
        .aclk(clk_sync_clk_out1),
        .aresetn(xlconstant_0_dout),
        .enable(enable_1),
        .exp_data_n(exp_n_tri_io[7:0]),
        .exp_data_p(exp_p_tri_io[7:0]));
  processing_system_imp_W26YM1 processing_system
       (.ARESETN(xlconstant_0_dout),
        .DDR_addr(DDR_addr[14:0]),
        .DDR_ba(DDR_ba[2:0]),
        .DDR_cas_n(DDR_cas_n),
        .DDR_ck_n(DDR_ck_n),
        .DDR_ck_p(DDR_ck_p),
        .DDR_cke(DDR_cke),
        .DDR_cs_n(DDR_cs_n),
        .DDR_dm(DDR_dm[3:0]),
        .DDR_dq(DDR_dq[31:0]),
        .DDR_dqs_n(DDR_dqs_n[3:0]),
        .DDR_dqs_p(DDR_dqs_p[3:0]),
        .DDR_odt(DDR_odt),
        .DDR_ras_n(DDR_ras_n),
        .DDR_reset_n(DDR_reset_n),
        .DDR_we_n(DDR_we_n),
        .FIXED_IO_ddr_vrn(FIXED_IO_ddr_vrn),
        .FIXED_IO_ddr_vrp(FIXED_IO_ddr_vrp),
        .FIXED_IO_mio(FIXED_IO_mio[53:0]),
        .FIXED_IO_ps_clk(FIXED_IO_ps_clk),
        .FIXED_IO_ps_porb(FIXED_IO_ps_porb),
        .FIXED_IO_ps_srstb(FIXED_IO_ps_srstb),
        .M00_AXI_araddr(ps_0_axi_periph_M00_AXI_ARADDR),
        .M00_AXI_arready(ps_0_axi_periph_M00_AXI_ARREADY),
        .M00_AXI_arvalid(ps_0_axi_periph_M00_AXI_ARVALID),
        .M00_AXI_awaddr(ps_0_axi_periph_M00_AXI_AWADDR),
        .M00_AXI_awready(ps_0_axi_periph_M00_AXI_AWREADY),
        .M00_AXI_awvalid(ps_0_axi_periph_M00_AXI_AWVALID),
        .M00_AXI_bready(ps_0_axi_periph_M00_AXI_BREADY),
        .M00_AXI_bresp(ps_0_axi_periph_M00_AXI_BRESP),
        .M00_AXI_bvalid(ps_0_axi_periph_M00_AXI_BVALID),
        .M00_AXI_rdata(ps_0_axi_periph_M00_AXI_RDATA),
        .M00_AXI_rready(ps_0_axi_periph_M00_AXI_RREADY),
        .M00_AXI_rresp(ps_0_axi_periph_M00_AXI_RRESP),
        .M00_AXI_rvalid(ps_0_axi_periph_M00_AXI_RVALID),
        .M00_AXI_wdata(ps_0_axi_periph_M00_AXI_WDATA),
        .M00_AXI_wready(ps_0_axi_periph_M00_AXI_WREADY),
        .M00_AXI_wstrb(ps_0_axi_periph_M00_AXI_WSTRB),
        .M00_AXI_wvalid(ps_0_axi_periph_M00_AXI_WVALID),
        .M01_AXI_araddr(ps_axi_periph_M01_AXI_ARADDR),
        .M01_AXI_arready(ps_axi_periph_M01_AXI_ARREADY),
        .M01_AXI_arvalid(ps_axi_periph_M01_AXI_ARVALID),
        .M01_AXI_awaddr(ps_axi_periph_M01_AXI_AWADDR),
        .M01_AXI_awready(ps_axi_periph_M01_AXI_AWREADY),
        .M01_AXI_awvalid(ps_axi_periph_M01_AXI_AWVALID),
        .M01_AXI_bready(ps_axi_periph_M01_AXI_BREADY),
        .M01_AXI_bresp(ps_axi_periph_M01_AXI_BRESP),
        .M01_AXI_bvalid(ps_axi_periph_M01_AXI_BVALID),
        .M01_AXI_rdata(ps_axi_periph_M01_AXI_RDATA),
        .M01_AXI_rready(ps_axi_periph_M01_AXI_RREADY),
        .M01_AXI_rresp(ps_axi_periph_M01_AXI_RRESP),
        .M01_AXI_rvalid(ps_axi_periph_M01_AXI_RVALID),
        .M01_AXI_wdata(ps_axi_periph_M01_AXI_WDATA),
        .M01_AXI_wready(ps_axi_periph_M01_AXI_WREADY),
        .M01_AXI_wvalid(ps_axi_periph_M01_AXI_WVALID),
        .M02_AXI_araddr(S_AXI_1_ARADDR),
        .M02_AXI_arready(S_AXI_1_ARREADY),
        .M02_AXI_arvalid(S_AXI_1_ARVALID),
        .M02_AXI_awaddr(S_AXI_1_AWADDR),
        .M02_AXI_awready(S_AXI_1_AWREADY),
        .M02_AXI_awvalid(S_AXI_1_AWVALID),
        .M02_AXI_bready(S_AXI_1_BREADY),
        .M02_AXI_bresp(S_AXI_1_BRESP),
        .M02_AXI_bvalid(S_AXI_1_BVALID),
        .M02_AXI_rdata(S_AXI_1_RDATA),
        .M02_AXI_rready(S_AXI_1_RREADY),
        .M02_AXI_rresp(S_AXI_1_RRESP),
        .M02_AXI_rvalid(S_AXI_1_RVALID),
        .M02_AXI_wdata(S_AXI_1_WDATA),
        .M02_AXI_wready(S_AXI_1_WREADY),
        .M02_AXI_wvalid(S_AXI_1_WVALID),
        .M03_AXI_araddr(processing_system_M03_AXI_ARADDR),
        .M03_AXI_arready(processing_system_M03_AXI_ARREADY),
        .M03_AXI_arvalid(processing_system_M03_AXI_ARVALID),
        .M03_AXI_awaddr(processing_system_M03_AXI_AWADDR),
        .M03_AXI_awready(processing_system_M03_AXI_AWREADY),
        .M03_AXI_awvalid(processing_system_M03_AXI_AWVALID),
        .M03_AXI_bready(processing_system_M03_AXI_BREADY),
        .M03_AXI_bresp(processing_system_M03_AXI_BRESP),
        .M03_AXI_bvalid(processing_system_M03_AXI_BVALID),
        .M03_AXI_rdata(processing_system_M03_AXI_RDATA),
        .M03_AXI_rready(processing_system_M03_AXI_RREADY),
        .M03_AXI_rresp(processing_system_M03_AXI_RRESP),
        .M03_AXI_rvalid(processing_system_M03_AXI_RVALID),
        .M03_AXI_wdata(processing_system_M03_AXI_WDATA),
        .M03_AXI_wready(processing_system_M03_AXI_WREADY),
        .M03_AXI_wstrb(processing_system_M03_AXI_WSTRB),
        .M03_AXI_wvalid(processing_system_M03_AXI_WVALID),
        .M04_AXI_araddr(S_AXI_2_ARADDR),
        .M04_AXI_arready(S_AXI_2_ARREADY),
        .M04_AXI_arvalid(S_AXI_2_ARVALID),
        .M04_AXI_awaddr(S_AXI_2_AWADDR),
        .M04_AXI_awready(S_AXI_2_AWREADY),
        .M04_AXI_awvalid(S_AXI_2_AWVALID),
        .M04_AXI_bready(S_AXI_2_BREADY),
        .M04_AXI_bresp(S_AXI_2_BRESP),
        .M04_AXI_bvalid(S_AXI_2_BVALID),
        .M04_AXI_rdata(S_AXI_2_RDATA),
        .M04_AXI_rready(S_AXI_2_RREADY),
        .M04_AXI_rresp(S_AXI_2_RRESP),
        .M04_AXI_rvalid(S_AXI_2_RVALID),
        .M04_AXI_wdata(S_AXI_2_WDATA),
        .M04_AXI_wready(S_AXI_2_WREADY),
        .M04_AXI_wstrb(S_AXI_2_WSTRB),
        .M04_AXI_wvalid(S_AXI_2_WVALID),
        .M05_AXI_araddr(processing_system_M05_AXI_ARADDR),
        .M05_AXI_arready(processing_system_M05_AXI_ARREADY),
        .M05_AXI_arvalid(processing_system_M05_AXI_ARVALID),
        .M05_AXI_awaddr(processing_system_M05_AXI_AWADDR),
        .M05_AXI_awready(processing_system_M05_AXI_AWREADY),
        .M05_AXI_awvalid(processing_system_M05_AXI_AWVALID),
        .M05_AXI_bready(processing_system_M05_AXI_BREADY),
        .M05_AXI_bresp(processing_system_M05_AXI_BRESP),
        .M05_AXI_bvalid(processing_system_M05_AXI_BVALID),
        .M05_AXI_rdata(processing_system_M05_AXI_RDATA),
        .M05_AXI_rready(processing_system_M05_AXI_RREADY),
        .M05_AXI_rresp(processing_system_M05_AXI_RRESP),
        .M05_AXI_rvalid(processing_system_M05_AXI_RVALID),
        .M05_AXI_wdata(processing_system_M05_AXI_WDATA),
        .M05_AXI_wready(processing_system_M05_AXI_WREADY),
        .M05_AXI_wstrb(processing_system_M05_AXI_WSTRB),
        .M05_AXI_wvalid(processing_system_M05_AXI_WVALID),
        .M06_AXI_araddr(S_AXI2_1_ARADDR),
        .M06_AXI_arready(S_AXI2_1_ARREADY),
        .M06_AXI_arvalid(S_AXI2_1_ARVALID),
        .M06_AXI_awaddr(S_AXI2_1_AWADDR),
        .M06_AXI_awready(S_AXI2_1_AWREADY),
        .M06_AXI_awvalid(S_AXI2_1_AWVALID),
        .M06_AXI_bready(S_AXI2_1_BREADY),
        .M06_AXI_bresp(S_AXI2_1_BRESP),
        .M06_AXI_bvalid(S_AXI2_1_BVALID),
        .M06_AXI_rdata(S_AXI2_1_RDATA),
        .M06_AXI_rready(S_AXI2_1_RREADY),
        .M06_AXI_rresp(S_AXI2_1_RRESP),
        .M06_AXI_rvalid(S_AXI2_1_RVALID),
        .M06_AXI_wdata(S_AXI2_1_WDATA),
        .M06_AXI_wready(S_AXI2_1_WREADY),
        .M06_AXI_wstrb(S_AXI2_1_WSTRB),
        .M06_AXI_wvalid(S_AXI2_1_WVALID),
        .S_AXI_HP0_awaddr(axis_ram_writer_0_M_AXI_AWADDR),
        .S_AXI_HP0_awburst(axis_ram_writer_0_M_AXI_AWBURST),
        .S_AXI_HP0_awcache(axis_ram_writer_0_M_AXI_AWCACHE),
        .S_AXI_HP0_awid(axis_ram_writer_0_M_AXI_AWID),
        .S_AXI_HP0_awlen(axis_ram_writer_0_M_AXI_AWLEN),
        .S_AXI_HP0_awready(axis_ram_writer_0_M_AXI_AWREADY),
        .S_AXI_HP0_awsize(axis_ram_writer_0_M_AXI_AWSIZE),
        .S_AXI_HP0_awvalid(axis_ram_writer_0_M_AXI_AWVALID),
        .S_AXI_HP0_bready(axis_ram_writer_0_M_AXI_BREADY),
        .S_AXI_HP0_bvalid(axis_ram_writer_0_M_AXI_BVALID),
        .S_AXI_HP0_wdata(axis_ram_writer_0_M_AXI_WDATA),
        .S_AXI_HP0_wid(axis_ram_writer_0_M_AXI_WID),
        .S_AXI_HP0_wlast(axis_ram_writer_0_M_AXI_WLAST),
        .S_AXI_HP0_wready(axis_ram_writer_0_M_AXI_WREADY),
        .S_AXI_HP0_wstrb(axis_ram_writer_0_M_AXI_WSTRB),
        .S_AXI_HP0_wvalid(axis_ram_writer_0_M_AXI_WVALID),
        .S_AXI_HP1_awaddr(channel_b_M_AXI_AWADDR),
        .S_AXI_HP1_awburst(channel_b_M_AXI_AWBURST),
        .S_AXI_HP1_awcache(channel_b_M_AXI_AWCACHE),
        .S_AXI_HP1_awid(channel_b_M_AXI_AWID),
        .S_AXI_HP1_awlen(channel_b_M_AXI_AWLEN),
        .S_AXI_HP1_awready(channel_b_M_AXI_AWREADY),
        .S_AXI_HP1_awsize(channel_b_M_AXI_AWSIZE),
        .S_AXI_HP1_awvalid(channel_b_M_AXI_AWVALID),
        .S_AXI_HP1_bready(channel_b_M_AXI_BREADY),
        .S_AXI_HP1_bvalid(channel_b_M_AXI_BVALID),
        .S_AXI_HP1_wdata(channel_b_M_AXI_WDATA),
        .S_AXI_HP1_wid(channel_b_M_AXI_WID),
        .S_AXI_HP1_wlast(channel_b_M_AXI_WLAST),
        .S_AXI_HP1_wready(channel_b_M_AXI_WREADY),
        .S_AXI_HP1_wstrb(channel_b_M_AXI_WSTRB),
        .S_AXI_HP1_wvalid(channel_b_M_AXI_WVALID),
        .slowest_sync_clk(clk_sync_clk_out1));
  receive_chain_imp_N0MRX5 receive_chain
       (.M_AXI1_awaddr(channel_b_M_AXI_AWADDR),
        .M_AXI1_awburst(channel_b_M_AXI_AWBURST),
        .M_AXI1_awcache(channel_b_M_AXI_AWCACHE),
        .M_AXI1_awid(channel_b_M_AXI_AWID),
        .M_AXI1_awlen(channel_b_M_AXI_AWLEN),
        .M_AXI1_awready(channel_b_M_AXI_AWREADY),
        .M_AXI1_awsize(channel_b_M_AXI_AWSIZE),
        .M_AXI1_awvalid(channel_b_M_AXI_AWVALID),
        .M_AXI1_bready(channel_b_M_AXI_BREADY),
        .M_AXI1_bvalid(channel_b_M_AXI_BVALID),
        .M_AXI1_wdata(channel_b_M_AXI_WDATA),
        .M_AXI1_wid(channel_b_M_AXI_WID),
        .M_AXI1_wlast(channel_b_M_AXI_WLAST),
        .M_AXI1_wready(channel_b_M_AXI_WREADY),
        .M_AXI1_wstrb(channel_b_M_AXI_WSTRB),
        .M_AXI1_wvalid(channel_b_M_AXI_WVALID),
        .M_AXI_awaddr(axis_ram_writer_0_M_AXI_AWADDR),
        .M_AXI_awburst(axis_ram_writer_0_M_AXI_AWBURST),
        .M_AXI_awcache(axis_ram_writer_0_M_AXI_AWCACHE),
        .M_AXI_awid(axis_ram_writer_0_M_AXI_AWID),
        .M_AXI_awlen(axis_ram_writer_0_M_AXI_AWLEN),
        .M_AXI_awready(axis_ram_writer_0_M_AXI_AWREADY),
        .M_AXI_awsize(axis_ram_writer_0_M_AXI_AWSIZE),
        .M_AXI_awvalid(axis_ram_writer_0_M_AXI_AWVALID),
        .M_AXI_bready(axis_ram_writer_0_M_AXI_BREADY),
        .M_AXI_bvalid(axis_ram_writer_0_M_AXI_BVALID),
        .M_AXI_wdata(axis_ram_writer_0_M_AXI_WDATA),
        .M_AXI_wid(axis_ram_writer_0_M_AXI_WID),
        .M_AXI_wlast(axis_ram_writer_0_M_AXI_WLAST),
        .M_AXI_wready(axis_ram_writer_0_M_AXI_WREADY),
        .M_AXI_wstrb(axis_ram_writer_0_M_AXI_WSTRB),
        .M_AXI_wvalid(axis_ram_writer_0_M_AXI_WVALID),
        .S_AXI_araddr(ps_0_axi_periph_M00_AXI_ARADDR),
        .S_AXI_arready(ps_0_axi_periph_M00_AXI_ARREADY),
        .S_AXI_arvalid(ps_0_axi_periph_M00_AXI_ARVALID),
        .S_AXI_awaddr(ps_0_axi_periph_M00_AXI_AWADDR),
        .S_AXI_awready(ps_0_axi_periph_M00_AXI_AWREADY),
        .S_AXI_awvalid(ps_0_axi_periph_M00_AXI_AWVALID),
        .S_AXI_bready(ps_0_axi_periph_M00_AXI_BREADY),
        .S_AXI_bresp(ps_0_axi_periph_M00_AXI_BRESP),
        .S_AXI_bvalid(ps_0_axi_periph_M00_AXI_BVALID),
        .S_AXI_rdata(ps_0_axi_periph_M00_AXI_RDATA),
        .S_AXI_rready(ps_0_axi_periph_M00_AXI_RREADY),
        .S_AXI_rresp(ps_0_axi_periph_M00_AXI_RRESP),
        .S_AXI_rvalid(ps_0_axi_periph_M00_AXI_RVALID),
        .S_AXI_wdata(ps_0_axi_periph_M00_AXI_WDATA),
        .S_AXI_wready(ps_0_axi_periph_M00_AXI_WREADY),
        .S_AXI_wstrb(ps_0_axi_periph_M00_AXI_WSTRB),
        .S_AXI_wvalid(ps_0_axi_periph_M00_AXI_WVALID),
        .aclk(clk_sync_clk_out1),
        .adc_csn(axis_red_pitaya_adc_0_adc_csn),
        .adc_dat_a(adc_dat_a_i_1),
        .adc_dat_b(adc_dat_b_i_1),
        .aresetn(xlconstant_0_dout),
        .ch_a_status_araddr(ps_axi_periph_M01_AXI_ARADDR),
        .ch_a_status_arready(ps_axi_periph_M01_AXI_ARREADY),
        .ch_a_status_arvalid(ps_axi_periph_M01_AXI_ARVALID),
        .ch_a_status_awaddr(ps_axi_periph_M01_AXI_AWADDR),
        .ch_a_status_awready(ps_axi_periph_M01_AXI_AWREADY),
        .ch_a_status_awvalid(ps_axi_periph_M01_AXI_AWVALID),
        .ch_a_status_bready(ps_axi_periph_M01_AXI_BREADY),
        .ch_a_status_bresp(ps_axi_periph_M01_AXI_BRESP),
        .ch_a_status_bvalid(ps_axi_periph_M01_AXI_BVALID),
        .ch_a_status_rdata(ps_axi_periph_M01_AXI_RDATA),
        .ch_a_status_rready(ps_axi_periph_M01_AXI_RREADY),
        .ch_a_status_rresp(ps_axi_periph_M01_AXI_RRESP),
        .ch_a_status_rvalid(ps_axi_periph_M01_AXI_RVALID),
        .ch_a_status_wdata(ps_axi_periph_M01_AXI_WDATA),
        .ch_a_status_wready(ps_axi_periph_M01_AXI_WREADY),
        .ch_a_status_wvalid(ps_axi_periph_M01_AXI_WVALID),
        .ch_b_status_araddr(S_AXI_1_ARADDR),
        .ch_b_status_arready(S_AXI_1_ARREADY),
        .ch_b_status_arvalid(S_AXI_1_ARVALID),
        .ch_b_status_awaddr(S_AXI_1_AWADDR),
        .ch_b_status_awready(S_AXI_1_AWREADY),
        .ch_b_status_awvalid(S_AXI_1_AWVALID),
        .ch_b_status_bready(S_AXI_1_BREADY),
        .ch_b_status_bresp(S_AXI_1_BRESP),
        .ch_b_status_bvalid(S_AXI_1_BVALID),
        .ch_b_status_rdata(S_AXI_1_RDATA),
        .ch_b_status_rready(S_AXI_1_RREADY),
        .ch_b_status_rresp(S_AXI_1_RRESP),
        .ch_b_status_rvalid(S_AXI_1_RVALID),
        .ch_b_status_wdata(S_AXI_1_WDATA),
        .ch_b_status_wready(S_AXI_1_WREADY),
        .ch_b_status_wvalid(S_AXI_1_WVALID),
        .enable(enable_1),
        .int_clk(clk_wiz_0_clk_out1));
  signal_generator_imp_HADG47 signal_generator
       (.aclk(clk_sync_clk_out1),
        .aresetn(xlconstant_0_dout),
        .c_phase_inc_araddr(processing_system_M05_AXI_ARADDR),
        .c_phase_inc_arready(processing_system_M05_AXI_ARREADY),
        .c_phase_inc_arvalid(processing_system_M05_AXI_ARVALID),
        .c_phase_inc_awaddr(processing_system_M05_AXI_AWADDR),
        .c_phase_inc_awready(processing_system_M05_AXI_AWREADY),
        .c_phase_inc_awvalid(processing_system_M05_AXI_AWVALID),
        .c_phase_inc_bready(processing_system_M05_AXI_BREADY),
        .c_phase_inc_bresp(processing_system_M05_AXI_BRESP),
        .c_phase_inc_bvalid(processing_system_M05_AXI_BVALID),
        .c_phase_inc_rdata(processing_system_M05_AXI_RDATA),
        .c_phase_inc_rready(processing_system_M05_AXI_RREADY),
        .c_phase_inc_rresp(processing_system_M05_AXI_RRESP),
        .c_phase_inc_rvalid(processing_system_M05_AXI_RVALID),
        .c_phase_inc_wdata(processing_system_M05_AXI_WDATA),
        .c_phase_inc_wready(processing_system_M05_AXI_WREADY),
        .c_phase_inc_wstrb(processing_system_M05_AXI_WSTRB),
        .c_phase_inc_wvalid(processing_system_M05_AXI_WVALID),
        .c_phase_off_araddr(S_AXI2_1_ARADDR),
        .c_phase_off_arready(S_AXI2_1_ARREADY),
        .c_phase_off_arvalid(S_AXI2_1_ARVALID),
        .c_phase_off_awaddr(S_AXI2_1_AWADDR),
        .c_phase_off_awready(S_AXI2_1_AWREADY),
        .c_phase_off_awvalid(S_AXI2_1_AWVALID),
        .c_phase_off_bready(S_AXI2_1_BREADY),
        .c_phase_off_bresp(S_AXI2_1_BRESP),
        .c_phase_off_bvalid(S_AXI2_1_BVALID),
        .c_phase_off_rdata(S_AXI2_1_RDATA),
        .c_phase_off_rready(S_AXI2_1_RREADY),
        .c_phase_off_rresp(S_AXI2_1_RRESP),
        .c_phase_off_rvalid(S_AXI2_1_RVALID),
        .c_phase_off_wdata(S_AXI2_1_WDATA),
        .c_phase_off_wready(S_AXI2_1_WREADY),
        .c_phase_off_wstrb(S_AXI2_1_WSTRB),
        .c_phase_off_wvalid(S_AXI2_1_WVALID),
        .dac_clk(axis_red_pitaya_dac_0_dac_clk),
        .dac_dat(axis_red_pitaya_dac_0_dac_dat),
        .dac_rst(axis_red_pitaya_dac_0_dac_rst),
        .dac_sel(axis_red_pitaya_dac_0_dac_sel),
        .dac_wrt(axis_red_pitaya_dac_0_dac_wrt),
        .enable(enable_1),
        .r_phase_inc_araddr(processing_system_M03_AXI_ARADDR),
        .r_phase_inc_arready(processing_system_M03_AXI_ARREADY),
        .r_phase_inc_arvalid(processing_system_M03_AXI_ARVALID),
        .r_phase_inc_awaddr(processing_system_M03_AXI_AWADDR),
        .r_phase_inc_awready(processing_system_M03_AXI_AWREADY),
        .r_phase_inc_awvalid(processing_system_M03_AXI_AWVALID),
        .r_phase_inc_bready(processing_system_M03_AXI_BREADY),
        .r_phase_inc_bresp(processing_system_M03_AXI_BRESP),
        .r_phase_inc_bvalid(processing_system_M03_AXI_BVALID),
        .r_phase_inc_rdata(processing_system_M03_AXI_RDATA),
        .r_phase_inc_rready(processing_system_M03_AXI_RREADY),
        .r_phase_inc_rresp(processing_system_M03_AXI_RRESP),
        .r_phase_inc_rvalid(processing_system_M03_AXI_RVALID),
        .r_phase_inc_wdata(processing_system_M03_AXI_WDATA),
        .r_phase_inc_wready(processing_system_M03_AXI_WREADY),
        .r_phase_inc_wstrb(processing_system_M03_AXI_WSTRB),
        .r_phase_inc_wvalid(processing_system_M03_AXI_WVALID));
endmodule

module system_ps_0_axi_periph_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_ACLK,
    M05_ARESETN,
    M05_AXI_araddr,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_ACLK,
    M06_ARESETN,
    M06_AXI_araddr,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input [0:0]ARESETN;
  input M00_ACLK;
  input [0:0]M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input [0:0]M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input [0:0]M02_ARESETN;
  output [31:0]M02_AXI_araddr;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output M02_AXI_wvalid;
  input M03_ACLK;
  input [0:0]M03_ARESETN;
  output [31:0]M03_AXI_araddr;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [31:0]M03_AXI_awaddr;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  input M04_ACLK;
  input [0:0]M04_ARESETN;
  output [31:0]M04_AXI_araddr;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [31:0]M04_AXI_awaddr;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  input M05_ACLK;
  input [0:0]M05_ARESETN;
  output [31:0]M05_AXI_araddr;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [31:0]M05_AXI_awaddr;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output M05_AXI_wvalid;
  input M06_ACLK;
  input [0:0]M06_ARESETN;
  output [31:0]M06_AXI_araddr;
  input M06_AXI_arready;
  output M06_AXI_arvalid;
  output [31:0]M06_AXI_awaddr;
  input M06_AXI_awready;
  output M06_AXI_awvalid;
  output M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output M06_AXI_wvalid;
  input S00_ACLK;
  input [0:0]S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire [0:0]M00_ARESETN_1;
  wire M01_ACLK_1;
  wire [0:0]M01_ARESETN_1;
  wire M02_ACLK_1;
  wire [0:0]M02_ARESETN_1;
  wire M03_ACLK_1;
  wire [0:0]M03_ARESETN_1;
  wire M04_ACLK_1;
  wire [0:0]M04_ARESETN_1;
  wire M05_ACLK_1;
  wire [0:0]M05_ARESETN_1;
  wire M06_ACLK_1;
  wire [0:0]M06_ARESETN_1;
  wire S00_ACLK_1;
  wire [0:0]S00_ARESETN_1;
  wire [31:0]m00_couplers_to_ps_axi_periph_ARADDR;
  wire m00_couplers_to_ps_axi_periph_ARREADY;
  wire m00_couplers_to_ps_axi_periph_ARVALID;
  wire [31:0]m00_couplers_to_ps_axi_periph_AWADDR;
  wire m00_couplers_to_ps_axi_periph_AWREADY;
  wire m00_couplers_to_ps_axi_periph_AWVALID;
  wire m00_couplers_to_ps_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_ps_axi_periph_BRESP;
  wire m00_couplers_to_ps_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_ps_axi_periph_RDATA;
  wire m00_couplers_to_ps_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_ps_axi_periph_RRESP;
  wire m00_couplers_to_ps_axi_periph_RVALID;
  wire [31:0]m00_couplers_to_ps_axi_periph_WDATA;
  wire m00_couplers_to_ps_axi_periph_WREADY;
  wire [3:0]m00_couplers_to_ps_axi_periph_WSTRB;
  wire m00_couplers_to_ps_axi_periph_WVALID;
  wire [31:0]m01_couplers_to_ps_axi_periph_ARADDR;
  wire m01_couplers_to_ps_axi_periph_ARREADY;
  wire m01_couplers_to_ps_axi_periph_ARVALID;
  wire [31:0]m01_couplers_to_ps_axi_periph_AWADDR;
  wire m01_couplers_to_ps_axi_periph_AWREADY;
  wire m01_couplers_to_ps_axi_periph_AWVALID;
  wire m01_couplers_to_ps_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_ps_axi_periph_BRESP;
  wire m01_couplers_to_ps_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_ps_axi_periph_RDATA;
  wire m01_couplers_to_ps_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_ps_axi_periph_RRESP;
  wire m01_couplers_to_ps_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_ps_axi_periph_WDATA;
  wire m01_couplers_to_ps_axi_periph_WREADY;
  wire m01_couplers_to_ps_axi_periph_WVALID;
  wire [31:0]m02_couplers_to_ps_axi_periph_ARADDR;
  wire m02_couplers_to_ps_axi_periph_ARREADY;
  wire m02_couplers_to_ps_axi_periph_ARVALID;
  wire [31:0]m02_couplers_to_ps_axi_periph_AWADDR;
  wire m02_couplers_to_ps_axi_periph_AWREADY;
  wire m02_couplers_to_ps_axi_periph_AWVALID;
  wire m02_couplers_to_ps_axi_periph_BREADY;
  wire [1:0]m02_couplers_to_ps_axi_periph_BRESP;
  wire m02_couplers_to_ps_axi_periph_BVALID;
  wire [31:0]m02_couplers_to_ps_axi_periph_RDATA;
  wire m02_couplers_to_ps_axi_periph_RREADY;
  wire [1:0]m02_couplers_to_ps_axi_periph_RRESP;
  wire m02_couplers_to_ps_axi_periph_RVALID;
  wire [31:0]m02_couplers_to_ps_axi_periph_WDATA;
  wire m02_couplers_to_ps_axi_periph_WREADY;
  wire m02_couplers_to_ps_axi_periph_WVALID;
  wire [31:0]m03_couplers_to_ps_axi_periph_ARADDR;
  wire m03_couplers_to_ps_axi_periph_ARREADY;
  wire m03_couplers_to_ps_axi_periph_ARVALID;
  wire [31:0]m03_couplers_to_ps_axi_periph_AWADDR;
  wire m03_couplers_to_ps_axi_periph_AWREADY;
  wire m03_couplers_to_ps_axi_periph_AWVALID;
  wire m03_couplers_to_ps_axi_periph_BREADY;
  wire [1:0]m03_couplers_to_ps_axi_periph_BRESP;
  wire m03_couplers_to_ps_axi_periph_BVALID;
  wire [31:0]m03_couplers_to_ps_axi_periph_RDATA;
  wire m03_couplers_to_ps_axi_periph_RREADY;
  wire [1:0]m03_couplers_to_ps_axi_periph_RRESP;
  wire m03_couplers_to_ps_axi_periph_RVALID;
  wire [31:0]m03_couplers_to_ps_axi_periph_WDATA;
  wire m03_couplers_to_ps_axi_periph_WREADY;
  wire [3:0]m03_couplers_to_ps_axi_periph_WSTRB;
  wire m03_couplers_to_ps_axi_periph_WVALID;
  wire [31:0]m04_couplers_to_ps_axi_periph_ARADDR;
  wire m04_couplers_to_ps_axi_periph_ARREADY;
  wire m04_couplers_to_ps_axi_periph_ARVALID;
  wire [31:0]m04_couplers_to_ps_axi_periph_AWADDR;
  wire m04_couplers_to_ps_axi_periph_AWREADY;
  wire m04_couplers_to_ps_axi_periph_AWVALID;
  wire m04_couplers_to_ps_axi_periph_BREADY;
  wire [1:0]m04_couplers_to_ps_axi_periph_BRESP;
  wire m04_couplers_to_ps_axi_periph_BVALID;
  wire [31:0]m04_couplers_to_ps_axi_periph_RDATA;
  wire m04_couplers_to_ps_axi_periph_RREADY;
  wire [1:0]m04_couplers_to_ps_axi_periph_RRESP;
  wire m04_couplers_to_ps_axi_periph_RVALID;
  wire [31:0]m04_couplers_to_ps_axi_periph_WDATA;
  wire m04_couplers_to_ps_axi_periph_WREADY;
  wire [3:0]m04_couplers_to_ps_axi_periph_WSTRB;
  wire m04_couplers_to_ps_axi_periph_WVALID;
  wire [31:0]m05_couplers_to_ps_axi_periph_ARADDR;
  wire m05_couplers_to_ps_axi_periph_ARREADY;
  wire m05_couplers_to_ps_axi_periph_ARVALID;
  wire [31:0]m05_couplers_to_ps_axi_periph_AWADDR;
  wire m05_couplers_to_ps_axi_periph_AWREADY;
  wire m05_couplers_to_ps_axi_periph_AWVALID;
  wire m05_couplers_to_ps_axi_periph_BREADY;
  wire [1:0]m05_couplers_to_ps_axi_periph_BRESP;
  wire m05_couplers_to_ps_axi_periph_BVALID;
  wire [31:0]m05_couplers_to_ps_axi_periph_RDATA;
  wire m05_couplers_to_ps_axi_periph_RREADY;
  wire [1:0]m05_couplers_to_ps_axi_periph_RRESP;
  wire m05_couplers_to_ps_axi_periph_RVALID;
  wire [31:0]m05_couplers_to_ps_axi_periph_WDATA;
  wire m05_couplers_to_ps_axi_periph_WREADY;
  wire [3:0]m05_couplers_to_ps_axi_periph_WSTRB;
  wire m05_couplers_to_ps_axi_periph_WVALID;
  wire [31:0]m06_couplers_to_ps_axi_periph_ARADDR;
  wire m06_couplers_to_ps_axi_periph_ARREADY;
  wire m06_couplers_to_ps_axi_periph_ARVALID;
  wire [31:0]m06_couplers_to_ps_axi_periph_AWADDR;
  wire m06_couplers_to_ps_axi_periph_AWREADY;
  wire m06_couplers_to_ps_axi_periph_AWVALID;
  wire m06_couplers_to_ps_axi_periph_BREADY;
  wire [1:0]m06_couplers_to_ps_axi_periph_BRESP;
  wire m06_couplers_to_ps_axi_periph_BVALID;
  wire [31:0]m06_couplers_to_ps_axi_periph_RDATA;
  wire m06_couplers_to_ps_axi_periph_RREADY;
  wire [1:0]m06_couplers_to_ps_axi_periph_RRESP;
  wire m06_couplers_to_ps_axi_periph_RVALID;
  wire [31:0]m06_couplers_to_ps_axi_periph_WDATA;
  wire m06_couplers_to_ps_axi_periph_WREADY;
  wire [3:0]m06_couplers_to_ps_axi_periph_WSTRB;
  wire m06_couplers_to_ps_axi_periph_WVALID;
  wire ps_axi_periph_ACLK_net;
  wire [0:0]ps_axi_periph_ARESETN_net;
  wire [31:0]ps_axi_periph_to_s00_couplers_ARADDR;
  wire [1:0]ps_axi_periph_to_s00_couplers_ARBURST;
  wire [3:0]ps_axi_periph_to_s00_couplers_ARCACHE;
  wire [11:0]ps_axi_periph_to_s00_couplers_ARID;
  wire [3:0]ps_axi_periph_to_s00_couplers_ARLEN;
  wire [1:0]ps_axi_periph_to_s00_couplers_ARLOCK;
  wire [2:0]ps_axi_periph_to_s00_couplers_ARPROT;
  wire [3:0]ps_axi_periph_to_s00_couplers_ARQOS;
  wire ps_axi_periph_to_s00_couplers_ARREADY;
  wire [2:0]ps_axi_periph_to_s00_couplers_ARSIZE;
  wire ps_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]ps_axi_periph_to_s00_couplers_AWADDR;
  wire [1:0]ps_axi_periph_to_s00_couplers_AWBURST;
  wire [3:0]ps_axi_periph_to_s00_couplers_AWCACHE;
  wire [11:0]ps_axi_periph_to_s00_couplers_AWID;
  wire [3:0]ps_axi_periph_to_s00_couplers_AWLEN;
  wire [1:0]ps_axi_periph_to_s00_couplers_AWLOCK;
  wire [2:0]ps_axi_periph_to_s00_couplers_AWPROT;
  wire [3:0]ps_axi_periph_to_s00_couplers_AWQOS;
  wire ps_axi_periph_to_s00_couplers_AWREADY;
  wire [2:0]ps_axi_periph_to_s00_couplers_AWSIZE;
  wire ps_axi_periph_to_s00_couplers_AWVALID;
  wire [11:0]ps_axi_periph_to_s00_couplers_BID;
  wire ps_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]ps_axi_periph_to_s00_couplers_BRESP;
  wire ps_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]ps_axi_periph_to_s00_couplers_RDATA;
  wire [11:0]ps_axi_periph_to_s00_couplers_RID;
  wire ps_axi_periph_to_s00_couplers_RLAST;
  wire ps_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]ps_axi_periph_to_s00_couplers_RRESP;
  wire ps_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]ps_axi_periph_to_s00_couplers_WDATA;
  wire [11:0]ps_axi_periph_to_s00_couplers_WID;
  wire ps_axi_periph_to_s00_couplers_WLAST;
  wire ps_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]ps_axi_periph_to_s00_couplers_WSTRB;
  wire ps_axi_periph_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire xbar_to_m01_couplers_WREADY;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire xbar_to_m02_couplers_WREADY;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [127:96]xbar_to_m03_couplers_ARADDR;
  wire xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [127:96]xbar_to_m03_couplers_AWADDR;
  wire xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [159:128]xbar_to_m04_couplers_ARADDR;
  wire xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [159:128]xbar_to_m04_couplers_AWADDR;
  wire xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;
  wire [191:160]xbar_to_m05_couplers_ARADDR;
  wire xbar_to_m05_couplers_ARREADY;
  wire [5:5]xbar_to_m05_couplers_ARVALID;
  wire [191:160]xbar_to_m05_couplers_AWADDR;
  wire xbar_to_m05_couplers_AWREADY;
  wire [5:5]xbar_to_m05_couplers_AWVALID;
  wire [5:5]xbar_to_m05_couplers_BREADY;
  wire [1:0]xbar_to_m05_couplers_BRESP;
  wire xbar_to_m05_couplers_BVALID;
  wire [31:0]xbar_to_m05_couplers_RDATA;
  wire [5:5]xbar_to_m05_couplers_RREADY;
  wire [1:0]xbar_to_m05_couplers_RRESP;
  wire xbar_to_m05_couplers_RVALID;
  wire [191:160]xbar_to_m05_couplers_WDATA;
  wire xbar_to_m05_couplers_WREADY;
  wire [23:20]xbar_to_m05_couplers_WSTRB;
  wire [5:5]xbar_to_m05_couplers_WVALID;
  wire [223:192]xbar_to_m06_couplers_ARADDR;
  wire xbar_to_m06_couplers_ARREADY;
  wire [6:6]xbar_to_m06_couplers_ARVALID;
  wire [223:192]xbar_to_m06_couplers_AWADDR;
  wire xbar_to_m06_couplers_AWREADY;
  wire [6:6]xbar_to_m06_couplers_AWVALID;
  wire [6:6]xbar_to_m06_couplers_BREADY;
  wire [1:0]xbar_to_m06_couplers_BRESP;
  wire xbar_to_m06_couplers_BVALID;
  wire [31:0]xbar_to_m06_couplers_RDATA;
  wire [6:6]xbar_to_m06_couplers_RREADY;
  wire [1:0]xbar_to_m06_couplers_RRESP;
  wire xbar_to_m06_couplers_RVALID;
  wire [223:192]xbar_to_m06_couplers_WDATA;
  wire xbar_to_m06_couplers_WREADY;
  wire [27:24]xbar_to_m06_couplers_WSTRB;
  wire [6:6]xbar_to_m06_couplers_WVALID;
  wire [27:0]NLW_xbar_m_axi_wstrb_UNCONNECTED;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN[0];
  assign M00_AXI_araddr[31:0] = m00_couplers_to_ps_axi_periph_ARADDR;
  assign M00_AXI_arvalid = m00_couplers_to_ps_axi_periph_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_ps_axi_periph_AWADDR;
  assign M00_AXI_awvalid = m00_couplers_to_ps_axi_periph_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_ps_axi_periph_BREADY;
  assign M00_AXI_rready = m00_couplers_to_ps_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_ps_axi_periph_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_ps_axi_periph_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_ps_axi_periph_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN[0];
  assign M01_AXI_araddr[31:0] = m01_couplers_to_ps_axi_periph_ARADDR;
  assign M01_AXI_arvalid = m01_couplers_to_ps_axi_periph_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_ps_axi_periph_AWADDR;
  assign M01_AXI_awvalid = m01_couplers_to_ps_axi_periph_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_ps_axi_periph_BREADY;
  assign M01_AXI_rready = m01_couplers_to_ps_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_ps_axi_periph_WDATA;
  assign M01_AXI_wvalid = m01_couplers_to_ps_axi_periph_WVALID;
  assign M02_ACLK_1 = M02_ACLK;
  assign M02_ARESETN_1 = M02_ARESETN[0];
  assign M02_AXI_araddr[31:0] = m02_couplers_to_ps_axi_periph_ARADDR;
  assign M02_AXI_arvalid = m02_couplers_to_ps_axi_periph_ARVALID;
  assign M02_AXI_awaddr[31:0] = m02_couplers_to_ps_axi_periph_AWADDR;
  assign M02_AXI_awvalid = m02_couplers_to_ps_axi_periph_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_ps_axi_periph_BREADY;
  assign M02_AXI_rready = m02_couplers_to_ps_axi_periph_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_ps_axi_periph_WDATA;
  assign M02_AXI_wvalid = m02_couplers_to_ps_axi_periph_WVALID;
  assign M03_ACLK_1 = M03_ACLK;
  assign M03_ARESETN_1 = M03_ARESETN[0];
  assign M03_AXI_araddr[31:0] = m03_couplers_to_ps_axi_periph_ARADDR;
  assign M03_AXI_arvalid = m03_couplers_to_ps_axi_periph_ARVALID;
  assign M03_AXI_awaddr[31:0] = m03_couplers_to_ps_axi_periph_AWADDR;
  assign M03_AXI_awvalid = m03_couplers_to_ps_axi_periph_AWVALID;
  assign M03_AXI_bready = m03_couplers_to_ps_axi_periph_BREADY;
  assign M03_AXI_rready = m03_couplers_to_ps_axi_periph_RREADY;
  assign M03_AXI_wdata[31:0] = m03_couplers_to_ps_axi_periph_WDATA;
  assign M03_AXI_wstrb[3:0] = m03_couplers_to_ps_axi_periph_WSTRB;
  assign M03_AXI_wvalid = m03_couplers_to_ps_axi_periph_WVALID;
  assign M04_ACLK_1 = M04_ACLK;
  assign M04_ARESETN_1 = M04_ARESETN[0];
  assign M04_AXI_araddr[31:0] = m04_couplers_to_ps_axi_periph_ARADDR;
  assign M04_AXI_arvalid = m04_couplers_to_ps_axi_periph_ARVALID;
  assign M04_AXI_awaddr[31:0] = m04_couplers_to_ps_axi_periph_AWADDR;
  assign M04_AXI_awvalid = m04_couplers_to_ps_axi_periph_AWVALID;
  assign M04_AXI_bready = m04_couplers_to_ps_axi_periph_BREADY;
  assign M04_AXI_rready = m04_couplers_to_ps_axi_periph_RREADY;
  assign M04_AXI_wdata[31:0] = m04_couplers_to_ps_axi_periph_WDATA;
  assign M04_AXI_wstrb[3:0] = m04_couplers_to_ps_axi_periph_WSTRB;
  assign M04_AXI_wvalid = m04_couplers_to_ps_axi_periph_WVALID;
  assign M05_ACLK_1 = M05_ACLK;
  assign M05_ARESETN_1 = M05_ARESETN[0];
  assign M05_AXI_araddr[31:0] = m05_couplers_to_ps_axi_periph_ARADDR;
  assign M05_AXI_arvalid = m05_couplers_to_ps_axi_periph_ARVALID;
  assign M05_AXI_awaddr[31:0] = m05_couplers_to_ps_axi_periph_AWADDR;
  assign M05_AXI_awvalid = m05_couplers_to_ps_axi_periph_AWVALID;
  assign M05_AXI_bready = m05_couplers_to_ps_axi_periph_BREADY;
  assign M05_AXI_rready = m05_couplers_to_ps_axi_periph_RREADY;
  assign M05_AXI_wdata[31:0] = m05_couplers_to_ps_axi_periph_WDATA;
  assign M05_AXI_wstrb[3:0] = m05_couplers_to_ps_axi_periph_WSTRB;
  assign M05_AXI_wvalid = m05_couplers_to_ps_axi_periph_WVALID;
  assign M06_ACLK_1 = M06_ACLK;
  assign M06_ARESETN_1 = M06_ARESETN[0];
  assign M06_AXI_araddr[31:0] = m06_couplers_to_ps_axi_periph_ARADDR;
  assign M06_AXI_arvalid = m06_couplers_to_ps_axi_periph_ARVALID;
  assign M06_AXI_awaddr[31:0] = m06_couplers_to_ps_axi_periph_AWADDR;
  assign M06_AXI_awvalid = m06_couplers_to_ps_axi_periph_AWVALID;
  assign M06_AXI_bready = m06_couplers_to_ps_axi_periph_BREADY;
  assign M06_AXI_rready = m06_couplers_to_ps_axi_periph_RREADY;
  assign M06_AXI_wdata[31:0] = m06_couplers_to_ps_axi_periph_WDATA;
  assign M06_AXI_wstrb[3:0] = m06_couplers_to_ps_axi_periph_WSTRB;
  assign M06_AXI_wvalid = m06_couplers_to_ps_axi_periph_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN[0];
  assign S00_AXI_arready = ps_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = ps_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = ps_axi_periph_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = ps_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = ps_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = ps_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = ps_axi_periph_to_s00_couplers_RID;
  assign S00_AXI_rlast = ps_axi_periph_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = ps_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = ps_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready = ps_axi_periph_to_s00_couplers_WREADY;
  assign m00_couplers_to_ps_axi_periph_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_ps_axi_periph_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_ps_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_ps_axi_periph_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_ps_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_ps_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_ps_axi_periph_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_ps_axi_periph_WREADY = M00_AXI_wready;
  assign m01_couplers_to_ps_axi_periph_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_ps_axi_periph_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_ps_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_ps_axi_periph_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_ps_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_ps_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_ps_axi_periph_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_ps_axi_periph_WREADY = M01_AXI_wready;
  assign m02_couplers_to_ps_axi_periph_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_ps_axi_periph_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_ps_axi_periph_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_ps_axi_periph_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_ps_axi_periph_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_ps_axi_periph_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_ps_axi_periph_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_ps_axi_periph_WREADY = M02_AXI_wready;
  assign m03_couplers_to_ps_axi_periph_ARREADY = M03_AXI_arready;
  assign m03_couplers_to_ps_axi_periph_AWREADY = M03_AXI_awready;
  assign m03_couplers_to_ps_axi_periph_BRESP = M03_AXI_bresp[1:0];
  assign m03_couplers_to_ps_axi_periph_BVALID = M03_AXI_bvalid;
  assign m03_couplers_to_ps_axi_periph_RDATA = M03_AXI_rdata[31:0];
  assign m03_couplers_to_ps_axi_periph_RRESP = M03_AXI_rresp[1:0];
  assign m03_couplers_to_ps_axi_periph_RVALID = M03_AXI_rvalid;
  assign m03_couplers_to_ps_axi_periph_WREADY = M03_AXI_wready;
  assign m04_couplers_to_ps_axi_periph_ARREADY = M04_AXI_arready;
  assign m04_couplers_to_ps_axi_periph_AWREADY = M04_AXI_awready;
  assign m04_couplers_to_ps_axi_periph_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_ps_axi_periph_BVALID = M04_AXI_bvalid;
  assign m04_couplers_to_ps_axi_periph_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_ps_axi_periph_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_ps_axi_periph_RVALID = M04_AXI_rvalid;
  assign m04_couplers_to_ps_axi_periph_WREADY = M04_AXI_wready;
  assign m05_couplers_to_ps_axi_periph_ARREADY = M05_AXI_arready;
  assign m05_couplers_to_ps_axi_periph_AWREADY = M05_AXI_awready;
  assign m05_couplers_to_ps_axi_periph_BRESP = M05_AXI_bresp[1:0];
  assign m05_couplers_to_ps_axi_periph_BVALID = M05_AXI_bvalid;
  assign m05_couplers_to_ps_axi_periph_RDATA = M05_AXI_rdata[31:0];
  assign m05_couplers_to_ps_axi_periph_RRESP = M05_AXI_rresp[1:0];
  assign m05_couplers_to_ps_axi_periph_RVALID = M05_AXI_rvalid;
  assign m05_couplers_to_ps_axi_periph_WREADY = M05_AXI_wready;
  assign m06_couplers_to_ps_axi_periph_ARREADY = M06_AXI_arready;
  assign m06_couplers_to_ps_axi_periph_AWREADY = M06_AXI_awready;
  assign m06_couplers_to_ps_axi_periph_BRESP = M06_AXI_bresp[1:0];
  assign m06_couplers_to_ps_axi_periph_BVALID = M06_AXI_bvalid;
  assign m06_couplers_to_ps_axi_periph_RDATA = M06_AXI_rdata[31:0];
  assign m06_couplers_to_ps_axi_periph_RRESP = M06_AXI_rresp[1:0];
  assign m06_couplers_to_ps_axi_periph_RVALID = M06_AXI_rvalid;
  assign m06_couplers_to_ps_axi_periph_WREADY = M06_AXI_wready;
  assign ps_axi_periph_ACLK_net = ACLK;
  assign ps_axi_periph_ARESETN_net = ARESETN[0];
  assign ps_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign ps_axi_periph_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign ps_axi_periph_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign ps_axi_periph_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign ps_axi_periph_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign ps_axi_periph_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign ps_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign ps_axi_periph_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign ps_axi_periph_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign ps_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign ps_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign ps_axi_periph_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign ps_axi_periph_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign ps_axi_periph_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign ps_axi_periph_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign ps_axi_periph_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign ps_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign ps_axi_periph_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign ps_axi_periph_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign ps_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign ps_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready;
  assign ps_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready;
  assign ps_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign ps_axi_periph_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign ps_axi_periph_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign ps_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign ps_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid;
  m00_couplers_imp_1GIFH4O m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_ps_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_ps_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_ps_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_ps_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_ps_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_ps_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_ps_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_ps_axi_periph_BRESP),
        .M_AXI_bvalid(m00_couplers_to_ps_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_ps_axi_periph_RDATA),
        .M_AXI_rready(m00_couplers_to_ps_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_ps_axi_periph_RRESP),
        .M_AXI_rvalid(m00_couplers_to_ps_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_ps_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_ps_axi_periph_WREADY),
        .M_AXI_wstrb(m00_couplers_to_ps_axi_periph_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_ps_axi_periph_WVALID),
        .S_ACLK(ps_axi_periph_ACLK_net),
        .S_ARESETN(ps_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_5BE6LL m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_ps_axi_periph_ARADDR),
        .M_AXI_arready(m01_couplers_to_ps_axi_periph_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_ps_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_ps_axi_periph_AWADDR),
        .M_AXI_awready(m01_couplers_to_ps_axi_periph_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_ps_axi_periph_AWVALID),
        .M_AXI_bready(m01_couplers_to_ps_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_ps_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_ps_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_ps_axi_periph_RDATA),
        .M_AXI_rready(m01_couplers_to_ps_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_ps_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_ps_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_ps_axi_periph_WDATA),
        .M_AXI_wready(m01_couplers_to_ps_axi_periph_WREADY),
        .M_AXI_wvalid(m01_couplers_to_ps_axi_periph_WVALID),
        .S_ACLK(ps_axi_periph_ACLK_net),
        .S_ARESETN(ps_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_GC57VF m02_couplers
       (.M_ACLK(M02_ACLK_1),
        .M_ARESETN(M02_ARESETN_1),
        .M_AXI_araddr(m02_couplers_to_ps_axi_periph_ARADDR),
        .M_AXI_arready(m02_couplers_to_ps_axi_periph_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_ps_axi_periph_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_ps_axi_periph_AWADDR),
        .M_AXI_awready(m02_couplers_to_ps_axi_periph_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_ps_axi_periph_AWVALID),
        .M_AXI_bready(m02_couplers_to_ps_axi_periph_BREADY),
        .M_AXI_bresp(m02_couplers_to_ps_axi_periph_BRESP),
        .M_AXI_bvalid(m02_couplers_to_ps_axi_periph_BVALID),
        .M_AXI_rdata(m02_couplers_to_ps_axi_periph_RDATA),
        .M_AXI_rready(m02_couplers_to_ps_axi_periph_RREADY),
        .M_AXI_rresp(m02_couplers_to_ps_axi_periph_RRESP),
        .M_AXI_rvalid(m02_couplers_to_ps_axi_periph_RVALID),
        .M_AXI_wdata(m02_couplers_to_ps_axi_periph_WDATA),
        .M_AXI_wready(m02_couplers_to_ps_axi_periph_WREADY),
        .M_AXI_wvalid(m02_couplers_to_ps_axi_periph_WVALID),
        .S_ACLK(ps_axi_periph_ACLK_net),
        .S_ARESETN(ps_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_157OG3U m03_couplers
       (.M_ACLK(M03_ACLK_1),
        .M_ARESETN(M03_ARESETN_1),
        .M_AXI_araddr(m03_couplers_to_ps_axi_periph_ARADDR),
        .M_AXI_arready(m03_couplers_to_ps_axi_periph_ARREADY),
        .M_AXI_arvalid(m03_couplers_to_ps_axi_periph_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_ps_axi_periph_AWADDR),
        .M_AXI_awready(m03_couplers_to_ps_axi_periph_AWREADY),
        .M_AXI_awvalid(m03_couplers_to_ps_axi_periph_AWVALID),
        .M_AXI_bready(m03_couplers_to_ps_axi_periph_BREADY),
        .M_AXI_bresp(m03_couplers_to_ps_axi_periph_BRESP),
        .M_AXI_bvalid(m03_couplers_to_ps_axi_periph_BVALID),
        .M_AXI_rdata(m03_couplers_to_ps_axi_periph_RDATA),
        .M_AXI_rready(m03_couplers_to_ps_axi_periph_RREADY),
        .M_AXI_rresp(m03_couplers_to_ps_axi_periph_RRESP),
        .M_AXI_rvalid(m03_couplers_to_ps_axi_periph_RVALID),
        .M_AXI_wdata(m03_couplers_to_ps_axi_periph_WDATA),
        .M_AXI_wready(m03_couplers_to_ps_axi_periph_WREADY),
        .M_AXI_wstrb(m03_couplers_to_ps_axi_periph_WSTRB),
        .M_AXI_wvalid(m03_couplers_to_ps_axi_periph_WVALID),
        .S_ACLK(ps_axi_periph_ACLK_net),
        .S_ARESETN(ps_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_T97Z7J m04_couplers
       (.M_ACLK(M04_ACLK_1),
        .M_ARESETN(M04_ARESETN_1),
        .M_AXI_araddr(m04_couplers_to_ps_axi_periph_ARADDR),
        .M_AXI_arready(m04_couplers_to_ps_axi_periph_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_ps_axi_periph_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_ps_axi_periph_AWADDR),
        .M_AXI_awready(m04_couplers_to_ps_axi_periph_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_ps_axi_periph_AWVALID),
        .M_AXI_bready(m04_couplers_to_ps_axi_periph_BREADY),
        .M_AXI_bresp(m04_couplers_to_ps_axi_periph_BRESP),
        .M_AXI_bvalid(m04_couplers_to_ps_axi_periph_BVALID),
        .M_AXI_rdata(m04_couplers_to_ps_axi_periph_RDATA),
        .M_AXI_rready(m04_couplers_to_ps_axi_periph_RREADY),
        .M_AXI_rresp(m04_couplers_to_ps_axi_periph_RRESP),
        .M_AXI_rvalid(m04_couplers_to_ps_axi_periph_RVALID),
        .M_AXI_wdata(m04_couplers_to_ps_axi_periph_WDATA),
        .M_AXI_wready(m04_couplers_to_ps_axi_periph_WREADY),
        .M_AXI_wstrb(m04_couplers_to_ps_axi_periph_WSTRB),
        .M_AXI_wvalid(m04_couplers_to_ps_axi_periph_WVALID),
        .S_ACLK(ps_axi_periph_ACLK_net),
        .S_ARESETN(ps_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  m05_couplers_imp_1J8PL66 m05_couplers
       (.M_ACLK(M05_ACLK_1),
        .M_ARESETN(M05_ARESETN_1),
        .M_AXI_araddr(m05_couplers_to_ps_axi_periph_ARADDR),
        .M_AXI_arready(m05_couplers_to_ps_axi_periph_ARREADY),
        .M_AXI_arvalid(m05_couplers_to_ps_axi_periph_ARVALID),
        .M_AXI_awaddr(m05_couplers_to_ps_axi_periph_AWADDR),
        .M_AXI_awready(m05_couplers_to_ps_axi_periph_AWREADY),
        .M_AXI_awvalid(m05_couplers_to_ps_axi_periph_AWVALID),
        .M_AXI_bready(m05_couplers_to_ps_axi_periph_BREADY),
        .M_AXI_bresp(m05_couplers_to_ps_axi_periph_BRESP),
        .M_AXI_bvalid(m05_couplers_to_ps_axi_periph_BVALID),
        .M_AXI_rdata(m05_couplers_to_ps_axi_periph_RDATA),
        .M_AXI_rready(m05_couplers_to_ps_axi_periph_RREADY),
        .M_AXI_rresp(m05_couplers_to_ps_axi_periph_RRESP),
        .M_AXI_rvalid(m05_couplers_to_ps_axi_periph_RVALID),
        .M_AXI_wdata(m05_couplers_to_ps_axi_periph_WDATA),
        .M_AXI_wready(m05_couplers_to_ps_axi_periph_WREADY),
        .M_AXI_wstrb(m05_couplers_to_ps_axi_periph_WSTRB),
        .M_AXI_wvalid(m05_couplers_to_ps_axi_periph_WVALID),
        .S_ACLK(ps_axi_periph_ACLK_net),
        .S_ARESETN(ps_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m05_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m05_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m05_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m05_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m05_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m05_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m05_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m05_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m05_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m05_couplers_RDATA),
        .S_AXI_rready(xbar_to_m05_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m05_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m05_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m05_couplers_WDATA),
        .S_AXI_wready(xbar_to_m05_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m05_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m05_couplers_WVALID));
  m06_couplers_imp_1U9GO7W m06_couplers
       (.M_ACLK(M06_ACLK_1),
        .M_ARESETN(M06_ARESETN_1),
        .M_AXI_araddr(m06_couplers_to_ps_axi_periph_ARADDR),
        .M_AXI_arready(m06_couplers_to_ps_axi_periph_ARREADY),
        .M_AXI_arvalid(m06_couplers_to_ps_axi_periph_ARVALID),
        .M_AXI_awaddr(m06_couplers_to_ps_axi_periph_AWADDR),
        .M_AXI_awready(m06_couplers_to_ps_axi_periph_AWREADY),
        .M_AXI_awvalid(m06_couplers_to_ps_axi_periph_AWVALID),
        .M_AXI_bready(m06_couplers_to_ps_axi_periph_BREADY),
        .M_AXI_bresp(m06_couplers_to_ps_axi_periph_BRESP),
        .M_AXI_bvalid(m06_couplers_to_ps_axi_periph_BVALID),
        .M_AXI_rdata(m06_couplers_to_ps_axi_periph_RDATA),
        .M_AXI_rready(m06_couplers_to_ps_axi_periph_RREADY),
        .M_AXI_rresp(m06_couplers_to_ps_axi_periph_RRESP),
        .M_AXI_rvalid(m06_couplers_to_ps_axi_periph_RVALID),
        .M_AXI_wdata(m06_couplers_to_ps_axi_periph_WDATA),
        .M_AXI_wready(m06_couplers_to_ps_axi_periph_WREADY),
        .M_AXI_wstrb(m06_couplers_to_ps_axi_periph_WSTRB),
        .M_AXI_wvalid(m06_couplers_to_ps_axi_periph_WVALID),
        .S_ACLK(ps_axi_periph_ACLK_net),
        .S_ARESETN(ps_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m06_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m06_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m06_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m06_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m06_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m06_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m06_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m06_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m06_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m06_couplers_RDATA),
        .S_AXI_rready(xbar_to_m06_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m06_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m06_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m06_couplers_WDATA),
        .S_AXI_wready(xbar_to_m06_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m06_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m06_couplers_WVALID));
  s00_couplers_imp_12IK0DL s00_couplers
       (.M_ACLK(ps_axi_periph_ACLK_net),
        .M_ARESETN(ps_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(ps_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arburst(ps_axi_periph_to_s00_couplers_ARBURST),
        .S_AXI_arcache(ps_axi_periph_to_s00_couplers_ARCACHE),
        .S_AXI_arid(ps_axi_periph_to_s00_couplers_ARID),
        .S_AXI_arlen(ps_axi_periph_to_s00_couplers_ARLEN),
        .S_AXI_arlock(ps_axi_periph_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(ps_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arqos(ps_axi_periph_to_s00_couplers_ARQOS),
        .S_AXI_arready(ps_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arsize(ps_axi_periph_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(ps_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(ps_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awburst(ps_axi_periph_to_s00_couplers_AWBURST),
        .S_AXI_awcache(ps_axi_periph_to_s00_couplers_AWCACHE),
        .S_AXI_awid(ps_axi_periph_to_s00_couplers_AWID),
        .S_AXI_awlen(ps_axi_periph_to_s00_couplers_AWLEN),
        .S_AXI_awlock(ps_axi_periph_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(ps_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awqos(ps_axi_periph_to_s00_couplers_AWQOS),
        .S_AXI_awready(ps_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awsize(ps_axi_periph_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(ps_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bid(ps_axi_periph_to_s00_couplers_BID),
        .S_AXI_bready(ps_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(ps_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(ps_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(ps_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rid(ps_axi_periph_to_s00_couplers_RID),
        .S_AXI_rlast(ps_axi_periph_to_s00_couplers_RLAST),
        .S_AXI_rready(ps_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(ps_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(ps_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(ps_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wid(ps_axi_periph_to_s00_couplers_WID),
        .S_AXI_wlast(ps_axi_periph_to_s00_couplers_WLAST),
        .S_AXI_wready(ps_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(ps_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(ps_axi_periph_to_s00_couplers_WVALID));
  system_xbar_0 xbar
       (.aclk(ps_axi_periph_ACLK_net),
        .aresetn(ps_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m06_couplers_ARADDR,xbar_to_m05_couplers_ARADDR,xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arready({xbar_to_m06_couplers_ARREADY,xbar_to_m05_couplers_ARREADY,xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m06_couplers_ARVALID,xbar_to_m05_couplers_ARVALID,xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m06_couplers_AWADDR,xbar_to_m05_couplers_AWADDR,xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awready({xbar_to_m06_couplers_AWREADY,xbar_to_m05_couplers_AWREADY,xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m06_couplers_AWVALID,xbar_to_m05_couplers_AWVALID,xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m06_couplers_BREADY,xbar_to_m05_couplers_BREADY,xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m06_couplers_BRESP,xbar_to_m05_couplers_BRESP,xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m06_couplers_BVALID,xbar_to_m05_couplers_BVALID,xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m06_couplers_RDATA,xbar_to_m05_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m06_couplers_RREADY,xbar_to_m05_couplers_RREADY,xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m06_couplers_RRESP,xbar_to_m05_couplers_RRESP,xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m06_couplers_RVALID,xbar_to_m05_couplers_RVALID,xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m06_couplers_WDATA,xbar_to_m05_couplers_WDATA,xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m06_couplers_WREADY,xbar_to_m05_couplers_WREADY,xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m06_couplers_WSTRB,xbar_to_m05_couplers_WSTRB,xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,NLW_xbar_m_axi_wstrb_UNCONNECTED[11:4],xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m06_couplers_WVALID,xbar_to_m05_couplers_WVALID,xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule
