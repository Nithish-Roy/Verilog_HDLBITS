module top_module ( );
    reg clk;
    dut inst1(clk);
    
    initial begin 
        clk = 0;
        forever #5 clk = ~clk;
    end

endmodule
