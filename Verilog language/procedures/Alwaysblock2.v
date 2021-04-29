// synthesis verilog_input_version verilog_2001
/*赋值：
    连续赋值，assign，仅能在过程块（always块）外使用
    阻塞赋值，x=y;仅能在过程块内使用
    非阻塞赋值，x<=y;仅能在过程块内使用
    在组合逻辑always中，使用阻塞赋值，在时序逻辑always中，使用非阻塞赋值

*/
module top_module(
    input clk,
    input a,
    input b,
    output wire out_assign,
    output reg out_always_comb,
    output reg out_always_ff   );
    assign out_assign = a^b;
    always @(*) begin
        out_always_comb=a^b;
    end
    always @(posedge clk ) begin
        out_always_ff <= a^b;
    end
endmodule

