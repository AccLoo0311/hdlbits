module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
    wire [31:0] b_xnor;
    wire add16_1_cout;
    assign b_xnor = b^{32{sub}};
    add16 add16_inst1(.a(a[15:0]),.b(b_xnor[15:0]),.cin(sub),.sum(sum[15:0]),.cout(add16_1_cout));
    add16 add16_inst2(.a(a[31:16]),.b(b_xnor[31:16]),.cin(add16_1_cout),.sum(sum[31:16]),.cout());

endmodule

