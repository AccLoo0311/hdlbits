module full_adder( 
    input a, b, cin,
    output cout, sum );
    assign cout = (a&b)|(a&cin)|(b&cin);
    assign sum = a^b^cin;
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );
    full_adder full_adder_inst0(.a(a[0]),.b(b[0]),.cin(cin),.cout(cout[0]),.sum(sum[0]));
    full_adder full_adder_inst1(.a(a[1]),.b(b[1]),.cin(cout[0]),.cout(cout[1]),.sum(sum[1]));
    full_adder full_adder_inst2(.a(a[2]),.b(b[2]),.cin(cout[1]),.cout(cout[2]),.sum(sum[2]));


endmodule

