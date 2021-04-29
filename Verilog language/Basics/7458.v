module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
    wire p3;//p2a & p2b
    wire p4;//p2c & p2d
    wire p5;//p1a & p1b & p1c
    wire p6;//p1f & p1e & p1d
    assign p3 = p2a & p2b;
    assign p4 = p2c & p2d;
    assign p5 = p1a & p1b & p1c;
    assign p6 = p1f & p1e & p1d;
    assign p2y = p3|p4;
    assign p1y = p5|p6;


endmodule

