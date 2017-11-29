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
ExecStep $xv_path/bin/xsim pri_trigger_behav -key {Behavioral:sim_1:Functional:pri_trigger} -tclbatch pri_trigger.tcl -log simulate.log
