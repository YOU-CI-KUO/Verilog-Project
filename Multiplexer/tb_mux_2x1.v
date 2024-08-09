`timescale 1ns/1ns

module tb_mux_2x1();
  reg [7:0]A, B, Y;
  reg SEL;
  
  mux_2x1_8 mux(
    .Y(Y),
    .A(A), 
    .B(B),
    .SEL(SEL));
  
  initial begin
    A <= 8'b01010101;
    B <= 8'b10101010;
    SEL = 0; // select A input
    #1
    if (Y == A) 
      $display ("PASS\t%p\t%p\t%p\t%p",SEL,A,B,Y);
    else
      $display ("FAIL\t%p\t%p\t%p\t%p",SEL,A,B,Y);
    
    #10 SEL = 1; // select B input
    
    #1
    if (Y == B) 
      $display ("PASS\t%p\t%p\t%p\t%p",SEL,A,B,Y);
    else
      $display ("FAIL\t%p\t%p\t%p\t%p",SEL,A,B,Y);
  	
    #10 SEL = 0;
  end
  
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(1);
  end
  
endmodule
