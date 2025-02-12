module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 
    
    parameter [1:0] ZERO = 2'B00,
    				ONE = 2'B01,
    				STATE = 2'B10;
    reg [1:0] ps , ns;
    
    always_comb begin
        case (ps)
             ZERO: ns = x ? ONE: ZERO;
		     ONE : ns = x ? ONE: STATE;
			 STATE : ns = x ? ONE : ZERO;
        endcase
    end
    
    always @(posedge clk or negedge aresetn) begin 
        ps = (!aresetn) ? ZERO: ns;
    end
       
    assign z = (ps == STATE) && (x);

endmodule
