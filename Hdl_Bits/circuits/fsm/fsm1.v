module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output reg out
);

    parameter A = 0, B = 1;
    reg state, next_state;

    // Combinational logic for next state
    always @(*) begin
        case (state)
            B: next_state = (in == 1'b0) ? A : B;
            A: next_state = (in == 1'b0) ? B : A;
            default: next_state = B;  
        endcase
    end

    // Sequential logic with asynchronous reset
    always @(posedge clk or posedge areset) begin
        if (areset)
            state <= B; 
        else
            state <= next_state;
    end


    assign out = (state == B) ? 1'b1 : 1'b0;

endmodule
