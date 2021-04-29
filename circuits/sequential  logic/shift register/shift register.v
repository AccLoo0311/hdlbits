module sub_mudule(
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg out1;
    assign out = out1;
    always @(posedge clk ) begin
        if (!resetn) begin
            out1<=1'b0;
        end
        else begin
            out1<=in;
        end
    end
endmodule


module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    wire [2:0]q;
    sub_mudule sub_mudule_inst0(.clk(clk),.resetn(resetn),.in(in),.out(q[0]));
    sub_mudule sub_mudule_inst1(.clk(clk),.resetn(resetn),.in(q[0]),.out(q[1]));
    sub_mudule sub_mudule_inst2(.clk(clk),.resetn(resetn),.in(q[1]),.out(q[2]));
    sub_mudule sub_mudule_inst3(.clk(clk),.resetn(resetn),.in(q[2]),.out(out));
endmodule

