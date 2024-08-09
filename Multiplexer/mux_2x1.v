module mux_2x1(     // 8-bits             
  input [7:0]A, B, 
  input SEL,
  output reg [7:0]Y
);
  
  always @ (*) begin
    case (SEL)
      1'b0: Y <= A; // if sel is 0 select A input
      1'b1: Y <= B; // if sel is 1 select B input
      default: Y <= 8'b0;
    endcase
  end
endmodule
