module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter a=2'b01;
    parameter b=2'b10;
    reg[1:0]sta;
    reg[1:0]next;
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            sta<=a;
        end
        else begin
            sta<=next;
        end
    end
    always @(*) begin
        case(sta)
        a:next=(x)?b:a;
        b:next=b;
        endcase
    end
    assign z = (sta==a&x)|(sta==b&~x);
endmodule

