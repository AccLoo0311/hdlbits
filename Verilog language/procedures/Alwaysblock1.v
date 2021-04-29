// synthesis verilog_input_version verilog_2001
/*Combinational: always @(*) 
    assign out1 = a & b | c ^ d;
    always @(*) out2 = a & b | c ^ d;
    两者效果一致，都是在输入值变化时重新指派 out1(out2)的值
    always块中不能有assign
    组合逻辑中，推荐使用（*）作为敏感列表，以防止有信号被遗漏
    assign 的左值必须是线网类型（wire），always块中的左值必须是变量类型（reg）

 always @(posedge clk)    */
module top_module(
    input a, 
    input b,
    output wire out_assign,
    output reg out_alwaysblock
);
    assign out_assign = a&b;
    always @(*) begin
        out_alwaysblock=a&b;
    end
endmodule

