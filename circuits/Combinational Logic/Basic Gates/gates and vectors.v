//版本1、版本2均正确
module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    reg [3:0] out_different_1;
    reg [2:0]out_both_1;
    reg [3:1] out_any_1;
    assign out_different = out_different_1;
    assign out_both = out_both_1;
    assign out_any = out_any_1;
    integer i;
    always @(*) begin
    out_both_1=3'b0;
    for(i=0;i<3;i=i+1)
        begin
            out_both_1[i]=(in[i]&in[i+1]);
            out_any_1[i+1]=(in[i]|in[i+1]);
            out_different_1[i]=(in[i]^in[i+1]);
        end
    out_different_1[3]=in[3]^in[0];
    end
endmodule
//版本2
module top_module( 
    input [3:0] in,
    output [2:0] out_both,
    output [3:1] out_any,
    output [3:0] out_different );
    assign out_both = {(in[2]&in[3]),(in[1]&in[2]),(in[0]&in[1])};
    assign out_any = {in[2]|in[3],in[1]|in[2],in[0]|in[1]};
    assign out_different = {(in[3]^in[0]),(in[2]^in[3]),(in[1]^in[2]),(in[0]^in[1])};
endmodule

