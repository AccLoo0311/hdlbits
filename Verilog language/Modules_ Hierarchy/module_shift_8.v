module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
// module my_dff8 ( input clk, input [7:0] d, output [7:0] q );
    wire [7:0]q1;
    wire [7:0]q2;
    wire [7:0]q3;
    my_dff8 my_dff8_inst1(.clk(clk),.d(d),.q(q1));
    my_dff8 my_dff8_inst2(.clk(clk),.d(q1),.q(q2));
    my_dff8 my_dff8_inst3(.clk(clk),.d(q2),.q(q3));
    always @( * ) begin//不能再alwa块内写assign语句
    //always @( * )表示always模块中的任何一个输入信号或电平发生变化时，该语句下方的模块将被执行。
        if (sel==2'd0) begin
             q = d;
        end
        else if (sel==2'd1) begin
             q = q1;
        end
        else if (sel==2'd2) begin
             q = q2;
        end
        else if (sel==2'd3) begin
             q = q3;
        end
        else begin//避免生成锁存器
            q=8'd0;
        end
    end
endmodule

