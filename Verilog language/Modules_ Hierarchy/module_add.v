module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
//module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
    wire add1_out;
    add16 add16_inst1(.a(a[15:0]),.b(b[15:0]),.cin(1'd0),.sum(sum[15:0]),.cout(add1_out));
    add16 add16_inst2(.a(a[31:16]),.b(b[31:16]),.cin(add1_out),.sum(sum[31:16]),.cout());
endmodule

