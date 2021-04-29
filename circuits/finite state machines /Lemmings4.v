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
    reg [4:0]count;
    parameter state_left=7'b0000_001;
    parameter state_right=7'b0000_010;
    parameter fall_left=7'b0000_100;
    parameter fall_right=7'b0001_000;
    parameter dig_left=7'b0010_000;
    parameter dig_right=7'b0100_000;
    parameter splat=7'b1000_000;
    reg[6:0]state;
    reg[6:0]next_state;
    always @(posedge clk or posedge areset) begin
        
        if (areset) begin
            state<=state_left;
            count<=5'd0;
        end
        else begin
            state<=next_state;
            if (state==fall_left|state==fall_right) begin
            if (count>=5'd20) begin
                count<=count;
            end
            else begin
                count<=count+1'b1;
            end
        end
        else begin
            count<=5'b0;
        end
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
                if (count==5'd20&ground) begin
                    next_state=splat;
                end
                else if (ground) begin
                    next_state=state_left;
                end
                else begin
                    next_state=fall_left;
                end
                end
            
            fall_right:begin
                if (count==5'd20&ground) begin
                    next_state=splat;
                end
                else if (ground) begin
                    next_state=state_right;
                end
                else begin
                    next_state=fall_right;
                end
                end
            dig_left:begin
                if (!ground) begin
                    next_state=fall_left;
                end
                else begin
                    next_state=dig_left;
                end
                
            end
            dig_right:begin
                if (!ground) begin
                    next_state=fall_right;
                end
                else  begin
                    next_state=dig_right;
                end
                
            end
            splat:begin
                next_state=splat;
            end

        endcase
    end
    assign walk_left = (state==state_left)?1'b1:1'b0;
    assign walk_right = (state==state_right)?1'b1:1'b0;
    assign aaah = (state==fall_left|state==fall_right)?1'b1:1'b0;
    assign digging =(state==dig_right|state==dig_left)?1'b1:1'b0 ;
endmodule



