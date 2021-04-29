module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    parameter a=5'b00001;
    parameter f1=5'b00010;
    parameter monitor=5'b00100;
    parameter g1=5'b01000;
    parameter g0=5'b10000;
    reg[2:0]detect;
    reg [4:0]state;
    reg [4:0]next;
    integer i;
    always @(posedge clk ) begin
        if (!resetn) begin
            state<=a;
        end
        else begin
            state<=next;
        end
    end
    always @(*) begin
        case(state)
        a:next=f1;
        f1:begin
            next=monitor;
        end
        monitor:begin
            for()
        end

        g1:begin
            
        end
        g0:
        endcase
    end
endmodule

