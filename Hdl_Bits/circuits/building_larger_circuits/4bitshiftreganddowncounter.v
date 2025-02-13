module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    
    always@(posedge clk)begin
        if (shift_ena && !count_ena)
    		q <= {q[2:0], data};  // Shift left and insert `data` into LSB
        else if (count_ena && !shift_ena)
   			 q <= q - 1'b1;        // Decrement q by 1
    end

endmodule
