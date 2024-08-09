module logic_gate(
  input a,
  input b,
  input c,
  output buffer,
  output not_gate,
  output and_gate,
  output or_gate,
  output xor_gate,
  output nand_gate,
  output nor_gate
);
  assign buffer = a;
  assign not_gate = ~a;
  assign and_gate = a & b;
  assign or_gate = a | b;
  assign nand_gate = ~(a & b);
  assign nor_gate = ~(a | b);
  assign xor_gate = a ^ b;

endmodule
