module parity (
    input clk,
    input reset,
    input in,
    output reg odd);
    always @(posedge clk)
        if (reset) odd <= 0;
        else if (in) odd <= ~odd;
endmodule

module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output  [7:0] out_byte,
    output done
); //
    parameter ID =   14'b000_000_000_000_01;
    parameter D1 =   14'b000_000_000_000_10;
    parameter D2 =   14'b000_000_000_001_00;
    parameter D3 =   14'b000_000_000_010_00;
    parameter D4 =   14'b000_000_000_100_00;
    parameter D5 =   14'b000_000_001_000_00;
    parameter D6 =   14'b000_000_010_000_00;
    parameter D7 =   14'b000_000_100_000_00;
    parameter D8 =   14'b000_001_000_000_00;
    parameter DP =   14'b000_010_000_000_00;
    parameter STOP = 14'b000_100_000_000_00; 
    parameter DONE = 14'b001_000_000_000_00; 
    parameter FAL =  14'b010_000_000_000_00; 
    parameter WAIT = 14'b100_000_000_000_00;
    reg[7:0]out_byte1;
    reg[13:0] state , next;
    wire p_s, odd;
    
    always @(*) begin
        case(state)
            ID: next = (~in) ? D1 : ID;
            D1: next = D2;
            D2: next = D3; 
            D3: next = D4; 
            D4: next = D5;
            D5: next = D6; 
            D6: next = D7; 
            D7: next = D8;
            D8: next = DP;
            DP: next = STOP;
            STOP: begin 
                if(in & odd)
                    next = DONE;
                else if (in & ~odd)
                    next = FAL;
                else
                    next = WAIT;
            end
            DONE: next = in ? ID : D1;
            WAIT: next = in ? ID : WAIT;
            FAL:  next = in ? ID : D1;
        endcase
    end
    
    always @ (posedge clk)  begin
        if(reset)begin
            state <= ID;
                end
        else
            state <= next;
    end
    assign p_s = ((state == D1) | (state == D2) | (state == D3) | (state == D4) | (state == D5) | (state == D6) | (state == D7) | (state == D8) | (state == DP) );
    
    wire p_in;
    assign p_in = p_s & in;
    wire p_rst;
    assign p_rst = (reset | (state == ID) | (state == DONE)|(state ==STOP )|(state ==WAIT)|(state ==FAL));
    parity ptest(
        .clk(clk),
        .reset(p_rst),
        .in(p_in),
        .odd(odd));
    assign done =  (state == DONE);
    always @(*) begin
    //组合逻辑中不写reset
        case(state)
        D1:out_byte1[0]=in;
        D2:out_byte1[1]=in;
        D3:out_byte1[2]=in;
        D4:out_byte1[3]=in;
        D5:out_byte1[4]=in;
        D6:out_byte1[5]=in;
        D7:out_byte1[6]=in;
        D8:out_byte1[7]=in;
        default:out_byte1=out_byte1;
        endcase
    end
assign out_byte = (state == DONE)?out_byte1:8'b0;
endmodule
