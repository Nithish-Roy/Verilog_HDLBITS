module top_module( 
    input a, 
    input b, 
    output out );
  assign out = (a ~^ b); // out is assigned as a exored with b
endmodule
