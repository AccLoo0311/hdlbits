module sub_mudule(
    input clk,
    input l,
    input r0,
    input r1,
    output q
    );
    reg d;
    assign q = d;
    always @(posedge clk ) begin
        d<=(l==1'b0)?r0:r1;
    end
endmodule

module top_module (
    input [2:0] SW,      // R
    input [1:0] KEY,     // L and clk
    output [2:0] LEDR);  // Q
    sub_mudule sub_mudule_inst1(.clk(KEY[0]),.l(KEY[1]),.r0(LEDR[2]),.r1(SW[0]),.q(LEDR[0]));
    sub_mudule sub_mudule_inst2(.clk(KEY[0]),.l(KEY[1]),.r0(LEDR[0]),.r1(SW[1]),.q(LEDR[1]));
    sub_mudule sub_mudule_inst3(.clk(KEY[0]),.l(KEY[1]),.r0(LEDR[2]^LEDR[1]),.r1(SW[2]),.q(LEDR[2]));

endmodule

