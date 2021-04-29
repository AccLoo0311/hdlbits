module top_module (
    input [3:1] y,
    input w,
    output reg Y2);
    parameter a=3'b000;
    parameter b=3'b001;
    parameter c=3'b010;
    parameter d=3'b011;
    parameter e=3'b100;
    parameter f=3'b101;
    always @(*) begin
        case(y)
        b:Y2<=1;
        c:begin
            if (w) begin
                Y2<=1;
            end
            else begin
                Y2<=0;
            end
        end
        e:begin
            if (w) begin
                Y2<=1;
            end
            else begin
                Y2<=0;
            end
        end
        f:Y2<=1;
        default:Y2<=0;
        endcase
    end
endmodule

