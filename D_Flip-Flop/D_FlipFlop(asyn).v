module D_FlipFlop_AsyncReset(    //非同步
	input D,
	input clk,  
	input reset,  
	output reg Q 
);
  
  always @(posedge clk or posedge reset) 
	begin
 	if(reset==1'b1)
  		Q = 1'b0; 
 	else 
  		Q = D; 
	end 
  
endmodule
