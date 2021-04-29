module top_module(
    input clk,
    input in,
    input areset,
    output out); //
    parameter State_a=4'b0001;
    parameter State_b=4'b0010;
    parameter State_c=4'b0100;
    parameter State_d=4'b1000;
    reg [3:0]State;
    reg [3:0]State_next;
    // State transition logic
    always @(*) begin
        case(State)
        State_a:State_next=(in==1'b0)?State_a:State_b;
        State_b:State_next=(in==1'b0)?State_c:State_b;
        State_c:State_next=(in==1'b0)?State_a:State_d;
        State_d:State_next=(in==1'b0)?State_c:State_b;
        endcase
    end

    // State flip-flops with asynchronous reset
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            State<=State_a;
        end
        else begin
            State<=State_next;
        end
    end
    // Output logic
    assign out = (State==State_d)?1'b1:1'b0;

endmodule

