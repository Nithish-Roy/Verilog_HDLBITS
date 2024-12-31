module top_module( 
    input a, 
    input b, 
    output out );
	assign out = a & b; // out is assigned as a and with b when the value of a and b changes the value is continously assigned to out
endmodule
