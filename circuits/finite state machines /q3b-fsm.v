module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter num_000=5'b00_001;
    parameter num_001=5'b00_010;
    parameter num_100=5'b00_100;
    parameter num_011=5'b01_000;
    parameter num_010=5'b10_000;
    reg[4:0] sta;
    reg[4:0]next;
    always @(posedge clk ) begin
        if (reset) begin
            sta<=num_000;
        end
        else  begin
            sta<=next;
        end
    end
    always @(*) begin
        case(sta)
        num_000:next=(x)?num_001:num_000;
        num_001:next=(x)?num_100:num_001;
        num_100:next=(x)?num_100:num_011;
        num_011:next=(x)?num_010:num_001;
        num_010:next=(x)?num_001:num_010;
        default:next=num_000;
        endcase
    end
    assign z = (sta==num_011)||(sta==num_100);
endmodule

