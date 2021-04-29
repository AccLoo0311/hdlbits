module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    parameter a=6'b000001;
    parameter b=6'b000010;
    parameter c=6'b000100;
    parameter d=6'b001000;
    parameter e=6'b010000;
    parameter f=6'b100000;
    reg[5:0]state;
    reg[5:0]next;
    always @(posedge clk ) begin
        if (reset) begin
            state<=a;
        end
        else  begin
            state<=next;
        end
    end
    always @(*) begin
        case(state)
        a:next=(w)?a:b;
        b:next=(w)?d:c;
        c:next=(w)?d:e;
        d:next=(w)?a:f;
        e:next=(w)?d:e;
        f:next=(w)?d:c;
        endcase
    end
    assign z = (state==e|state==f);
endmodule

