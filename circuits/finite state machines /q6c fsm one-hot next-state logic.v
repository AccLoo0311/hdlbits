module top_module (
    input [6:1] y,
    input w,
    output  Y2,
    output  Y4);
    parameter a=6'b000_001;
    parameter b=6'b000_010;
    parameter c=6'b000_100;
    parameter d=6'b001_000;
    parameter e=6'b010_000;
    parameter f=6'b100_000;
    //always @(*) begin
    //case(y)
    //a:Y2=(~w)?1:0;
    //default:Y2=0;
    //endcase
    //end
    assign Y2 = y[1]&&(~w);
    //always @(*) begin
    //case(y)
    //b:Y4=(w)?1:0;
    //c:Y4=(w)?1:0;
    //f:Y4=(w)?1:0;
    //e:Y4=(w)?1:0;
    //default:Y4=0;
    //endcase
    //end
    assign Y4 = (y[2]||y[3]||y[5]||y[6])&&w;
endmodule

