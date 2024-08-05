`timescale 1ns/1ns
`include "Nand.v"

module Nand_Tb;
  reg a,b;
  wire c;

  Nand uut(a,b,c);

  initial begin
    $dumpfile("Nand_tb.vcd");
    $dumpvars(0,Nand_Tb);
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

module Nand (a,b,c);
input a;
input b;
output  wire c;

and i1 (c,a,b);
not i2(c);

endmodule
