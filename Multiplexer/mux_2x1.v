module mux_2x1(                  
  input A, B, 
  input SEL,
  output reg Y
);
  
  always @ (*) 
    begin
    case (SEL)
      1'b0: Y <= A; // if sel is 0 select A input
      1'b1: Y <= B; // if sel is 1 select B input
      default: Y <= 0;
    endcase
  end
endmodule
