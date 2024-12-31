module top_module( 
    input a,b,c,
    output w,x,y,z );
	  assign w = a;
    assign x = b;
    assign y = b;
    assign z = c;
    // all of the above asssigned acts as a wire since they are continously assigned the order in which they are assigned does not matter
endmodule
