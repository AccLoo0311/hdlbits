//101序列检测器，序列可重叠
module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    parameter a=3'b001;
    parameter b=3'b010;
    parameter c=3'b100;
    reg [2:0]sta;
    reg [2:0]next;
    always @(posedge clk or negedge aresetn) begin
        if (!aresetn) begin
            sta<=a;
        end
        else  begin
            sta<=next;
        end
    end
    always @(*) begin
        case(sta)
        a:next=(x)?b:a;
        b:next=(x)?b:c;
        c:next=(x)?b:a;
        endcase
    end
    assign z = (sta==c&&x==1'b1);
endmodule

