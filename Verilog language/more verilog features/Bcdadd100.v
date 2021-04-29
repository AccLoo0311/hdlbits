/*module bcd_fadd {
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
    */
module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [99:0]carry;
    bcd_fadd bcd_fadd_inst0 (.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(carry[0]),.sum(sum[3:0]));
    assign cout = carry[99];
    generate
        genvar i;
        for (i = 1; i < 100; i = i + 1)
        begin:bcd_fadd_inst
        bcd_fadd bcd_fadd_inst1 (.a(a[i*4+3:i*4]),.b(b[i*4+3:i*4]),.cin(carry[i-1]),.cout(carry[i]),.sum(sum[i*4+3:i*4]));
        end
    endgenerate

endmodule

