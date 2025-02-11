module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    reg[23:0] data;
    // FSM from fsm_ps2
   parameter [1:0] BYTE1 = 2'B00,
    				BYTE2 = 2'B01,
    				BYTE3 = 2'B10,
    				DONE = 2'B11;
    
    reg [1:0] ps , ns;

    always @(*)begin 
       // data = 24'bx;
        case(ps)
            BYTE1:	
                	if(in[3]) begin
                   // data[7:0] = in[7:0];
                    ns = BYTE2;
                	end
            		else ns = BYTE1;
            
            BYTE2:	begin //data[15:8] = in[7:0]; 
                	ns =  BYTE3;
            		end
            
            BYTE3:	begin 	
                	//data[23:16] = in[7:0];
                	ns = DONE;
            		end
            
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
    
    
     always @(posedge clk) begin
    	if (reset) data <= 24'b0;
    	else data <= {data[15:8], data[7:0], in};
    end
    
    assign done = (ps == DONE);// Output logic

    assign out_bytes = done?(data):0;// New: Datapath to store incoming bytes.

endmodule
