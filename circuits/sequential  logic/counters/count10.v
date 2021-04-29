module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    reg [3:0] q1;
    assign q = q1;
    always @(posedge clk ) begin
        if (reset) begin
            q1<=0;
        end
        else if (q1==4'd9) begin
            q1<=0;
        end
            else begin
                q1<=q1+1;
            end
    end
endmodule

