module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    
    MUXDFF inst1(.clock(KEY[0]), .E(KEY[1]), .L(KEY[2]), .R(SW[3]),  .w(KEY[3]),  .Q(LEDR[3]));
    MUXDFF inst2(.clock(KEY[0]), .E(KEY[1]), .L(KEY[2]), .R(SW[2]),  .w(LEDR[3]), .Q(LEDR[2]));
    MUXDFF inst3(.clock(KEY[0]), .E(KEY[1]), .L(KEY[2]), .R(SW[1]),  .w(LEDR[2]), .Q(LEDR[1]));
    MUXDFF inst4(.clock(KEY[0]), .E(KEY[1]), .L(KEY[2]), .R(SW[0]),  .w(LEDR[1]), .Q(LEDR[0]));

endmodule

module MUXDFF (clock, w, E, R, L, Q);
    input clock, w, E, R, L;
    output Q;
    
    wire m1, m2;
    assign m1 = E?w:Q;
    assign m2 = L?R:m1;
    always@(posedge clock)begin 
        Q  <= m2;
    end
endmodule
