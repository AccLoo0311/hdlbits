module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter state_left=6'b000_001;
    parameter state_right=6'b000_010;
    parameter fall_left=6'b000_100;
    parameter fall_right=6'b001_000;
    parameter dig_left=6'b010_000;
    parameter dig_right=6'b100_000;
    reg[5:0]state;
    reg[5:0]next_state;
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
                else if (dig)begin
                    next_state=dig_left;
                end
                else if(bump_left)begin
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
                else if (dig)begin
                    next_state=dig_right;
                end
                else if(bump_right)begin
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
            dig_left:begin
                if (!ground) begin
                    next_state=fall_left;
                end
                else begin
                    next_state=dig_left;
                end
                /*else if(!dig&ground) begin
                    next_state<=state_left;
                end*/
            end
            dig_right:begin
                if (!ground) begin
                    next_state=fall_right;
                end
                else  begin
                    next_state=dig_right;
                end
                /*else if(!dig&ground) begin
                    next_state<=state_right;
                end*/
            end

        endcase
    end
    assign walk_left = (state==state_left)?1'b1:1'b0;
    assign walk_right = (state==state_right)?1'b1:1'b0;
    assign aaah = (state==fall_left|state==fall_right)?1'b1:1'b0;
    assign digging =(state==dig_right|state==dig_left)?1'b1:1'b0 ;
endmodule

