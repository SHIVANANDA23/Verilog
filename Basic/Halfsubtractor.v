//Verilog Code

module halfsubtractor(
input a,b,
output diff,borr
 );

 assign diff = a ^ b;
 assign borr = ( ~a) & b;

endmodule 

//Test Bench

module hs_tb();
 reg a,b;
 wire diff,borr;

halfsubtractor dut(a,b,diff,borr);
   
initial begin
   a=1'b0;
   b=1'b0;
   #10;

   a=1'b0;
   b=1'b1;
   #10;

   a=1'b1;
   b=1'b0;
   #10;
 
   a=1'b1;
   b=1'b1;
   #10;

end

   initial $monitor("a = %0b b = %0b diff = %0b borr = %0b",a,b,diff,borr);
endmodule
   

   
		      

