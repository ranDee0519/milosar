# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CAPACITY_ENTRIES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CAPACITY_WIDTH" -parent ${Page_0}

  ipgui::add_param $IPINST -name "COUNTER_WIDTH"
  ipgui::add_param $IPINST -name "SWITCH_GAP_WIDTH"

}

proc update_PARAM_VALUE.AXI_DATA_WIDTH { PARAM_VALUE.AXI_DATA_WIDTH } {
	# Procedure called to update AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_DATA_WIDTH { PARAM_VALUE.AXI_DATA_WIDTH } {
	# Procedure called to validate AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.CAPACITY_ENTRIES { PARAM_VALUE.CAPACITY_ENTRIES } {
	# Procedure called to update CAPACITY_ENTRIES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CAPACITY_ENTRIES { PARAM_VALUE.CAPACITY_ENTRIES } {
	# Procedure called to validate CAPACITY_ENTRIES
	return true
}

proc update_PARAM_VALUE.CAPACITY_WIDTH { PARAM_VALUE.CAPACITY_WIDTH } {
	# Procedure called to update CAPACITY_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CAPACITY_WIDTH { PARAM_VALUE.CAPACITY_WIDTH } {
	# Procedure called to validate CAPACITY_WIDTH
	return true
}

proc update_PARAM_VALUE.COUNTER_WIDTH { PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to update COUNTER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COUNTER_WIDTH { PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to validate COUNTER_WIDTH
	return true
}

proc update_PARAM_VALUE.SWITCH_GAP_WIDTH { PARAM_VALUE.SWITCH_GAP_WIDTH } {
	# Procedure called to update SWITCH_GAP_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.SWITCH_GAP_WIDTH { PARAM_VALUE.SWITCH_GAP_WIDTH } {
	# Procedure called to validate SWITCH_GAP_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.CAPACITY_WIDTH { MODELPARAM_VALUE.CAPACITY_WIDTH PARAM_VALUE.CAPACITY_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CAPACITY_WIDTH}] ${MODELPARAM_VALUE.CAPACITY_WIDTH}
}

proc update_MODELPARAM_VALUE.CAPACITY_ENTRIES { MODELPARAM_VALUE.CAPACITY_ENTRIES PARAM_VALUE.CAPACITY_ENTRIES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CAPACITY_ENTRIES}] ${MODELPARAM_VALUE.CAPACITY_ENTRIES}
}

proc update_MODELPARAM_VALUE.AXI_DATA_WIDTH { MODELPARAM_VALUE.AXI_DATA_WIDTH PARAM_VALUE.AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.COUNTER_WIDTH { MODELPARAM_VALUE.COUNTER_WIDTH PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COUNTER_WIDTH}] ${MODELPARAM_VALUE.COUNTER_WIDTH}
}

proc update_MODELPARAM_VALUE.SWITCH_GAP_WIDTH { MODELPARAM_VALUE.SWITCH_GAP_WIDTH PARAM_VALUE.SWITCH_GAP_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.SWITCH_GAP_WIDTH}] ${MODELPARAM_VALUE.SWITCH_GAP_WIDTH}
}

