module top_module (
    input clock,
    input a,
    output reg p,
    output q );
always @(*) begin
    if (clock) begin
        p=a;
    end
    else begin
        p=p;
    end

end
always @(negedge clock ) begin
   q<=p;
end
endmodule

