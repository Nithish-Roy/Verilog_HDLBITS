module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 
    reg [7:0] temp;
    always @(posedge clk)begin 
        if(enable)begin
            temp <= {temp[6:0],S};
        end
        else
            temp <= temp;
    end
            always@(*)begin
                case({A,B,C})
                3'B000: Z= temp[0];
                3'B001: Z= temp[1];
                3'B010: Z= temp[2];
                3'B011: Z= temp[3];
                3'B100: Z= temp[4];
                3'B101: Z= temp[5];
                3'B110: Z= temp[6];
                3'B111: Z= temp[7];
            endcase
            end
endmodule
