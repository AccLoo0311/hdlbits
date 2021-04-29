/*module bcd_fadd {
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
*/


module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [2:0]c_out;
    bcd_fadd bcd_fadd_inst0 (.a(a[3:0]),.b(b[3:0]),.cin(cin),.cout(c_out[0]),.sum(sum[3:0]));
    bcd_fadd bcd_fadd_inst1 (.a(a[7:4]),.b(b[7:4]),.cin(c_out[0]),.cout(c_out[1]),.sum(sum[7:4]));
    bcd_fadd bcd_fadd_inst2 (.a(a[11:8]),.b(b[11:8]),.cin(c_out[1]),.cout(c_out[2]),.sum(sum[11:8]));
    bcd_fadd bcd_fadd_inst3 (.a(a[15:12]),.b(b[15:12]),.cin(c_out[2]),.cout(cout),.sum(sum[15:12]));
    


endmodule