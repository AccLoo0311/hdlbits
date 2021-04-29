module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);
    parameter a=6'b000_001;
    parameter b=6'b000_010;
    parameter c=6'b000_100;
    parameter d=6'b001_000;
    parameter e=6'b010_000;
    parameter f=6'b100_000;
    reg [5:0]state;
    reg [5:0]next;
    always @(posedge clk ) begin
        if (reset) begin
            state<=a;
        end
        else begin
            state<=next;
        end
    end
    always @(*) begin
        case(state)
        a:next=(w)?b:a;
        b:next=(w)?c:d;
        c:next=(w)?e:d;
        d:next=(w)?f:a;
        e:next=(w)?e:d;
        f:next=(w)?c:d;
        endcase
    end
    assign z = (state==e|state==f);
endmodule

