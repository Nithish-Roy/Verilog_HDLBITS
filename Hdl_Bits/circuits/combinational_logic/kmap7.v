module top_module (
    input c,
    input d,
    output [3:0] mux_in
); 
wire d_bar,candd,cord;
    mux2 inst1(0,1,d,d_bar);
    mux2 inst2(d,0,c,candd);
    mux2 inst3(1,d,c,cord);
    assign mux_in = {candd,d_bar,1'b0,cord};
endmodule

module mux2(input d0, d1, input sel, output y );
    assign y = sel?d0:d1;
endmodule


                
