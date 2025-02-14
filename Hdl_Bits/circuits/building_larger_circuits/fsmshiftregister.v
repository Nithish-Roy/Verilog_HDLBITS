module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
	
    parameter [3:0]
    		  A = 3'b000,
    		  B = 3'b001,
    		  C = 3'b010,
    		  D = 3'B100,
    		  E = 3'B101;
    		//  F = 3'B110;
    reg[3:0] ps , ns;
    
    always @(*)
        begin 
            case(ps)
                	A : ns = B;
					B : ns = C;
					C : ns = D;
					D : ns = E;
					E : ns = E;
					
            endcase
        end
    
    always@(posedge clk)
        ps <= (reset) ? A : ns;
    
    assign shift_ena = (ps == B)|(ps == C)|(ps == D)|(ps == A);

endmodule
