
module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    parameter [3:0] state1 = 4'b0000,		//0
    				state2 = 4'b0001,		//01	
    				state3 = 4'b0010,		//011
    				state4 = 4'b0011,		//0111
    				state5 = 4'b0100,		//01111
    				state6 = 4'b0101,		//011111
    				state7 = 4'b0110,		//0111111
    				state8 = 4'b0111,		//0111110 disc ==1
    				state9 = 4'b1000,		//01111110 flag ==1
    				state10 = 4'b1001;		//011111111.... error ==1
    reg [3:0] ps , ns;
    
    always_comb
        begin 
            case (ps)
                state1:  ns = in ? state2 : state1;	 
				state2:	 ns = in ? state3 : state1;
				state3:	 ns = in ? state4 : state1;
				state4:	 ns = in ? state5 : state1;
				state5:	 ns = in ? state6 : state1;
				state6:	 ns = in ? state7 : state8;
				state7:	 ns = in ? state10 : state9;
				state8:	 ns = in ? state2 : state1;
				state9:	 ns = in ? state2 : state1;
				state10: ns = in ? state10 : state1;
            endcase
        end
    
    always @(posedge clk)
        begin 
            ps <= (reset)?state1:ns;
        end
    
    assign disc = (ps == state8);
        assign flag = (ps == state9);
            assign err = (ps == state10);


endmodule
