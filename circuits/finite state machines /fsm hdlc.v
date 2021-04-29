module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    parameter sta0=10'b0000_000_001;
    parameter sta1=10'b0000_000_010;
    parameter sta2=10'b0000_000_100;
    parameter sta3=10'b0000_001_000;
    parameter sta4=10'b0000_010_000;
    parameter sta5=10'b0000_100_000;
    parameter discard=10'b0001_000_000;
    parameter sta6=10'b0010_000_000;
    parameter flagg=10'b0100_100_000;
    parameter error=10'b1000_000_000;
    reg [9:0]state;
    reg[9:0]next;
    always @(posedge clk ) begin
        if (reset) begin
            state<=sta0;
        end
        else  begin
            state<=next;
        end
    end
    always @(*) begin
        case(state)
        sta0:next=(in)?sta1:sta0;
        sta1:next=(in)?sta2:sta0;
        sta2:next=(in)?sta3:sta0;
        sta3:next=(in)?sta4:sta0;
        sta4:next=(in)?sta5:sta0;
        sta5:next=(in)?sta6:discard;
        discard:next=(in)?sta1:sta0;
        sta6:next=(in)?error:flagg;
        flagg:next=(in)?sta1:sta0;
        error:next=(in)?error:sta0;
        endcase
    end
    assign disc = (state==discard);
    assign flag = (state==flagg);
    assign err = (state==error);
endmodule

