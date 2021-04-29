module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    parameter idle=      10'd000_000_000_1;
    parameter data_1=    10'd000_000_001_0;
    parameter data_11=   10'd000_000_010_0;
    parameter data_110=  10'd000_000_100_0;
    parameter shift_ena0=10'd000_001_000_0;
    parameter shift_ena1=10'd000_010_000_0;
    parameter shift_ena2=10'd000_100_000_0;
    parameter shift_ena3=10'd001_000_000_0;
    parameter cnting=    10'd010_000_000_0;
    parameter do_ne=      10'd100_000_000_0;
    reg [10:0]state;
    reg [10:0] next;
always @(posedge clk ) begin
    if (reset) begin
        state<=idle;
    end
    else begin
        state<=next;
    end
end
always @(*) begin
    case(state)
    idle      :begin
        if (data) begin
            next=data_1;
        end
        else begin
            next=idle;
        end
    end
    data_1    :begin
        if (data) begin
            next=data_11;
        end
        else begin
            next=idle;
        end
    end
    data_11   :begin
        if (!data) begin
            next=data_110;
        end
        else begin
            next=data_11;
        end
    end
    data_110  :begin
        if (data) begin
            next=shift_ena0;
        end
        else begin
            next=idle;
        end
    end
    shift_ena0:next=shift_ena1;
    shift_ena1:next=shift_ena2;
    shift_ena2:next=shift_ena3;
    shift_ena3:next=cnting;
    cnting    :begin
        if (done_counting) begin
            next=do_ne;
        end
        else begin
            next=cnting;
        end
    end
    do_ne      :begin
        if (ack) begin
            next=idle;
        end
        else begin
            next=do_ne;
        end
    end
    default   :next=idle;
    endcase
    end
    assign shift_ena = (state==shift_ena0)|(state==shift_ena1)|(state==shift_ena2)|(state==shift_ena3);
    assign counting =  (state==cnting);
    assign done = (state==do_ne);

endmodule
