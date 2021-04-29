module top_module(
    input in,
    input [1:0] state,
    output [1:0] next_state,
    output out); //
    reg [1:0] next_state1;
    assign next_state = next_state1;
    parameter A=0, B=1, C=2, D=3;
    always @(*) begin
        case(state)
        A:begin
            if (in==1'b0) begin
                next_state1=A;
            end
            else begin
                next_state1=B;
            end
        end
        B:begin
            if (in==1'b0) begin
                next_state1=C;
            end
            else begin
                next_state1=B;
            end
        end
        C:begin
            if (in==1'b0) begin
                next_state1=A;
            end
            else begin
                next_state1=D;
            end
        end
        D:begin
            if (in==1'b0) begin
                next_state1=C;
            end
            else begin
                next_state1=B;
            end
        end
        endcase
    end
    assign out = (state==D)?1'b1:1'b0;
    // State transition logic: next_state = f(state, in)

    // Output logic:  out = f(state) for a Moore state machine

endmodule

