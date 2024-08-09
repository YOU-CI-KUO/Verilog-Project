module ALU(
  input [7:0] A, B,
  input [4:0] SEL,
  output reg [7:0] Z,
  output reg Cout
);
  
  always @ (*)
    begin
    case (SEL)
      // S4 S3 S2 S1 S0
      5'b00000: Z = A; // input A
      5'b00001: Z = B; // input B
      5'b00010: {Cout,Z} = A & B; // bitwise and
      5'b00011: {Cout,Z} = A | B; // bitwise or
      5'b00100: {Cout,Z} = A-B; //subtract
      5'b00101: {Cout,Z} = A+B; //add
      5'b00110: {Cout,Z} = A + 1; //increment
      5'b00111: {Cout,Z} = A+B+1; // add and increment
      5'b01000: {Cout,Z} = A-B-1; //subtract and decrement
      default: Z=8'b0; 
    endcase
  end
  
endmodule
