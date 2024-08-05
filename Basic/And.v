`timescale 1ns/1ns
`include "And.v"

module And_Tb;
  reg a,b;
  wire c;

  And uut(a,b,c);

  initial begin
    $dumpfile("And_tb.vcd");
    $dumpvars(0,And_Tb);
    a=0;
    b=0;
  end

  always begin
    #10 a=~a;
  end

  always begin
    #20 b=~b;
  end

  always @(a or b or c) begin
    $display("A = %b B=%b C=%b\n",a,b,c);
  end
initial
  #1000 $finish;
endmodule

module And (a,b,c);
input a;
input b;
output  wire c;
and i1 (c,a,b);
endmodule
