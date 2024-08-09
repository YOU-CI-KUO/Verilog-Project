`timescale 1ns/1ns

module tb_ALU;
  wire [7:0] Z;
  wire Cout;
  reg [4:0] SEL;
  reg [7:0] A, B;
  ALU ALU1(.A(A), .B(B), .SEL(SEL), .Z(Z), .Cout(Cout));
  
    initial 
    begin 
    // test A pass through
    $display("\nTest A pass through");
    $display("A\t\tB\t\tZ\t\tCout\tSEL\t\tTest Result");    
    SEL = 5'b00000;
    A = 8'b00000011;
    B = 8'b00001100;
    #5
    if ( Z==A )
      $display("%b\t%b\t%b\t%b\t%b\t\tPASS", A,B,Z,Cout,SEL);
    else
      $display("%b\t%b\t%b\t%b\t%b\t\tFAIL", A,B,Z,Cout,SEL);
    
    // test B pass through
    $display("\nTest B pass through");
    $display("A\t\tB\t\tZ\t\tCout\tSEL\t\tTest Result");    
    SEL = 5'b00001;
    A = 8'b00000011;
    B = 8'b00001100;
    #5
    if ( Z==B )
      $display("%b\t%b\t%b\t%b\t%b\t\tPASS", A,B,Z,Cout,SEL);
    else
      $display("%b\t%b\t%b\t%b\t%b\t\tFAIL", A,B,Z,Cout,SEL);

    // Test bitwise and
    $display("\nTest bitwise AND");
    $display("A\t\tB\t\tZ\t\tCout\tSEL\t\tTest Result");    
    SEL = 5'b00010;
    A = 8'b00000011;
    B = 8'b00001100;
    #5
    $display("%b\t%b\t%b\t%b\t%b\t\tPASS", A,B,Z,Cout,SEL);
    
    // test bitwise or
    $display("\nTest bitwise OR");
    $display("A\t\tB\t\tZ\t\tCout\tSEL\t\tTest Result");    
    SEL = 5'b00011;
    A = 8'b00000011;
    B = 8'b00001100;
    #5
    $display("%b\t%b\t%b\t%b\t%b\t\tFAIL", A,B,Z,Cout,SEL);

   	// test subtract A-B
    $display("\nTest subtract");
    $display("A\t\tB\t\tZ\t\tCout\tSEL\t\tTest Result");    
    SEL = 5'b00100;
    A = 8'b00010110;
    B = 8'b00001100;
    #5
    if ( Z==A-B )
      $display("%b\t%b\t%b\t%b\t%b\t\tPASS", A,B,Z,Cout,SEL);
    else
      $display("%b\t%b\t%b\t%b\t%b\t\tFAIL", A,B,Z,Cout,SEL);

    // Test ADD
    $display("Test ADD");
    $display("A\t\tB\t\tZ\t\tCout\tSEL\t\tTest Result");    
    SEL = 5'b00101;
    A = 8'b00000011;
    B = 8'b00001100;
    #5
    if ( {Cout,Z}== A+B )
      $display("%b\t%b\t%b\t%b\t%b\t\tPASS", A,B,Z,Cout,SEL);
    else
      $display("%b\t%b\t%b\t%b\t%b\t\tFAIL", A,B,Z,Cout,SEL);
     
    // test increment Z
    $display("\nTest increment");
    $display("A\t\tB\t\tZ\t\tCout\tSEL\t\tTest Result");
    SEL = 5'b00110;
    A = 8'b00000110; 
    #5
    if ( Z==8'b00000111 )
      $display("%b\t%b\t%b\t%b\t%b\t\tPASS", A,B,Z,Cout,SEL);
    else
      $display("%b\t%b\t%b\t%b\t%b\t\tFAIL", A,B,Z,Cout,SEL);
	    
    // test add and increment
    $display("\nTest ADD and increment");
    $display("A\t\tB\t\tZ\t\tCout\tSEL\t\tTest Result");    
    SEL = 5'b00111;
    A = 8'b00000110;
    B = 8'b11101100;
    #5
    if ( {Cout,Z}==A+B+1 )
      $display("%b\t%b\t%b\t%b\t%b\t\tPASS", A,B,Z,Cout,SEL);
    else
      $display("%b\t%b\t%b\t%b\t%b\t\tFAIL", A,B,Z,Cout,SEL);
    
    // test subtract and decrement
    $display("\nTest subtract and decrement");
    $display("A\t\tB\t\tZ\t\tCout\tSEL\t\tTest Result");    
    SEL = 5'b01000;
    A = 8'b11101100;
    B = 8'b00000110;
    
    #5
    if ( {Cout,Z}==A-B-1 ) 
      $display("%b\t%b\t%b\t%b\t%b\t\tPASS", A,B,Z,Cout,SEL);
    else
      $display("%b\t%b\t%b\t%b\t%b\t\tFAIL", A,B,Z,Cout,SEL);
    
    // test default
    $display("\nTest default");
    $display("A\t\tB\t\tZ\t\tCout\tSEL\t\tTest Result");    
    SEL = 5'b11111;
    A = 8'b00000110;
    B = 8'b11101100;
    #5
    if ( Z==8'b00000000 )
      $display("%b\t%b\t%b\t%b\t%b\t\tPASS", A,B,Z,Cout,SEL);
    else
      $display("%b\t%b\t%b\t%b\t%b\t\tFAIL", A,B,Z,Cout,SEL);    
  end
  
  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars(1);    
  end
  
endmodule
