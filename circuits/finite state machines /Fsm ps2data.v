module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output done); //
    // FSM from fsm_ps2
    reg [23:0] out_bytes1;
    //assign out_bytes = out_bytes1;
    parameter byte1=4'b0001;
    parameter byte2=4'b0010;
    parameter byte3=4'b0100;
    parameter done_sta=4'b1000;
    reg [3:0] state;
    reg[3:0] next_sta;
    // State transition logic (combinational)
    always @(*) begin
        case(state)
        byte1:begin
        next_sta=(in[3])?byte2:byte1;
        if (in[3]) begin
        end
        end
        byte2:begin
        next_sta=byte3;
        end
        byte3:begin
        next_sta=done_sta;
        end
        done_sta:begin
        next_sta=(in[3])?byte2:byte1;
        if (in[3]) begin
        end
        end
        endcase
    end
    // State flip-flops (sequential)
    always @(posedge clk ) begin
        if (reset) begin
            state<=byte1;
            out_bytes1<=24'b0;
        end
        else begin
            state<=next_sta;
            out_bytes1[23:16]<=out_bytes1[15:8];
            out_bytes1[15:8]<=out_bytes1[7:0];
            out_bytes1[7:0]<=in;
        end
        
    end
    // Output logic
    assign done = (state==done_sta)?1'b1:1'b0;
    // New: Datapath to store incoming bytes.
    assign out_bytes = (state==done_sta)?out_bytes1:24'b0;

endmodule

