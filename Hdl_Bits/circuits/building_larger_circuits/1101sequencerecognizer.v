module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    
    parameter[2:0] 
    				A = 3'B000,
    				B = 3'B001,
    				C = 3'B010,
    				D = 3'B011,
    				E = 3'B100;
    reg [2:0] ps , ns;
    
    always_comb
        begin 
            case(ps)
    	    A : ns = data ? B : A ;		        
    	    B : ns = data ? C : A ;		
    	    C : ns = data ? C : D ;		
    	    D : ns = data ? E : A ;
            E : ns = E;
            endcase
        end
    
    always@(posedge clk)
        ps <= (reset) ?  A : ns;
    
    
    
    assign start_shifting = (ps == E); 
    
endmodule
