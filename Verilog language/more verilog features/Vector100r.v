//for循环可以生成rtl视图，但不能实例化
module top_module( 
    input [99:0] in,
    output [99:0] out
);
    integer i;
    always @(*) begin
        for(i=0;i<100;i=i+1)
            begin
                out[i]=in[99-i];
            end
    end
endmodule

