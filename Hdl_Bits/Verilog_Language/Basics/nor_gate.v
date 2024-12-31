module top_module( 
    input a, 
    input b, 
    output out );
  assign out = ~ (a | b); // out is assigned as not of a or b which is equal to nor gate
endmodule
