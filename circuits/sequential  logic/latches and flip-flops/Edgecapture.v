module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);  integer i;
    reg [31:0] in_1;
    reg [31:0] out_1;
    assign out = out_1;
always @(posedge clk ) begin
    if (reset) begin
        out_1<=32'd0;
        in_1<=in;
    end
    else begin
        for(i=0;i<32;i=i+1)
            begin
                if (out_1[i]) begin
                    out_1[i]<=out_1[i];
                end
                else begin
                    out_1[i]<=(in[i]^in_1[i])&(in[i]==1'b0);
                end
            end
        in_1<=in;
    end
end
endmodule

