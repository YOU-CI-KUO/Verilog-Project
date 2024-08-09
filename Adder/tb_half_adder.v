`timescale 1ns/1ns
module tb_half_adder();
  reg a;
  reg b;
  wire sum;
  wire carry;
  
  half_adder half_adder1(
    .a(a),.b(b),.sum(sum),.carry(carry));
  
  initial 
    begin
       a = 1'b0; b = 1'b0;
       #5;a = 1'b0; b = 1'b1;
       #5;a = 1'b1; b = 1'b0;
       #5;a = 1'b1; b = 1'b1;
       #5;
    end
  
  initial
    begin
       $dumpfile("dump.vcd"); 
       $dumpvars(1);
    end
  
endmodule
