module MUXDFF (
    input clk,
    input w, R, E, L,
    output Q
);
    wire mux1;
    wire mux2;
    assign mux1 = E==0? Q:w;
    assign mux2 = L==0? mux1:R;
    always @(posedge clk) begin
        Q <= mux2;
        end
endmodule

module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    MUXDFF MUXDFFinst0(.clk(KEY[0]),.w(KEY[3]),.R(SW[3]),.E(KEY[1]),.L(KEY[2]),.Q(LEDR[3]));
    MUXDFF MUXDFFinst1(.clk(KEY[0]),.w(LEDR[3]),.R(SW[2]),.E(KEY[1]),.L(KEY[2]),.Q(LEDR[2]));
    MUXDFF MUXDFFinst2(.clk(KEY[0]),.w(LEDR[2]),.R(SW[1]),.E(KEY[1]),.L(KEY[2]),.Q(LEDR[1]));
    MUXDFF MUXDFFinst3(.clk(KEY[0]),.w(LEDR[1]),.R(SW[0]),.E(KEY[1]),.L(KEY[2]),.Q(LEDR[0]));


endmodule





