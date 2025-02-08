module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);
    always @(posedge clk)begin
        if(!slowena && !reset)begin
			        q <= q;
        end
        else if (reset || q == 4'b1001)
              q <= 0;
        else 
              q <= q + 1'b1;
        end
endmodule
