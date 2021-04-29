module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    parameter byte1=4'b0001;
    parameter byte2=4'b0010;
    parameter byte3=4'b0100;
    parameter done_sta=4'b1000;
    reg [3:0] state;
    reg[3:0] next_sta;
    // State transition logic (combinational)
    always @(*) begin
        case(state)
        byte1:next_sta=(in[3])?byte2:byte1;
        byte2:next_sta=byte3;
        byte3:next_sta=done_sta;
        done_sta:next_sta=(in[3])?byte2:byte1;
        endcase
    end
    // State flip-flops (sequential)
    always @(posedge clk ) begin
        if (reset) begin
            state<=byte1;
        end
        else begin
            state<=next_sta;
        end
    end
    // Output logic
    assign done = (state==done_sta)?1'b1:1'b0;
endmodule

