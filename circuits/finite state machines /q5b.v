module top_module (
    input clk,
    input areset,
    input x,
    output reg z
); 
parameter a=2'b01;
parameter b=2'b10;
reg [1:0]state;
reg [1:0]next;
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
    a:begin
        if (~x) begin
            next=a;
            z=0;
        end
        else begin
            next=b;
            z=1;
        end
    end
    b:begin
        if (x) begin
            next=b;
            z=0;
        end
        else begin
            next=b;
            z=1;
        end
    end
    default:begin
        next=a;
        z=1;
    end
    endcase
end
endmodule
