/*module tff (
    input clk,
    input reset,   // active-high synchronous reset
    input t,       // toggle
    output q
);
*/
`timescale 1ps/1ps
module top_module ();
    reg t;
    reg q;
    reg clk;
    reg reset;
    initial begin
        clk=0;
        reset=0;
        t=0;
        #5 reset=1;
        #10 reset=0;
        t=1;
    end
    always #5 clk=~clk;
    tff tff_inst(
    .clk(clk),
    .reset(reset),   // active-high synchronous reset
    .t(t),       // toggle
    .q(q)
);
endmodule

