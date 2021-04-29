`timescale 1ps/1ps
/*
module andgate (
    input [1:0] in,
    output out
);
*/
module top_module();
    reg [1:0]in;
    reg out;
    initial begin
        in[0]=0;
        in[1]=0;
        #10 in[0]=1;
        #10 in[0]=0;
        in[1]=1;
        #10 in[0]=1;
    end
    andgate andgate_inst(
        .in(in),
        .out(out));

endmodule

