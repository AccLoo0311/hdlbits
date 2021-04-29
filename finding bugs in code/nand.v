/*module andgate ( output out, input a, input b, input c, input d, input e );*/
module top_module (input a, input b, input c, output out);//
    reg out1;
    andgate inst1 ( 
        .out(out1), 
        .a(a), 
        .b(b), 
        .c(c), 
        .d(1'b1), 
        .e(1'b1));
    assign out = ~out1;
endmodule

