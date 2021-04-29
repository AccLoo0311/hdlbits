/*
module q7 (
    input clk,
    input in,
    input [2:0] s,
    output out
);

*/
`timescale 1ps/1ps
module top_module();
    reg clk;
    reg in;
    reg [2:0] s;
    reg out;
    initial begin
        clk=0;
        in=0;
        s=3'd2;
        #10 s=3'd6;
        #10 s=3'd2;
        in=1;
        #10 s=3'd7;
        in=0;
        #10 in=1;
        s=3'd0;
        #30 in=0;
    end
    always #5 clk=~clk;
    q7 q7_inst(
        .clk(clk),
        .in(in),
        .s(s),
        .out(out)
        );
endmodule