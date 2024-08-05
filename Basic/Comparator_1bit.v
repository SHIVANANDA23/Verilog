module comparator(a,b,l,e,g );
input a,b;
output l,e,g;
assign l=(!a)&b;
assign e=(!(a^b));
assign g=a&(!b);
endmodule


module comparator_tb;
	reg a;
	reg b;
	wire l;
	wire e;
	wire g;
	comparator uut (
		.a(a), 
		.b(b), 
		.l(l), 
		.e(e), 
		.g(g)
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
initial $monitor("a = %0b b = %0b l = %0b e = %0b g = %0b",a,b,l,e,g);    
endmodule
