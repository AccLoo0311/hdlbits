module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    reg [512:-1]q2;
    integer i;
    initial begin
        q2[-1]=1'b0;
        q2[512]=1'b0;
    end
    reg [511:0] q1;
    assign q = q1;//这里要使用阻塞赋值，即立即赋值，否则每个状态会多一个周期
    always @(posedge clk ) begin
        q2[511:0]=q1;
        if (load) begin
            q1<=data;
        end
        else begin
            for(i=0;i<512;i=i+1)
                begin
                    q1[i]<=q2[i+1]^q2[i-1];
                end
        end
    end
endmodule

