module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
//y[5:0] = 000001(A), 000010(B), 000100(C), 001000(D), 010000(E), 100000(F)
    /*parameter a=6'b000001;
    parameter b=6'b000010;
    parameter c=6'b000100;
    parameter d=6'b001000;
    parameter e=6'b010000;
    parameter f=6'b100000;
    reg [5:0]next;
    always @(*) begin
        case(y)
        a:next=(w)?a:b;
        b:next=(w)?d:c;
        c:next=(w)?d:e;
        d:next=(w)?a:f;
        e:next=(w)?d:e;
        f:next=(w)?d:c;
        endcase
    end*/
    assign Y1 = y[0]&w;
    assign Y3 = y[1]&~w|y[2]&~w|y[4]&~w|y[5]&~w;
endmodule

