# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir /home/tighe/Desktop/redmasters/FPGA_Xilinx/Cores/Barris/dropper/dropper.cache/wt [current_project]
set_property parent.project_path /home/tighe/Desktop/redmasters/FPGA_Xilinx/Cores/Barris/dropper/dropper.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
read_verilog -library xil_defaultlib /home/tighe/Desktop/redmasters/FPGA_Xilinx/Cores/Barris/dropper/dropper.srcs/sources_1/new/dropper.v
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

synth_design -top dropper -part xc7z010clg400-1


write_checkpoint -force -noxdef dropper.dcp

catch { report_utilization -file dropper_utilization_synth.rpt -pb dropper_utilization_synth.pb }
