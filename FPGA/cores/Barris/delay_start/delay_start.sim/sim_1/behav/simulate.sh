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
ExecStep $xv_path/bin/xsim delay_start_behav -key {Behavioral:sim_1:Functional:delay_start} -tclbatch delay_start.tcl -log simulate.log
