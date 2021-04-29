/*卡诺图化简：
    1.画图要将相邻项画在一起：00 01 11 10（首尾二者相邻）
    2.化简：遵循矩形框原则，且矩形框内的元素是2的n次幂个，越大越简
    3.任意项x画圈时可当做1
*/
module top_module(
    input a,
    input b,
    input c,
    output out  ); 
    assign out =c|a|b ;

endmodule

