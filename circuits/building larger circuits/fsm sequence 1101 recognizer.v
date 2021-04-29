module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    parameter sta0=5'b00_001;
    parameter sta1=5'b00_010;
    parameter sta11=5'b00_100;
    parameter sta110=5'b01_000;
    parameter sta1101=5'b10_000;
    reg[4:0]state;
    reg[4:0]next;
    always @(posedge clk ) begin
        if (reset) begin
            // reset
            state<=sta0;
        end
        else  begin
            state<=next;
        end
    end
    always @(*) begin
        case(state)
        sta0:next=(data)?sta1:sta0;
        sta1:next=(data)?sta11:sta0;
        sta11:next=(data)?sta11:sta110;
        sta110:next=(data)?sta1101:sta0;
        sta1101:next=sta1101;
        endcase
    end
    assign start_shifting = (state==sta1101);
endmodule

