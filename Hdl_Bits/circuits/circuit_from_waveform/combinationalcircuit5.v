module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );
    
    always@(*)begin
        case(c)
            3'B000    : q = b;
            3'B001    : q = e;
            3'B010    : q = a;
            3'B011    : q = d;
            default  : q = 4'b1111;
        endcase
    end

endmodule
