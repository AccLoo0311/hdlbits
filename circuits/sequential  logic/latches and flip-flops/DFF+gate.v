module top_module (
    input clk,
    input in, 
    output out);
    wire xor_out;
    reg out_1;
    assign out = out_1;
    assign xor_out= in^out;
    always @(posedge clk) begin
        begin
            out_1 <=xor_out;
        end
    end
endmodule

