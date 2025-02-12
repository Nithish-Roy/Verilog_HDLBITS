//melay
module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter 	IDLE = 1'B0,
    		CONVERT = 1'B1;

    reg ps , ns;
   reg zz;
    
    always_comb
        begin 
            case(ps)
            IDLE: ns = x ?  CONVERT: IDLE; 
            CONVERT: ns = CONVERT; 
            endcase
        end
    
    
    always @(posedge clk or posedge areset)
    begin 
        ps <= (areset) ? IDLE : ns;
    end
    

    assign z = ((ps == IDLE) && x )|((ps == CONVERT) && !x);
endmodule
