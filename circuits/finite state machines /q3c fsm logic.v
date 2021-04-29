module top_module (
    input clk,//没用
    input [2:0] y,
    input x,
    output reg Y0,
    output reg z
);
    always @(*) begin
            case(y)
            3'b000:begin
                if (x) begin
                    Y0<=1;
                end
                else begin
                    Y0<=0;
                end
            end
            3'b001:begin
                if (~x) begin
                    Y0<=1;
                end
                else begin
                    Y0<=0;
                end
            end
            3'b010:begin
                if (x) begin
                    Y0<=1;
                end
                else begin
                    Y0<=0;
                end
            end
            3'b011:begin
                if (~x) begin
                    Y0<=1;
                end
                else begin
                    Y0<=0;
                end
            end
            3'b100:begin
                if (~x) begin
                    Y0<=1;
                end
                else begin
                    Y0<=0;
                end
                end
                default:Y0<=0;
            endcase
    end
    always @(*) begin
        if (y==3'b011||y==3'b100) begin
            z<=1;
        end
        else begin
            z<=0;
        end
    end
endmodule

