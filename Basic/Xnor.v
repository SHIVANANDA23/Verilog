`timescale 1ns/1ns
`include "Xnor.v"

module Xnor_Tb;
  reg a,b;
  wire c;

  Xnor uut(a,b,c);

  initial begin
    $dumpfile("Xnor_tb.vcd");
    $dumpvars(0,Xnor_Tb);
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

module Xnor (a,b,c);
input a;
input b;
output  wire c;

xor i1 (c,a,b);
not i2(c);

endmodule
