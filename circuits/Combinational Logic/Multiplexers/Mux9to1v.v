module top_module( 
    input [15:0] a, b, c, d, e, f, g, h, i,
    input [3:0] sel,
    output [15:0] out );
    reg [15:0] out_1;
    assign out = out_1;
    always @(*) begin
        case(sel)
            0:out_1=a;
            1:out_1=b;
            2:out_1=c;
            3:out_1=d;
            4:out_1=e;
            5:out_1=f;
            6:out_1=g;
            7:out_1=h;
            8:out_1=i;
            default:out_1=16'hff_ff;
        endcase
end
endmodule

