/*锁存器：电平敏感（level-sensitive），但是要使用非阻塞赋值，生成锁存器
一般情况下，组合逻辑使用阻塞赋值，时序逻辑使用非阻塞赋值
*/

module top_module (
    input d, 
    input ena,
    output q);
    always @(*) begin
        if (ena) begin
            q <= d;
        end
        else begin
            q <=q;
        end
    end

endmodule

