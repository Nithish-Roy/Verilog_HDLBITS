module top_module( 
    input [99:0] in,
    output [99:0] out
);
reg [99:0] temp;
integer i;

always @(*) begin
    for (i = 0; i < 100; i = i + 1) begin
        temp[i] = in[99-i];
    end
    out = temp;
end

endmodule
