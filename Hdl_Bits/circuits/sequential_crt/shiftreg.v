module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [3:0]q;
    
    always @(posedge clk)begin
        if(!resetn)
            q <= 4'b0000;
        else begin
            q <= {in,q[3:1]};
    end
    end
    assign out = q[0];
endmodule
