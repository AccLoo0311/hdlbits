module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output reg [3:0] count,
    output counting,
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
    parameter do_ne=     10'd100_000_000_0;
    reg [9:0]state;
    reg [9:0]next;
    reg [10:0]counter;
    reg ok;//ok为1时，cnting跳转到do_ne状态，否则继续cnting状态
    always @(posedge clk ) begin
        if (reset) begin
            state<=idle;
        end
        else  begin
            state<=next;
        end
    end
    always @(posedge clk ) begin
        if (reset) begin
            counter<=0;
            count<=0;
            ok<=0;
        end
        else  begin
            case(state)
            shift_ena0:begin
                count[3]<=data;
            end
            shift_ena1:begin
                count[2]<=data;
            end
            shift_ena2:begin
                count[1]<=data;
            end
            shift_ena3:begin
                count[0]<=data;
            end
            cnting:begin
                if (count>=0) begin//count>=0时，每循环1000次，count-1
                    if (counter<999) begin
                        counter<=counter+1;
                    end
                    else begin
                        count<=count-1;
                        counter<=0;
                    end
                end
            end
            default:begin
                counter=0;
                ok=0;
            end
            endcase
        end
    end
    always @(*) begin
        case(state)
        idle:begin
            if (data) begin
                next=data_1;
            end
            else begin
                next=idle;
            end
        end
        data_1:    begin
            if (data) begin
                next=data_11;
            end
            else begin
                next=idle;
            end
        end
        data_11:   begin
            if (data) begin
                next=data_11;
            end
            else begin
                next=data_110;
            end
        end
        data_110:  begin
            if (data) begin
                next=shift_ena0;
            end
            else begin
                next=idle;
            end
        end
        shift_ena0:begin
            //count[3]=data;不能在不同的逻辑块中对变量进行赋值
            next=shift_ena1;
        end
        shift_ena1:begin
            //count[2]=data;
            next=shift_ena2;
        end
        shift_ena2:begin
            //count[1]=data;
            next=shift_ena3;
        end
        shift_ena3:begin
            //count[0]=data;
            next=cnting;
        end
        cnting    :begin
            if (count==0&&counter==999) begin//状态的衔接跳转，要注意跳转条件
                next=do_ne;
            end
            else begin
                next=cnting;
            end
        end
        do_ne     :begin
            if (~ack) begin
                next=do_ne;
            end
            else begin
                next=idle;
            end
        end
        default:next=idle;
        endcase
    end
assign counting =(state ==cnting);
assign done = (state==do_ne);
endmodule