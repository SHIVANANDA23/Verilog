`timescale 1ns/1ns
`include "Xor.v"

module Xor_Tb;
  reg a,b;
  wire c;

  Xor uut(a,b,c);

  initial begin
    $dumpfile("Xor_tb.vcd");
    $dumpvars(0,Xor_Tb);
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

module Xor (a,b,c);
input a;
input b;
output  wire c;
xor i1 (c,a,b);
endmodule
