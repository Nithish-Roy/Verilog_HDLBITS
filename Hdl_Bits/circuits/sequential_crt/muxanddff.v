module top_module (
	input clk,
	input L,
	input r_in,
	input q_in,
	output reg Q);
	reg d;
    
    always @(posedge clk) begin
        d = L?r_in:q_in;
    	Q <= d;
    end
    
    
endmodule
