module top_module (
    input clk,
    input w, R, E, L,
    output Q
);
    wire m1,m2;
    assign m1 = E?w:Q;
    assign m2 = L?R:m1;
    always @(posedge clk)
        Q <= m2; 

endmodule
