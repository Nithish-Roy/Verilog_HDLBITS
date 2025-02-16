module top_module ();
    
    
    reg clk;
    reg reset;   // active-high synchronous reset
    reg t;       // toggle
    wire q;
    
    
    tff inst1(.clk(clk), .reset(reset), .t(t), .q(q));
    
    initial begin 
        clk = 0;
        forever #5 clk = !clk;
    end
    
    initial begin 
        #5; reset = 1;
        #5; reset = 0;
    end
    
    initial begin 
        #15; t = 1;
    end
    

endmodule
