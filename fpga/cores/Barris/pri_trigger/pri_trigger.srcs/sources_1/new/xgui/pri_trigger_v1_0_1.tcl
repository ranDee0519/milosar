# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  ipgui::add_page $IPINST -name "Page 0"

  ipgui::add_param $IPINST -name "COUNTER_WIDTH"
  ipgui::add_param $IPINST -name "OFFSET_WIDTH"

}

proc update_PARAM_VALUE.COUNTER_WIDTH { PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to update COUNTER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.COUNTER_WIDTH { PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to validate COUNTER_WIDTH
	return true
}

proc update_PARAM_VALUE.OFFSET_WIDTH { PARAM_VALUE.OFFSET_WIDTH } {
	# Procedure called to update OFFSET_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.OFFSET_WIDTH { PARAM_VALUE.OFFSET_WIDTH } {
	# Procedure called to validate OFFSET_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.COUNTER_WIDTH { MODELPARAM_VALUE.COUNTER_WIDTH PARAM_VALUE.COUNTER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.COUNTER_WIDTH}] ${MODELPARAM_VALUE.COUNTER_WIDTH}
}

proc update_MODELPARAM_VALUE.OFFSET_WIDTH { MODELPARAM_VALUE.OFFSET_WIDTH PARAM_VALUE.OFFSET_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.OFFSET_WIDTH}] ${MODELPARAM_VALUE.OFFSET_WIDTH}
}

