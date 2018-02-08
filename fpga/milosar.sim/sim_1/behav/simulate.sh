#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2016.2"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim tb_frequency_divider_behav -key {Behavioral:sim_1:Functional:tb_frequency_divider} -tclbatch tb_frequency_divider.tcl -log simulate.log
