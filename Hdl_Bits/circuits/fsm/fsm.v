module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);
    parameter[2:0] 
    			ZERO	= 3'B000,
    			ONE		= 3'B001,
    			TWO		= 3'B010,
    			THREE	= 3'B011,
    			FOUR	= 3'B100;
    
    reg [2:0] ps , ns;
    
    always @(*) begin 
        case(ps)
          			ZERO	: ns = x ?ONE:ZERO;
					ONE		: ns = x ?FOUR:ONE;
					TWO		: ns = x ?ONE:TWO;
					THREE	: ns = x ?TWO:ONE;
					FOUR	: ns = x ?FOUR:THREE;
         endcase
    end
    
    always @(posedge clk)
        begin 
            ps <= reset ? ZERO : ns;
        end
    
    assign z = (ps == FOUR)||(ps == THREE);


endmodule
