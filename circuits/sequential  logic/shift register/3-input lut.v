module register_8(
    input clk,
    input enable,
    input S,//移位寄存器输入
    output [7:0]Z//移位寄存器各级输出
    );
    assign Z = reg_out[7:0];
    reg[8:0]reg_out;
    integer i;
    always @(posedge clk ) begin
        reg_out[0]<=S;
        if (!enable) begin
            reg_out<=reg_out;
        end
        else begin
            for(i=1;i<8;i=i+1)
                begin
                    reg_out[i]<=reg_out[i-1];
                end
        end
    end
endmodule

module top_module (
    input clk,
    input enable,//移位寄存器使能
    input S,//移位寄存器输入
    input A, B, C,
    output Z ); 
    reg [7:0]Z_1;//寄存器各级输出
    reg Z_2;//Z
    assign Z = Z_2;
    register_8 register_8_inst(.clk(clk),.enable(enable),.S(S),.Z(Z_1));
    always @(*) begin
        case({A,B,C})
        3'd0:Z_2<=Z_1[0];
        3'd1:Z_2<=Z_1[1];
        3'd2:Z_2<=Z_1[2];
        3'd3:Z_2<=Z_1[3];
        3'd4:Z_2<=Z_1[4];
        3'd5:Z_2<=Z_1[5];
        3'd6:Z_2<=Z_1[6];
        3'd7:Z_2<=Z_1[7];
        endcase
    end
endmodule

