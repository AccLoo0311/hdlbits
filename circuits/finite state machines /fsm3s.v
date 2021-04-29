module top_module(
    input clk,
    input in,
    input reset,
    output out); //
    reg [3:0]State;
    reg [3:0]next_state;
    parameter a=4'b0001;
    parameter b=4'b0010;
    parameter c=4'b0100;
    parameter d=4'b1000;
    // State transition logic
    always @(*) begin
        case(State)
        a:next_state=(in==1'b0)?a:b;
        b:next_state=(in==1'b0)?c:b;
        c:next_state=(in==1'b0)?a:d;
        d:next_state=(in==1'b0)?c:b;
        endcase
    end
    // State flip-flops with synchronous reset
    always @(posedge clk ) begin
        if (reset) begin
            State<=a;
        end
        else begin
            State<=next_state;
        end
    end

    // Output logic
    assign out = (State==d)?1'b1:1'b0;

endmodule

