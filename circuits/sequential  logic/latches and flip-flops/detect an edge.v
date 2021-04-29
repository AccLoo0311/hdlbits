module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0]pedge_1;
    reg [7:0]in_1;
    integer i;
    assign pedge = pedge_1;
    always @(posedge clk) begin
        for (i=0;i<8;i=i+1)
        begin
            pedge_1[i]<=(in[i]^in_1[i])&in[i];
        end
        in_1<=in;


    end

endmodule

