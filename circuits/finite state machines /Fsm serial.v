module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg done
); 
    parameter idle=12'b000000_00000_1;
    parameter start=12'b000000_00001_0;
    parameter data1=12'b000000_00010_0;
    parameter data2=12'b000000_00100_0;
    parameter data3=12'b000000_01000_0;
    parameter data4=12'b000000_10000_0;
    parameter data5=12'b000001_00000_0;
    parameter data6=12'b000010_00000_0;
    parameter data7=12'b000100_00000_0;
    parameter data8=12'b001000_00000_0;
    parameter error=12'b01000_00000_00;
    parameter stop=12'b10000_00000_00;
    reg[11:0]state;
    reg [11:0]next;
    always @(posedge clk ) begin
        if (reset) begin
            state<=idle;
        end
        else  begin
            state<=next;
        end
    end
    always @(*) begin
        case(state)
        idle:next=(in==1'b1)?idle:start;
        start:next=data1;
        data1:next=data2;
        data2:next=data3;
        data3:next=data4;
        data4:next=data5;
        data5:next=data6;
        data6:next=data7;
        data7:next=data8;
        data8:next=(in==1'b1)?stop:error;
        stop:next=(in==1'b0)?start:idle;
        error:next=(in==1'b0)?error:idle;
        endcase
    end
    /*always @(posedge clk ) begin
        if (reset) begin
            done<=1'b0;
        end
        else if (state==stop)begin
            done<=1'b1;
        end
        else begin
            done<=1'b0;
        end
    end*/
    assign done = (state==stop)?1'b1:1'b0;
endmodule

