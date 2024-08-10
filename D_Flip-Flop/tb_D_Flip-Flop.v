`timescale 1ns/1ns

module tb_DFF();
	reg D;
	reg clk;
	reg reset;
	wire Q;

  D_FlipFlop_SyncReset DFF(.D(D),.clk(clk),.reset(reset),.Q(Q));
  
  initial
    begin
      clk = 0;
    end
  
    always #3 clk = ~clk;  

	initial 
      begin 
 		reset=1;
 		D <= 0;
 		#10;
 		reset=0;
 		D <= 1;
 		#10;
 		D <= 0;
 		#10;
 		D <= 1;
        #10;
        $finish();
	end 
  
	initial 
      begin
    	$dumpfile("dump.vcd"); 
    	$dumpvars(1);    
  	  end
  
endmodule
