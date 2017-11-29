`timescale 1ns / 1ps


module slave_starter(
        input wire sys_enable,
        input wire is_slave,
        input wire slave_enable,
        
        output wire enabled
    );
    
    assign enabled = (sys_enable && ~is_slave) || (sys_enable && is_slave && slave_enable);
endmodule
