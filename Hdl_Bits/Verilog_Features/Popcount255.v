module top_module(
    input [254:0] in,
    output [7:0] out
);
    integer i;
    reg [7:0] count;

    always @(*) begin
        count = 8'b0;  // Reset count
        for (i = 0; i < 255; i = i + 1) begin
            if (in[i]) begin
                count = count + 1;
            end
        end
    end

    assign out = count;

endmodule
