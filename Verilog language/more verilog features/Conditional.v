/* (0 ? 3 : 5)     // This is 5 because the condition is false.
   (sel ? b : a)   // A 2-to-1 multiplexer between a and b selected by sel.

   always @(posedge clk)         // A T-flip-flop.
        q <= toggle ? ~q : q;
always @(*)                   // State transition logic for a one-input FSM
  case (state)
    A: next = w ? B : A;
    B: next = w ? A : B;
  endcase
*/
module top_module (
    input [7:0] a, b, c, d,
    output [7:0] min);

    // assign intermediate_result1 = compare? true: false;
    wire [7:0] min1;
    wire [7:0] min2;
    assign min1 = a<b ? a:b;
    assign min2 = c<d ? c:d;
    assign min = min1<min2 ? min1:min2;


endmodule

