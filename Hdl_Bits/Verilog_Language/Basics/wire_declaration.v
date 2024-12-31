`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   );
    wire and1 , and2;  // wire declarations fro intermediate outputs 
    assign and1 = (a & b);
    assign and2 = (c & d);
    assign out = (and1 | and2);
    assign out_n = ~(out);

endmodule

/* the code was written based on the image : https://hdlbits.01xz.net/mw/images/3/3a/Wiredecl2.png*/
