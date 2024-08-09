`timescale 1ns/1ns

module tb();
  reg a;
  reg b;
  wire buffer;
  wire not_gate;
  wire and_gate;
  wire or_gate;
  wire xor_gate;
  wire nand_gate;
  wire nor_gate;
  
  logic_gate uut(
    .a(a),
    .b(b),
    .buffer(buffer),
    .not_gate(not_gate),
    .and_gate(and_gate),
    .or_gate(or_gate),
    .xor_gate(xor_gate),
    .nand_gate(nand_gate),
    .nor_gate(nor_gate));
    
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
