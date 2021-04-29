module top_module( 
    input [254:0] in,
    output [7:0] out );
    reg [7:0] out_1;
    assign out = out_1;
    always @(*) begin
        integer i;//不能使用parameter，原因未知
        out_1=0;//需要先赋初值，否则报错
        for(i=0;i<255;i=i+1)
            begin
                if (in[i]) begin
                    out_1=out_1+1;
                end
                else begin
                    out_1=out_1+0;
                end
            end
    end
endmodule

