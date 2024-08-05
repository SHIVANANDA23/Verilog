module carry(a,b,s,cin,cout);
input [3:0]a,b;
input cin;
output[3:0]s;
output cout;
wire[3:0]p;
wire[3:0]g;
wire[3:0]c;
assign p[0]=a[0]^b[0];
assign g[0]=a[0]&b[0];
assign s[0]=p[0]^cin;
assign c[1]=g[0]|(p[0]&cin);

assign p[1]=a[1]^b[1];
assign g[1]=a[1]&b[1];
assign s[1]=p[1]^c[1];
assign c[2]=g[1]|(p[1]&g[0])|p[1]&p[0]&cin;

assign p[2]=a[2]^b[2];
assign g[2]=a[2]&b[2];
assign s[2]=p[2]^c[2];
assign c[3]=g[2]|(p[2]&g[1])|(p[2]&p[1]&g[0])|(p[2]&p[1]&p[0]&cin);

assign p[3]=a[3]^b[3];
assign g[3]=a[3]&b[3];
assign s[3]=p[3]^c[3];
assign cout=g[3]|(p[3]&c[3]);

endmodule

module carry_tb;
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	wire [3:0] sum;
	wire cout;
	carry uut (
		.a(a), 
		.b(b), 
		.s(s), 
		.cin(cin), 
		.cout(cout)
	);
initial a=4'b0000;

initial b=4'b0000;
initial cin=0;
always #20 a = a+4'b0001;
always #20 b = b+4'b0001;
always #20 cin = cin+1'b1;
initial $monitor("a = %4b b = %4b cin = %0b s = %4b cout = %0b",a,b,cin,s,cout);
endmodule
