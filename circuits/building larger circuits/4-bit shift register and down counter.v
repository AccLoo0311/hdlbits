module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output reg [3:0] q);
    integer i;
    always @(posedge clk ) begin
        if (shift_ena) begin
            q[0]<=data;
            for(i=1;i<4;i=i+1)
            begin
                q[i]<=q[i-1];
            end
        end
        if (count_ena) begin
            q<=q-1'b1;
        end
    end
endmodule

