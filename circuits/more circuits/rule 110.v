module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q
); 
    integer i;
    reg[512:-1]q_tem;
    reg [511:0]q1;
    assign q = q1;
    initial begin
        q_tem[-1]=1'b0;
        q_tem[512]=1'b0;
    end
    always @(posedge clk) begin
        q_tem[511:0]=q1;
        if (load) begin
            q1<=data;
        end
        else begin
            for(i=0;i<512;i=i+1)
                begin
                    q1[i]<=((~q1[i]&q_tem[i-1])|(~q_tem[i+1]&q1[i])|(q1[i]&~q_tem[i-1]));
                end
        end
    end
endmodule

