module gbc(g,b);
input [3:0]g;
output [3:0]b;
assign b[3]=g[3];
assign b[2]=g[3]^g[2];
assign b[1]=g[3]^g[2]^g[1];
assign b[0]=g[3]^g[2]^g[1]^g[0];
endmodule

module gbc_tb;
	reg [3:0] g;
	wire [3:0] b;
	gbc uut (
		.g(g), 
		.b(b)
	);
	initial begin
		g=4'b0000; #100;
		g=4'b0001; #100;
		g=4'b0010; #100;
		g=4'b0011; #100;
		g=4'b0100; #100;
		g=4'b0101; #100;
		g=4'b0110; #100;
		g=4'b0111; #100;
		g=4'b1000; #100;
		g=4'b1001; #100;
		g=4'b1010; #100;
		g=4'b1011; #100;
		g=4'b1100; #100;
		g=4'b1101; #100;
		g=4'b1110; #100;
		g=4'b1111; #100;	
	end
initial $monitor("g = %4b b = %4b ",g,b);      
endmodule
