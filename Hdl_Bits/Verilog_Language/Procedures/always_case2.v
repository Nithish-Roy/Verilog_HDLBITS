// synthesis verilog_input_version verilog_2001
module top_module (
    input [3:0] in,
    output reg [1:0] pos  );
    always @(*) begin 
        case (in)
            4'h1: pos = 2'd0; //0001
            4'h2: pos = 2'd1; //0010
            4'h3: pos = 2'd0; //0011	
            4'h4: pos = 2'd2; //0100
            4'h5: pos = 2'd0; //0101
            4'h6: pos = 2'd1; //0110
            4'h7: pos = 2'd0; //0111
            4'h8: pos = 2'd3; //1000
            4'h9: pos = 2'd0; //1001
            4'ha: pos = 2'd1; //1010
            4'hb: pos = 2'd0; //1011
            4'hc: pos = 2'd2; //1100
            4'hd: pos = 2'd0; //1101
            4'he: pos = 2'd1; //1110
            4'hf: pos = 2'd0; //1111
            default: pos = 2'd0;
        endcase
    end 
    
endmodule
