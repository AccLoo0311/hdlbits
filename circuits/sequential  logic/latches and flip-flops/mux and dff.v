module top_module (
    input clk,
    input L,
    input r_in,
    input q_in,
    output reg Q);
    always @(posedge clk ) begin
        Q<= (L == 0) ? q_in:r_in;
        end
endmodule

