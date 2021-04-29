/*使用generate语句批量例化
*/
module full_adder(
    input a,
    input b,
    input in,
    output sum,
    output out
    );
    assign sum = a^b^in;
    assign out = (a&b)|(a&in)|(b&in);
endmodule
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    full_adder full_adder_inst1(.a(a[0]),.b(b[0]),.in(cin),.sum(sum[0]),.out(cout[0]));
    generate
        genvar i;//i是一个变量，该变量类型只能在generate语句内使用
        for (i = 1; i < 100; i = i + 1)
        begin:add_100//add_100是一个标签，这个标签是实例名称
            full_adder full_adder_inst(.a(a[i]),.b(b[i]),.in(cout[i-1]),.sum(sum[i]),.out(cout[i]));
        end
    endgenerate
    


endmodule

