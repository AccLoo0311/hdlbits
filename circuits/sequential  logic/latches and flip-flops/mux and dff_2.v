module top_module (
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

