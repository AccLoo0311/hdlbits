/*双边触发器
always @(posedge clk or negedge clk)该敏感列表非法
且在多个always块内不能对同一个变量进行赋值
*/
module top_module (
    input clk,
    input d,
    output q
);
    assign q = clk? q1[0]:q1[1];
    reg [1:0]q1;
always @(posedge clk ) begin
    q1[0]<=d;
end
always @(negedge clk ) begin
    q1[1]<=d;
end
endmodule

