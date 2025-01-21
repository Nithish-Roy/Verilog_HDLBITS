module top_module( 
    input [399:0] a, 
    input [399:0] b, 
    input cin,        
    output cout,      
    output [399:0] sum 
);
    wire [99:0] carry;
    genvar i;

    generate
        for (i = 0; i < 100; i = i + 1) begin : bcd_add_loop
            if (i == 0) begin
                bcd_fadd inst1 (
                    .a(a[3:0]),
                    .b(b[3:0]),
                    .cin(cin),
                    .cout(carry[i]),
                    .sum(sum[3:0])
                );
            end else begin
                bcd_fadd instn (
                    .a(a[i*4 + 3:i*4]), // each bcd is a fourbit number hence taking the 4 bits adding them and producing the sum and carry 
                    .b(b[i*4 + 3:i*4]),
                    .cin(carry[i-1]), //the input carry is the previous output carry
                    .cout(carry[i]),
                    .sum(sum[i*4 + 3:i*4]) // sum is accumulated in the vector accordingly
                );
            end
        end
    endgenerate
    assign cout = carry[99]; //the final carry bit is the cout
endmodule
