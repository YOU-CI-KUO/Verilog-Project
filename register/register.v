module DFF (
  input D, CE, CLR, CLK,
  output reg Q
);

  always @(posedge C, CLR) 
    begin
    case ({CLR, CE}) 
      2'b1x: Q <= 0;
      2'b01: Q <= D; 
      2'b00: Q <= Q; 
      default: Q <= 0; 
    endcase
  end  
endmodule


module register_4 (
  input [3:0] D, 
  input CLK, CE, CLR,
  output [3:0] Q
);
  DFF(D[0], CE, CLR, CLK, Q[0]); 
  DFF(D[1], CE, CLR, CLK, Q[1]);
  DFF(D[2], CE, CLR, CLK, Q[2]);
  DFF(D[3], CE, CLR, CLK, Q[3]);
endmodule

module register_8 (
  input [7:0] D,
  input CLK, CE, CLR,
  output [7:0] Q
);
  register_4(D[3:0],CLK,CE,CLR,Q[3:0]); 
  register_4(D[7:4],CLK,CE,CLR,Q[7:4]);
endmodule

module register_16 (
  input [15:0] D,
  input CLK, CE, CLR,
  output [15:0] Q
);
  register_8(D[7:0],CLK,CE,CLR,Q[7:0]); 
  register_8(D[15:8],CLK,CE,CLR,Q[15:8]);
  
endmodule
