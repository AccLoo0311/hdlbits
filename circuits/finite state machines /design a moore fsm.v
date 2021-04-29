module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
); 
    parameter state1=6'b000_001;//低于s1
    parameter state2hi=6'b000_010;//s1-s2之间
    parameter state2lo=6'b000100;
    parameter state3hi=6'b001_000;//s2-s3之间
    parameter state3lo=6'b010_000;//s2-s3之间
    parameter state4=6'b100000;//高于s3
    reg[5:0]state;
    reg[5:0]next;
    always @(posedge clk ) begin
        if (reset) begin
            state<=state1;
        end
        else  begin
            state<=next;
        end
    end
    always @(*) begin
        case(state)
        state1:begin
            if (s[1]) begin
                next=state2lo;
            end
            else begin
                next=state1;
            end
        end
        state2hi:begin
            if (s[1]&~s[2]) begin
                next=state2hi;
            end
            else if (~s[1]) begin
                next=state1;
            end
            else if(s[1]&s[2]) begin
                next=state3lo;
            end
        end
        state2lo:begin
            if (s[1]&~s[2]) begin
                next=state2lo;
            end
            else if (~s[1]) begin
                next=state1;
            end
            else if(s[1]&s[2]) begin
                next=state3lo;
            end
        end
        state3hi:begin
            if (s[3]) begin
                next=state4;
            end
            else if (s[1]&s[2]) begin
                next=state3hi;
            end
            else if (s[1]&~s[2]) begin
                next=state2hi;
            end
        end
        state3lo:begin
            if (s[3]) begin
                next=state4;
            end
            else if (s[1]&s[2]) begin
                next=state3lo;
            end
            else if (s[1]&~s[2]) begin
                next=state2hi;
            end
        end
        state4:begin
            if (s[3]) begin
                next=state4;
            end
            else if (s[2]&~s[3]) begin
                next=state3hi;
            end
        end
        endcase
    end
    assign fr1 = state==state1|state==state2hi|state==state2lo|state==state3hi|state==state3lo;
    assign fr2 = state==state1|state==state2lo|state==state2hi;
    assign fr3 = state==state1;
    assign dfr = state==state2hi|state==state3hi|state==state1;
endmodule

