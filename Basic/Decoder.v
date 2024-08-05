module decoder(a,b,d);
input a,b;
output [3:0]d;
assign d[0]=(~a)&(~b);
assign d[1]=(~a)&(b);
assign d[2]=(a)&(~b);
assign d[3]=(a)&(b);
endmodule
module decoder_tb;
	reg a;
	reg b;
	wire [3:0] d;
	decoder uut (
		.a(a), 
		.b(b), 
		.d(d)
	);
	initial begin
		a = 0;
		b = 0;
		#100;
       a = 0;
		b = 1;
		#100;
a = 1;
		b = 0;
		#100;
a = 1;
		b = 1;
		#100;		

	end
initial $monitor("a = %0b b = %0b d=%4b",a,b,d);
      
endmodule
