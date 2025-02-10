module top_module(
    input clk,
    input in,
    input reset,
    output out); //

    
    parameter A=0, B=1, C=2, D=3;

    reg [1:0] state;
    reg [1:0] next_state;
    
     always@(*)begin 
        case(state)
            A: next_state= (in)?B:A;
            B: next_state= (in)?B:C;
            C: next_state= (in)?D:A;
            D: next_state= (in)?B:C;
        endcase
    end
        // State transition logic

    always @(posedge clk)begin 
        if(reset) 
            state <= A;
        else 
            state <= next_state;
    end
    // State flip-flops with asynchronous reset

    assign out = (state == D);// Output logic

endmodule
