module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output f,
    output g
); 
    
    parameter [3:0]
    				A = 4'B0000,
    				B = 4'B0001,
    				C = 4'B0010,
    				D = 4'B0011,
    				E = 4'B0100,
    			//	F = 4'B0101,
    				G = 4'B0110,
    				H = 4'B0111,
    				I = 4'B1000,
    				J = 4'B1001;
    reg [3:0] ps , ns;
    
    always @(*)
        begin
            case(ps) 
                A : ns = B;
                B : ns = C;
                C : ns = (x)? D : C ;
                D : ns = (x)? D : E ;
                E : ns = (x)? G : C ;
               // F : ns = G;
                G : ns = (y)? H : I ;
                H : ns = H;
                I : ns = (y)? H : J ;
                J : ns = J;
            endcase
        end
    
    always @(posedge clk) begin
        if(!resetn)
            ps <= A;
    	else
            ps <= ns;
    end
     
    assign f = (ps == B);
    assign g = (ps == G)|(ps === H)|(ps == I);
endmodule
