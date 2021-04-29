module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    parameter a= 4'b0001;
    parameter b1=4'b0010;
    parameter b2=4'b0100;
    parameter b3=4'b1000;
    reg [3:0]state;
    reg [3:0]next;
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
        a:next=(s)?b1:a;
        b1:next=b2;
        b2:next=b3;
        b3:next=b1;
        default:next=a;
        endcase
    end
    reg [1:0]count_w;
    always @(posedge clk ) begin//计数器
        if (reset) begin
            count_w<=2'd0;
        end
        else if(state==b1) begin
            count_w<=w;
        end
        else if (state==b2||state==b3) begin
            count_w<=count_w+w;
        end
    end
assign z = (count_w==2'd2&&state==b1);
endmodule

