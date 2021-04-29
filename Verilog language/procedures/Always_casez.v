// synthesis verilog_input_version verilog_2001
/*若声明casez或casex，则符号z将视为考虑该符号（casex，z和x都不被考虑）
2’b?0 将被视为2‘bz0
*/
module top_module (
    input [7:0] in,
    output reg [2:0] pos  );
    always @(*) begin
    casez(in)
        8'bzzzz_zzz1:pos=0;
        8'bzzzz_zz1z:pos=1;
        8'bzzzz_z1zz:pos=2;
        8'bzzzz_1zzz:pos=3;
        8'bzzz1_zzzz:pos=4;
        8'bzz1z_zzzz:pos=5;
        8'bz1zz_zzzz:pos=6;
        8'b1zzz_zzzz:pos=7;
        default:pos=0;
    endcase
    end


endmodule

