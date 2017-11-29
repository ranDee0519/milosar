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
ExecStep $xv_path/bin/xsim clock_source_mux_behav -key {Behavioral:sim_1:Functional:clock_source_mux} -tclbatch clock_source_mux.tcl -log simulate.log
