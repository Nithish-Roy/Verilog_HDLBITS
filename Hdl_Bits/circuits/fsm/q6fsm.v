module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
    
 
    parameter [2:0] 
    				A = 3'B000,
    				B = 3'B001,
    				C = 3'B010,
    				D = 3'B011,
    				E = 3'B100,
    				F = 3'B101;
    reg [2:0] ps, ns;
    
    
    always_comb 
        begin 
            case(ps)
                A : ns = w ? A  : B ;	
 				B : ns = w ? D  : C ;   	
				C : ns = w ? D  : E ;
                D : ns = w ? A  : F ;
                E : ns = w ? D  : E ;
                F : ns = w ? D  : C ;
                default : ns = A;
            endcase
        end
    
    always @(posedge clk)
        begin 
            ps <= (reset) ?  A : ns;
        end
    
    assign z = (ps == E)|(ps == F);

endmodule
