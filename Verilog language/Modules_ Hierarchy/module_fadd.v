module top_module (
    //module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire add16_1_cout;
    add16 add16_inst1(.a(a[15:0]),.b(b[15:0]),.cin(1'd0),.sum(sum[15:0]),.cout(add16_1_cout));
    add16 add16_inst2(.a(a[31:16]),.b(b[31:16]),.cin(add16_1_cout),.sum(sum[31:16]),.cout());
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );
// Full adder module here
    assign sum =a^b^cin;
    assign cout = (a&b)|(a&cin)|(b&cin);
endmodule

