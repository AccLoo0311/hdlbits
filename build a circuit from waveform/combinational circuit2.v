module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//
    integer i;
    wire[3:0]abcd;
    reg[1:0]count;
    assign abcd = {a,b,c,d};

    assign q = (abcd==4'b0000|abcd==4'b0011|abcd==4'b0101|abcd==4'b0110|abcd==4'b1001|abcd==4'b1010|abcd==4'b1100|abcd==4'b1111); 

endmodule

