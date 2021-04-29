module          bcd_0_9(
    input       clk,
    input       reset,
    input       ena,
    output[3:0] count,
    output  reg carry
    );
always @(posedge clk ) begin
    if (reset) begin
        count<=4'd0;
    end
    else if (ena) begin
        if (count==4'd9) begin
            count<=4'd0;
        end
        else begin
            count<=count+4'd1;
        end
    end
end
always @(*) begin
    carry=(count==4'd9)?1:0;
end
endmodule
module      count0_59(
    input       clk,
    input       reset,
    input       ena,
    output[7:0] count,
    output  reg carry
    );
reg carry0_9;
bcd_0_9 inst0(
    .clk(clk),
    .reset(reset),
    .ena(ena),
    .count(count[3:0]),
    .carry(carry0_9)
    );
always @(posedge clk ) begin
    if (reset) begin
        count[7:4]<=4'd0;
    end
    else if (carry0_9&&ena) begin
        if (count[7:4]==4'd5) begin
            count[7:4]<=4'd0;
        end
        else begin
            count[7:4]<=count[7:4]+1'b1;
        end
    end
end
always @(*) begin
    carry=(count[7:4]==4'd5&&ena&&carry0_9)?1:0;
end
endmodule
module top_module(
    input clk,
    input reset,
    input ena,
    output reg pm,
    output reg[7:0] hh,
    output reg[7:0] mm,
    output reg[7:0] ss);
reg carry_ss;
reg carry_mm;
reg carry_hh;
count0_59 inst0(//ss
.clk(clk),
.reset(reset),
.ena(ena),
.count(ss),
.carry(carry_ss)
    ); 
count0_59 inst1(//mm
.clk(clk),
.reset(reset),
.ena(ena&&carry_ss),
.count(mm),
.carry(carry_mm)
    ); 
always @(posedge clk ) begin
    if (reset) begin
        pm<=0;
        hh<=8'h12;
    end
    else if(carry_mm&&carry_ss&&ena)begin
        if (hh[7:4]==4'h0) begin
            if (hh[3:0]==4'h9) begin
                hh[3:0]<=4'h0;
                hh[7:4]<=4'h1;
            end
            else begin
                hh[3:0]<=hh[3:0]+4'b1;
            end
        end
        else if (hh[7:4]==4'h1)begin
            if (hh[3:0]==4'h1) begin
                hh[3:0]<=hh[3:0]+4'b1;
                pm<=~pm;
            end
             if(hh[3:0]==4'h2)begin
                hh[7:4]<=4'h0;
                hh[3:0]<=4'h1;
            end
            else if(hh[3:0]==4'h0) begin
                hh[3:0]<=4'h1;
            end
        end
end
end
endmodule
