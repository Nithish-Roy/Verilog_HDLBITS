module top_module (
    input clk,
    input j,
    input k,
    output Q); 
	reg d;
    always @(posedge clk)begin 
        Q = ~Q&j| Q&~k;
    end
endmodule
