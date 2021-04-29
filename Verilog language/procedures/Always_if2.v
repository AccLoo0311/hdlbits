// synthesis verilog_input_version verilog_2001
/*避免产生锁存器：
    当使用时序逻辑always块时，出现未被明确指出的情况时，verilg会维持输出不变，因而生成锁存器，因此时序always块中
    必须涵盖所有情况（使用 else 语句）
*/
module top_module (
    input      cpu_overheated,
    output reg shut_off_computer,
    input      arrived,
    input      gas_tank_empty,
    output reg keep_driving  ); //

    always @(*) begin
        if (cpu_overheated)
           shut_off_computer = 1;
        else begin
            shut_off_computer= 0;
        end
    end

    always @(*) begin
        if (~arrived)
           keep_driving = ~gas_tank_empty;
        else begin
            keep_driving=0;
        end
    end

endmodule

