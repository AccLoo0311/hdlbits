module top_module(
    input clk,
    input reset,    // Active-high synchronous reset to 32'h1
    output [31:0] q
); 
    reg [32:0] q1;
    initial begin
        q1[32]=1'b0;
    end
    assign q = q1[31:0];
    integer i;
    always @(posedge clk ) begin
        if (reset) begin
            q1<=32'h1;
        end
        else begin
            for(i=0;i<32;i=i+1)
            begin
                if (i==31|i==21|i==1|i==0) begin
                    q1[i]<=q1[i+1]^q1[0];
                end
                else begin
                    q1[i]<=q1[i+1];
                end
            end
        end
    end
endmodule

