module top_module(
    //module add16 ( input[15:0] a, input[15:0] b, input cin, output[15:0] sum, output cout );

    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire add16_1_cout;
    wire [15:0]add16_2_sum;
    wire [15:0]add16_3_sum;
    add16 add16_inst1(.a(a[15:0]),.b(b[15:0]),.cin(1'd0),.sum(sum[15:0]),.cout(add16_1_cout));
    add16 add16_inst2(.a(a[31:16]),.b(b[31:16]),.cin(1'd0),.sum(add16_2_sum),.cout());
    add16 add16_inst3(.a(a[31:16]),.b(b[31:16]),.cin(1'd1),.sum(add16_3_sum),.cout());
    always @(*) begin
        case(add16_1_cout)
                1'd0:sum[31:16]=add16_2_sum;
                1'd1:sum[31:16]=add16_3_sum;
                default:sum[31:16]=16'd0;
        endcase
    end
endmodule

