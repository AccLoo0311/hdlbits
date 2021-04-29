module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    parameter sta0=5'b00_001;
    parameter sta1=5'b00_010;
    parameter sta2=5'b00_100;
    parameter sta3=5'b01_000;
    parameter sta4=5'b10_000;
    reg[4:0]state;
    reg [4:0]next;
    always @(posedge clk ) begin
        state<=next;
    end
    always @(*) begin
        case(state)
        sta0:next=(reset)?sta1:sta0;
        sta1:next=(reset)?sta1:sta2;
        sta2:next=(reset)?sta1:sta3;
        sta3:next=(reset)?sta1:sta4;
        sta4:next=(reset)?sta1:sta0;
        endcase
    end
    assign shift_ena =(state==sta1|state==sta2|state==sta3|state==sta4);
endmodule

