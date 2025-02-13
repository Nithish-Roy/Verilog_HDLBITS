module top_module (
    input [3:1] y,
    input w,
    output Y2);
    
    
    parameter [3:1] 
    				A = 3'B000,
    				B = 3'B001,
    				C = 3'B010,
    				D = 3'B011,
    				E = 3'B100,
    				F = 3'B101;

    assign Y2 = (~y[2]&y[1])|(~y[1]&w&y[2])|(~y[1]&y[3]&w); //next state transition logic for ff2 derived using statetransition table
     
endmodule
