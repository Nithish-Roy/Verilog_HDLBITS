
module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output done); //
    
    parameter [1:0] BYTE1 = 2'B00,
    				BYTE2 = 2'B01,
    				BYTE3 = 2'B10,
    				DONE = 2'B11;
    
    reg [1:0] ps , ns;

    always @(*)begin 
        case(ps)
            BYTE1: if(in[3]) ns = BYTE2;
            		else ns = BYTE1;
            BYTE2: ns =  BYTE3;
            BYTE3: ns = DONE;
            DONE : if(in[3]) ns = BYTE2;
            		else ns = BYTE1;
        endcase
    end// State transition logic (combinational)

    always @(posedge clk)begin
        if(reset)
            ps <= BYTE1;
    	else 
        ps <= ns;// State flip-flops (sequential)
    end
        
    assign done = (ps == DONE);// Output logic

endmodule
