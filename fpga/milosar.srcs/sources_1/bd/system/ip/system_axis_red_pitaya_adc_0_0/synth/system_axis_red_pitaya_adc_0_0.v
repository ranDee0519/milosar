// (c) Copyright 1995-2017 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: pavel-demin:user:axis_red_pitaya_adc:1.0.16
// IP Revision: 6

(* X_CORE_INFO = "axis_red_pitaya_adc,Vivado 2016.2" *)
(* CHECK_LICENSE_TYPE = "system_axis_red_pitaya_adc_0_0,axis_red_pitaya_adc,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_axis_red_pitaya_adc_0_0 (
  adc_clk,
  aresetn,
  adc_csn,
  int_clk,
  adc_dat_a,
  adc_dat_b,
  m00_axis_tvalid,
  m00_axis_tdata,
  m01_axis_tvalid,
  m01_axis_tdata
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 adc_clk CLK" *)
output wire adc_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
input wire aresetn;
output wire adc_csn;
input wire int_clk;
input wire [13 : 0] adc_dat_a;
input wire [13 : 0] adc_dat_b;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m00_axis TVALID" *)
output wire m00_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m00_axis TDATA" *)
output wire [15 : 0] m00_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m01_axis TVALID" *)
output wire m01_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m01_axis TDATA" *)
output wire [15 : 0] m01_axis_tdata;

  axis_red_pitaya_adc #(
    .ADC_DATA_WIDTH(14),
    .AXIS_TDATA_WIDTH(16)
  ) inst (
    .adc_clk(adc_clk),
    .aresetn(aresetn),
    .adc_csn(adc_csn),
    .int_clk(int_clk),
    .adc_dat_a(adc_dat_a),
    .adc_dat_b(adc_dat_b),
    .m00_axis_tvalid(m00_axis_tvalid),
    .m00_axis_tdata(m00_axis_tdata),
    .m01_axis_tvalid(m01_axis_tvalid),
    .m01_axis_tdata(m01_axis_tdata)
  );
endmodule
