module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 
    parameter a=4'b0001;
    parameter b=4'b0010;
    parameter c=4'b0100;
    parameter d=4'b1000;
    reg [3:0]state;
    reg[3:0]next;
    always @(posedge clk ) begin
        if (!resetn) begin
            state<=a;
        end
        else  begin
            state<=next;
        end
    end
    always @(*) begin
        case(state)
        a:begin
            /*case(r)
            3'b000:next=a;
            3'bxx1:next=b;
            3'bx10:next=c;
            3'b100:next=d;
            endcase*/
            if (r[1]) begin
                next=b;
            end
            else if (~r[1]&r[2])begin
                next=c;
            end
            else if (~r[1]&~r[2]&r[3])begin
                next=d;
            end
            else  if(~r[1]&~r[2]&~r[3])begin
                next=a;
            end
        end
        b:begin
            /*case(r)
            3'bxx0:next=a;
            3'bxx1:next=b;
            endcase*/
            if (r[1]) begin
                next=b;
            end
            else begin
                next=a;
            end
        end
        c:begin
            /*case(r)
            3'bx1x:next=c;
            3'bx0x:next=a;
            endcase*/
            if (r[2]) begin
                next=c;
            end
            else begin
                next=a;
            end
        end
        d:begin
            /*case(r)
            3'b1xx:next=d;
            3'b0xx:next=a;
            endcase*/
            if (r[3]) begin
                next=d;
            end
            else begin
                next=a;
            end
        end
        endcase
    end
    assign g = {{state==d},{state==c},{state==b}};
    //assign g[1] = (state == b);
    //assign g[2] = (state == c);
    //assign g[3] = (state == d);
    
endmodule

