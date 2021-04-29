module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
parameter a=2'b001;
parameter b=2'b010;
parameter c=3'b100;
reg[2:0]state;
reg[2:0]next;
always @(posedge clk or posedge areset) begin
    if (areset) begin
        state<=a;
    end
    else begin
        state<=next;
    end
end
always @(*) begin
    case(state)
    a:next=(x)?b:a;
    b:next=(x)?c:b;
    c:next=(x)?c:b;
    default:next=a;
    endcase
end
assign z = (state==b);
endmodule