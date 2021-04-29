// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations
    parameter state_a=1'b0;
    parameter state_b=1'b1;
    reg present_state, next_state;
    always @(posedge clk) begin
        if (reset) begin  
            present_state<=state_b;
        end else
            begin
            // State flip-flops
            present_state <= next_state;
        end
        
    end
    always @(*) begin
        case (present_state)
                // Fill in state transition logic
                state_a:begin
                    if (in==1'b1) begin
                        next_state=state_a;
                    end
                    else begin
                        next_state=state_b;
                    end
                end
                state_b:begin
                    if (in==1'b1) begin
                        next_state=state_b;
                    end
                    else begin
                        next_state=state_a;
                    end
                end
        endcase
            case (present_state)
            state_a:out=1'b0;
            state_b:out=1'b1;
            endcase

    end


endmodule

