`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
/*type [upper:lower] vector_name;
wire [0:7] b; 该声明中最高位为b[0],最低位为b[7]
*/

module top_module( 
    input wire [15:0] in,
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    assign out_hi = in[15:8];
    assign out_lo = in[7:0];

endmodule

