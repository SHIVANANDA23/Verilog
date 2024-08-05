`timescale 1ns/1ns
`include "Nor.v"

module Nor_Tb;
  reg a,b;
  wire c;

  Nor uut(a,b,c);

  initial begin
    $dumpfile("Nor_tb.vcd");
    $dumpvars(0,Nor_Tb);
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

module Nor (a,b,c);
input a;
input b;
output  wire c;

or i1 (c,a,b);
not i2(c);

endmodule
