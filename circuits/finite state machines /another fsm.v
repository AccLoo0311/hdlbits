module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter a    =9'b000_000_001;
    parameter f1   =9'b000_000_010;
    parameter x1   =9'b000_000_100;
    parameter x0   =9'b000_001_000;
    parameter x10  =9'b000_010_000;
    parameter x101 =9'b000_100_000;
    parameter g1   =9'b001_000_000;
    parameter g0   =9'b010_000_000;
    parameter g1_y0=9'b100_000_000;
    reg [8:0]state;
    reg [8:0]next;
    always @(posedge clk ) begin
        if (!resetn) begin
            state<=a;
        end
        else begin
            state<=next;
        end
    end
    always @(*) begin
        case(state)
        a    :next=f1;
        f1   :begin
            if (x) begin
                next=x1;
            end
            else begin
                next=x0;
            end
        end
        x1   :begin
            if (x) begin
                next=x1;
            end
            else begin
                next=x10;
            end
        end
        x0   :begin
            if (x) begin
                next=x1;
            end
            else begin
                next=x0;
            end
        end
        x10  :begin
            if (x) begin
                next=x101;
            end
            else begin
                next=x0;
            end
        end
        x101 :begin
            if (y) begin
                next=g1;
            end
            else begin
                next=g1_y0;
            end
        end
        g1   :next=g1;
        g0   :next=g0;
        g1_y0:begin
            if (y) begin
                next=g1;
            end
            else begin
                next=g0;
            end
        end
        default:next=a;
        endcase
    end
assign f = (state==f1)?1:0;
assign g = (state==g1_y0||state==g1||state==x101)?1:0;
endmodule

