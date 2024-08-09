module tb_full_adder;
  reg a,b,cin;
  wire sum,cout;
 
  full_adder full_adder1(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));
 
  initial 
    begin
       a = 1'b0; b = 1'b0; cin = 1'b0;
       #5;a = 1'b0; b = 1'b0; cin = 1'b1;
       #5;a = 1'b0; b = 1'b1; cin = 1'b0;
       #5;a = 1'b0; b = 1'b1; cin = 1'b1;
       #5;a = 1'b1; b = 1'b0; cin = 1'b0;
       #5;a = 1'b1; b = 1'b0; cin = 1'b1;
       #5;a = 1'b1; b = 1'b1; cin = 1'b0;
       #5;a = 1'b1; b = 1'b1; cin = 1'b1;
       #5;
    end
  
  initial 
    begin 
      $monitor("A=%b B=%b Cin=%b Sum=%b Cout=%b",a,b,cin,sum,cout);
    end
  
  initial
    begin
       $dumpfile("dump.vcd"); 
       $dumpvars(1);
    end
  
 endmodule 
