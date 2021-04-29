module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    parameter a=000001;
    parameter b=000010; 
    parameter c=000100; 
    parameter d=001000;
    parameter e=010000; 
    parameter f=100000;
    reg [6:1] next;
    always @(*) begin
        case(y)
        a:next=(w)?a:b;
        b:next=(w)?d:c;
        c:next=(w)?d:e;
        d:next=(w)?a:f;
        e:next=(w)?d:e;
        f:next=(w)?d:c;
        endcase
    end
    assign Y2 = next[1];
    assign Y4 = next[3];
endmodule

