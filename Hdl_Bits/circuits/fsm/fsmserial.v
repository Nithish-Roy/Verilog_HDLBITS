module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
);
    parameter [2:0] IDLE = 3'B000,
    				START = 3'B001,
    				RECEIVE = 3'B010,
    				WAIT = 3'B011,
    				STOP = 3'B100;
    reg [2:0] ps , ns;
    reg [2:0] count;
    
    always_comb begin 
        case(ps)
            IDLE: ns = in?IDLE:START;	
			START: ns = RECEIVE;
            RECEIVE : ns = (count == 3'd8)?(in == 1'b1)?STOP:WAIT:RECEIVE;
            WAIT: ns = in ? IDLE : WAIT;
            STOP: ns = in?IDLE:START;
        endcase
    end
    
    always@(posedge clk) begin
        if(reset)begin 
            ps <= IDLE;
        end
        else begin 
            ps <= ns;
    		end
     end
    
    
    always @(posedge clk)begin 
                if(reset)
                begin 
				done <= 0;
        		count <= 0;
                end
        		else begin 
       			case(ns)
                RECEIVE:begin 
                     done <= 0;
                     count <= count + 1'b1;
                     end
                STOP:	begin 
                     count <= 0;
                     done <= 1'b1;
                end
                default:begin 
                    	count <=0;
                	done <= 0;
                end
            	endcase
                end
    end
endmodule
