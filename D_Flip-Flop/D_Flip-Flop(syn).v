module D_FlipFlop_SyncReset(  //同步
	input D,
	input clk,  
	input reset,  
	output reg Q 
);
  
	always @(posedge clk) 
	begin
 	if(reset==1'b1)
  		Q = 1'b0; 
 	else 
  		Q = D; 
	end 
  
endmodule
