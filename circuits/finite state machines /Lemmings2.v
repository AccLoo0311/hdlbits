module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter state_left=4'b0001;
    parameter state_right=4'b0010;
    parameter fall_left=4'b0100;
    parameter fall_right=4'b1000;
    reg[3:0]state;
    reg[3:0]next_state;
    always @(posedge clk or posedge areset) begin
        if (areset) begin
            state<=state_left;
        end
        else begin
            state<=next_state;
        end
    end
    always @(*) begin
        case(state)
            state_left:begin
                if (!ground) begin
                    next_state=fall_left;
                end
                else if (bump_left)begin
                    next_state=state_right;
                end
                else begin
                    next_state=state_left;
                end
            end
            state_right:begin
                if (!ground) begin
                    next_state=fall_right;
                end
                else if (bump_right)begin
                    next_state=state_left;
                end
                else begin
                    next_state=state_right;
                end
            end
            fall_left:begin
                next_state=(ground)?state_left:fall_left;
            end
            fall_right:next_state=(ground)?state_right:fall_right;
        endcase
    end
    assign walk_left = (state==state_left)?1'b1:1'b0;
    assign walk_right = (state==state_right)?1'b1:1'b0;
    assign aaah = (state==fall_left|state==fall_right)?1'b1:1'b0;
endmodule

