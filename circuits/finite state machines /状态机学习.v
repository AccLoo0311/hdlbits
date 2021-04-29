/*
由于verilog语言是并行的，因此需要借助状态机执行顺序执行的功能
状态的跳转与输入和当前状态有关
FSM:finite state machine,有限状态机，即在有限个状态之间按照一定规律转换的时序电路
状态机设计：
    四段论：状态空间定义
           状态跳转
           下个状态判断
           各个状态下的动作
*/
//使用状态机编写密码锁代码，密码为8023
module lock_fsm(
    input clk,
    input rstn,
    input [3:0]a,//输入
    output reg b//输出，当输入为8023时输出为1
    );
    //定义状态空间
    parameter state_idle=5'b10000;
    parameter state_8=5'b01000;
    parameter state_80=5'b00100;
    parameter state_802=5'b00010;
    parameter state_8023=5'b00001;
    reg [4:0]current_state;
    reg [4:0]next_state;
    //状态跳转
    always @(posedge clk or negedge rstn) begin
        if (!rst) begin
            current_state<=state_idle;
        end
        else  begin
            current_state<=next_state;
        end
    end
    //下个状态的判断，是组合逻辑
    always @(*) begin
        case(current_state)
            state_idle:begin
                if (a==4'd8) begin
                    next_state=state_8;
                end
                else begin
                    next_state=state_idle;
                end
            end
            state_8:begin
                if (a==4'd0) begin
                    next_state=state_80;
                end
                else begin
                    next_state=state_idle;
                end
            end
            state_80:begin
                if (a==4'd2) begin
                    next_state=state_802;
                end
                else begin
                    next_state=state_idle;
                end
            end
            state_802:begin
                if (a==4'd3) begin
                    next_state=state_8023;
                end
                else begin
                    next_state=state_idle;
                end
            end
            state_8023:begin
                next_state=state_idle;
            end
        endcase
    end
     /*各个状态的动作，可以使用组合逻辑
     always @(*) begin
         if (current_state==state_8023) begin
             b=1'b1;
         end
     end
     也可以写成assign语句
     assign b=(current_state==state_8023)? 1'b1:1'b0;
     */
     //各个状态下的动作，建议使用时序逻辑，以对齐总线数据
    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            b<=1'b0;
        end
        else if (current_state==state_8023) begin
            b<=1'b1;
        end
        else begin
            b<=1'b0;
        end
    end
endmodule