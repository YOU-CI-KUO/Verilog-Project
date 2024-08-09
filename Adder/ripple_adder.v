module ripple_adder(   //4-bits
  input [3:0] A,
  input [3:0] B,
  input Cin,
  output [3:0] Sum,
  output Cout
);
 
  wire w1, w2, w3;
  full_adder u1(A[0], B[0], Cin, Sum[0], w1);
  full_adder u2(A[1], B[1], w1, Sum[1], w2);
  full_adder u3(A[2], B[2], w2, Sum[2], w3);
  full_adder u4(A[3], B[3], w3, Sum[3], Cout);
  
endmodule :ripple_adder

module full_adder(
  input a,    
  input b,   
  input cin,
  output reg sum,   
  output reg cout    
);
  
  wire x,y,z;
  half_adder h1(.a(a),.b(b),.sum(x),.carry(y));
  half_adder h2(.a(x),.b(cin),.sum(sum),.carry(z));
  or o1(cout,y,z);
  
endmodule :full_adder

  module half_adder(
    input a,
    input b,
    output reg sum,
    output reg carry
);
  always @(*) 
    begin
  	  sum = a ^ b;  
      carry = a & b;  
    end
    
endmodule :half_adder
