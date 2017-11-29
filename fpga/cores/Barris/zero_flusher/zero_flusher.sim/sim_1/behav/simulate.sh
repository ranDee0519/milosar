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
ExecStep $xv_path/bin/xsim zero_flusher_behav -key {Behavioral:sim_1:Functional:zero_flusher} -tclbatch zero_flusher.tcl -log simulate.log
