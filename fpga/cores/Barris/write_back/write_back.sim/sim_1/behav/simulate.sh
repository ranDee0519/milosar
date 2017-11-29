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
ExecStep $xv_path/bin/xsim write_back_behav -key {Behavioral:sim_1:Functional:write_back} -tclbatch write_back.tcl -log simulate.log
