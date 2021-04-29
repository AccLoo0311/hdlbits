module A (input x, input y, output z);
    assign z = (x^y)&x;
endmodule

module B ( input x, input y, output z );
    assign z = ~(x^y);
endmodule


module top_module (input x, input y, output z);
    wire IA1_Z;
    wire IA2_Z;
    wire IB1_Z;
    wire IB2_Z;
    wire q1;
    wire q2;
    assign q1 = IA1_Z|IB1_Z;
    assign q2 = IA2_Z&IB2_Z;
    assign z = q1^q2;
    A IA1(.x(x), .y(y),.z(IA1_Z));
    B IB1(.x(x), .y(y),.z(IB1_Z));
    B IB2(.x(x), .y(y),.z(IB2_Z));
    A IA2(.x(x), .y(y),.z(IA2_Z));



endmodule


