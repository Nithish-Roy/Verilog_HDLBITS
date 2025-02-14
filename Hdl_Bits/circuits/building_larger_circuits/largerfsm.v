module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input  done_counting,
    output done,
    input ack );
    
    
        
    parameter[3:0] 
    				A = 4'B0000,
    				B = 4'B0001,
    				C = 4'B0010,
    				D = 4'B0011,
    				E = 4'B0100,
    				F = 4'B0101,
    				G = 4'B0110,
    				H = 4'B0111,
    				I = 4'B1000,
    				J = 4'B1001;
    reg [3:0] ps , ns;
    
    always_comb
        begin 
            case(ps)
                	A : ns =  data ? B : A ;
					B : ns =  data ? C : A ;
					C : ns =  data ? C : D ;
					D : ns =  data ? E : A ;
					E : ns = F ;
					F : ns = G ;
					G : ns = H ;
					H : ns = I ;
					I : ns = done_counting ? J : I ;
					J : ns = ack ? A : J ;
                	default:ns = A;
            endcase
        end
    
    always @(posedge clk) begin
        if(reset) 
            ps <= A;
    	else
            ps <= ns;
    end
	
    assign	shift_ena	 = (ps == E)|(ps == F)|(ps == G)|(ps == H);
    assign	counting	 = (ps == I);
    assign	done		 = (ps == J);
    
endmodule
