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

