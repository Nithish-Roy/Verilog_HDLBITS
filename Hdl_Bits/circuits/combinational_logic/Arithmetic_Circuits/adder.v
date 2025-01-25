module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    wire [2:0] intercarry;
    full_adder inst1(x[0] , y[0], 1'b0, sum[0],intercarry[0]);
    full_adder inst2(x[1] , y[1], intercarry[0], sum[1],intercarry[1]);
    full_adder inst3(x[2] , y[2], intercarry[1], sum[2],intercarry[2]);
    full_adder inst4(x[3] , y[3], intercarry[2], sum[3],sum[4]);
endmodule
module full_adder(input a,b,c_in, output sum, carry);
    assign {carry,sum} = a+b+c_in;
endmodule
