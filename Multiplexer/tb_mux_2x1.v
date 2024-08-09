`timescale 1ns/1ns

module tb_mux_2x1();
  reg A, B, Y;
  reg SEL;
  
  mux_2x1 mux1(
    .Y(Y),
    .A(A), 
    .B(B),
    .SEL(SEL));
  
  initial 
    begin
    SEL = 1'b0; // select A input
    A <= 1'b0;
    B <= 1'b1;
    #10;
    SEL = 1'b1; // select B input
    A <= 1'b1;
    B <= 1'b1;
    #10;
    end
  
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars(1);
  end
  
endmodule
