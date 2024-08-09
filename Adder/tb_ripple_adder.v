`timescale 1ns/1ns
module tb_ripple_adder();
  reg [3:0] A; 
  reg [3:0] B;
  reg Cin;
  wire [3:0] Sum;
  wire Cout;
 
  ripple_adder ripple_adder1(.A(A),.B(B),.Cin(Cin),.Sum(Sum),.Cout(Cout));
 
  initial 
    begin
      A <= 4'b1011;
      B <= 4'b1111;
      Cin <= 1'b0;
    end
  
  initial 
    begin 
      $monitor("A=%b B=%b Cin=%b Sum=%b Cout=%b",A,B,Cin,Sum,Cout);
    end
  
  initial
    begin
       $dumpfile("dump.vcd"); 
       $dumpvars(1);
    end
  
 endmodule 
