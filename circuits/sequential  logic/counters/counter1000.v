module top_module (
    input clk,
    input reset,
    output reg OneHertz,
    output reg [2:0] c_enable
); //
    reg [3:0]q1;
    reg [3:0]q2;
    reg [3:0]q3;
    always @(*) begin
        c_enable[0]=1;
        if (q1==4'd9) begin
            c_enable[1]=1;
        end
        else begin
            c_enable[1]=0;
        end
        if (q2==4'd9&&q1==4'd9) begin
            c_enable[2]=1;
        end
        else begin
            c_enable[2]=0;
        end
        if (q2==4'd9&&q1==4'd9&&q3==4'd9) begin
            OneHertz=1;
        end
        else begin
            OneHertz=0;
        end
    end
    bcdcount counter0 (.clk(clk), .reset(reset),.enable(c_enable[0]),.Q(q1));
    bcdcount counter1 (.clk(clk), .reset(reset),.enable(c_enable[1]),.Q(q2));
    bcdcount counter2 (.clk(clk), .reset(reset),.enable(c_enable[2]),.Q(q3));

endmodule

