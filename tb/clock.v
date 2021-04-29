`timescale 1ps/1ps
module top_module();
    reg clock;
    initial begin
        clock=0;
    end
    always #5 clock=~clock;
    dut dut_inst ( .clk(clock) ) ;
endmodule

