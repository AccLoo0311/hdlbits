module top_module ( input [1:0] A, input [1:0] B, output z ); 
    reg z_1;
    assign z = z_1;
    always @(*) begin
        if (A==B) begin
            z_1=1;
        end
        else begin
            z_1=0;
        end
    end
endmodule

