module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output reg c_enable,//计数器工作信号
    output reg c_load,//输入置位信号
    output reg [3:0] c_d//输入数据
); //
    always @(*) begin//比正确答案延迟一个时钟周期，需要用组合逻辑
        if (reset) begin
            c_d=4'b1;
            c_load=1;
            c_enable=0;
        end
        else if (enable) begin
            if (Q<4'd12) begin
                c_enable=1'b1;
                c_load=0;
            end
            else if (Q==4'd12) begin
                c_load=1;
                c_d=4'b1;
            end
        end
        else begin
            c_load=0;
            c_enable=0;
        end
    end
    count4 the_counter (.clk(clk),.enable(c_enable),.load(c_load),.d(c_d),.Q(Q));


endmodule

