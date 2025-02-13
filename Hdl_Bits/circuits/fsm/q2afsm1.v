module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input [3:1] r,   // request
    output [3:1] g   // grant
); 

    parameter [1:0]
    				A = 2'b00,
    				B = 2'b01,
    				C = 2'b10,
    				D = 2'b11;
    reg [1:0] ps , ns;
    
    always @(*)begin 
        case(ps)
            A:begin
                if(r[1]) 
                	ns = B;
            	else if(r[2]&!r[1])
                	ns = C;
            	else if(r[3]&!r[2:1])
                	ns = D;
            	else 
                	ns = A;
              end
            B:	ns = r[1] ? B : A;
            C:  ns = r[2] ? C : A;
            D:  ns = r[3] ? D : A;
            default: ns = A;
        endcase
    end
            
    always @(posedge clk)begin
        if(!resetn)
            ps <= A;
    	else 
            ps <= ns;
    end
    
    
    always@(posedge clk)begin 
        if(!resetn)
            g <= 0;
        else begin
            case (ns)
                B   : g[1] = 1'b1;                    
                C   : g[2] = 1'b1;                   
                D   : g[3] = 1'b1;
                default : g <= 0;
            endcase
        end
    end
    
    
    
    
endmodule
