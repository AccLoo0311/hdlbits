module           decade_counter (
    input        clk,
    input        reset,   // Synchronous active-high reset
    input        ena,//这一位的使能标志
    output       carry,//进位标志
    output reg [3:0]  q);
always @(posedge clk ) begin
    if (reset) begin
        q<=4'd0;
    end
    else if (ena) begin
        if (q==4'd9) begin
            q<=0;
        end
        else begin
            q<=q+1'd1;
        end
    end
end
assign carry = (q==4'd9)?1:0;
endmodule

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,//进位标志
    output [15:0] q);
    reg [3:1]carry;
    reg carry1;
    reg carry2;
    reg carry3;
decade_counter inst0 (
.clk(clk),
.reset(reset),
.ena(1'b1),
.carry(carry1),
.q(q[3:0]));
decade_counter inst1 (
.clk(clk),
.reset(reset),
.ena(ena[1]),
.carry(carry2),
.q(q[7:4]));
decade_counter inst2 (
.clk(clk),
.reset(reset),
.ena(ena[2]&&ena[1]),
.carry(carry3),
.q(q[11:8]));
decade_counter inst3 (
.clk(clk),
.reset(reset),
.ena(ena[3]&&ena[2]&&ena[1]),
.carry(),
.q(q[15:12]));
assign ena[1] = carry1;
assign ena[2] = carry1&&carry2;
assign ena[3] = carry1&&carry2&&carry3;

endmodule
