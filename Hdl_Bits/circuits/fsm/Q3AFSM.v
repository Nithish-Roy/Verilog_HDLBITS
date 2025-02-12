module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    
    parameter 	A = 1'B0,
 				B = 1'B1;
    
    reg ps , ns;
    reg [1:0] countw, countclk;
    
    always_comb
        begin 
            case (ps)
                A: ns = s ? B : A;
                B: ns = B;
            endcase
        end
    
    always @(posedge clk)
        begin 
            if(reset) begin
                ps <= A;
                countw = 0;
                countclk = 0;
            end
            else begin
                ps <= ns;
            if(ps == B)
                begin 
                   
                   if(countclk == 3)
                        begin
                            countw = 0;
                            countclk = 0;
                        end
                    if(w) countw = countw + 1'b1;
                     countclk = countclk + 1'b1;
                end
        end
        end
    assign z = (countclk == 3)&&( countw == 2);
		
endmodule
