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
                A : ns = w ? B  : A ;	
 				B : ns = w ? C  : D ;   	
				C : ns = w ? E  : D ;
                D : ns = w ? F  : A ;
                E : ns = w ? E  : D ;
                F : ns = w ? C  : D ;
                default : ns = A;
            endcase
        end
    
    always @(posedge clk)
        begin 
            if(reset) 
                begin 
            		ps <=  A;
           		end
            else 
                 ps <= ns;
        end    
    
  /*  always @(posedge clk)
           begin     
               case(ns)
                   		F: z <= 1'b1;
                   		E: z <= 1'b1;
                       default: z <= 1'b0;
                endcase
       	   end
    */
    assign z = (ps ==  E)|(ps == F);
   
endmodule
