module top_module( 
    input [2:0] in,
    output [1:0] out );
    reg [1:0]out_1;
    assign out = out_1;
    integer i;
    always @(*) begin
        out_1=2'b0;//out_1不能在变量声明时赋值
        for(i=0;i<3;i=i+1)
        begin
            if (in[i]==1'b1) begin
                out_1=out_1+1;
            end
            else begin
                out_1=out_1;
            end
        end

    end
endmodule

