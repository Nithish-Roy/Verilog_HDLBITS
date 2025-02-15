module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    always @(posedge clk) begin
        if(q == 4'b0110  && ~a)
            q <= 0;
        else if(a)
            q <= 4'b0100;
        else if(!a)
            q <= q + 1'b1;
    end

endmodule
