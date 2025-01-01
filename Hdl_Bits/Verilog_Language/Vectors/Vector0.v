module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
	assign outv = vec;
  assign {o2, o1, o0} = {outv[2],outv[1],outv[0]};  // the values are assigned using the concatenation operation {outv[2],outv[1],outv[0]} this can be replaces with vec
endmodule
