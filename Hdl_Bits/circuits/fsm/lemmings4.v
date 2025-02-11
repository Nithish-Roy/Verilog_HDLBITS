
module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    reg[7:0] count;
    
    
        parameter[2:0] 	W_L = 3'B000,
    				W_R = 3'B001,
    				F_L = 3'B010,
    				F_R = 3'B011,
    				D_L = 3'B100,
    				D_R = 3'B101,
    				S = 3'B110;
    
    
    reg [2:0] ps, ns;
    
        always @(*)begin
        case(ps)
            W_L: if(!ground) ns = F_L;
            else if(dig && ground) ns = D_L;
            else if(!bump_left && ground) ns = W_L;
            else if(bump_left && ground) ns = W_R;
            W_R: if(!ground) ns = F_R;
            else if(dig && ground) ns = D_R;
            else if(!bump_right && ground) ns = W_R;
            else if(bump_right && ground) ns = W_L;
            F_L:
            if (count >19 && ground) ns = S;			// count = or > 20 and ground causes spatter
            else if (ground) ns = W_L;
            else if(!ground) ns = F_L;
            F_R: 
            if (count >19 && ground) ns = S;			// count = or > 20 and ground causes spatter
            else if (ground) ns = W_R;
            else if(!ground) ns = F_R;			
            D_L: if(ground ) ns = D_L;
            else if (!ground) ns = F_L;
            D_R: if(ground ) ns = D_R;
            else if (!ground) ns = F_R;
            S: ns = S; 
        endcase
    end

        always @(posedge clk or posedge areset)begin 
         if(areset)begin 
            count <= 0;
            ps <= W_L;
            end
            else if((ps == F_R)|(ps == F_L))	begin			//count is incrememnted if the state is fall
                    count <= count + 1'b1;
                ps <= ns;
            end
          else begin
                	count  <= 0;						// else it is not incremented
            		ps <= ns;										
            end
     	end

        assign walk_left		= (ps == W_L);
        assign walk_right		= (ps == W_R);
        assign aaah		= (ps == F_R)|(ps == F_L);
        assign digging		= (ps == D_R)|(ps == D_L);


endmodule
