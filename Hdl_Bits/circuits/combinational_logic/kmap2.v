module top_module(
    input a,
    input b,
    input c,
    input d,
    output out  ); 
    assign out = ~d&~a | ~c&a&~b  | ~c&~a&~b | c&d&b | c&d&a;
endmodule
