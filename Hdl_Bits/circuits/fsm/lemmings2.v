

module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    parameter [1:0] LEFT=2'b00, RIGHT=2'b01, FALL_RIGHT = 2'b10, FALL_LEFT = 2'b11; 
    reg [1:0] state, next_state;

    always @(*) begin
        case(state)
            LEFT: next_state = ground?(!bump_left ?LEFT:RIGHT):FALL_LEFT;		
            RIGHT: next_state = ground?(!bump_right ?RIGHT:LEFT):FALL_RIGHT; 
            FALL_RIGHT: next_state = !ground?FALL_RIGHT:RIGHT;
            FALL_LEFT: next_state = !ground?FALL_LEFT:LEFT;
        endcase// State transition logic
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state <= LEFT;
        else
            state <= next_state;// State flip-flops with asynchronous reset
    end

    // Output logic
        assign walk_left = (state == LEFT);
        assign walk_right = (state == RIGHT);
    assign aaah = (state == FALL_RIGHT)||(state == FALL_LEFT)?1'b1:1'b0;

endmodule
