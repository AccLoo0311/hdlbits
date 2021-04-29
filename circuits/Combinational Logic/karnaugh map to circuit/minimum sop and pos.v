//把从不出现的当做无关项x看待
//卡诺图化简时对角线的项不能算作相邻项！！！
module top_module (
    input a,
    input b,
    input c,
    input d,
    output out_sop,
    output out_pos
); 
 
    assign out_sop = (c&d) | (~a&~b&c);//使用按位与/或
    assign out_pos = out_sop;
endmodule

