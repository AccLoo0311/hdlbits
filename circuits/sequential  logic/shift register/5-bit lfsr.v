module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 5'h1
    output [4:0] q
); 
    reg [4:0] q1;
    assign q = q1;
always @(posedge clk ) begin
    if (reset) begin
        q1<=5'h1;
    end
    else begin
        q1[4]<=q1[0]^1'b0;
        q1[3]<=q1[4];
        q1[2]<=q1[0]^q1[3];
        q1[1]<=q1[2];
        q1[0]<=q1[1];
    end

end
endmodule

