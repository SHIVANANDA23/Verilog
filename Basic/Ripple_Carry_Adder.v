module RCA(a,b,cin,cout,s);
input [3:0]a,b;
input cin;
output cout;
output [3:0]s;
wire [2:0]c;
assign s[0] = a[0] ^ b[0] ^ cin;
assign c[0] = (a[0] & b[0])|(b[0] & cin)|(cin & a[0]);
assign s[1] = a[1] ^ b[1] ^ c[0];
assign c[1] = (a[1] & b[1])|(b[1] & c[0])|(c[0] & a[1]);
assign s[2] = a[2] ^ b[2] ^ c[1];
assign c[2] = (a[2] & b[2])|(b[2] & c[1])|(c[1] & a[2]);
assign s[3] = a[3] ^ b[3] ^ c[2];
assign cout = (a[3] & b[3])|(b[3] & c[2])|(c[2] & a[3]);
endmodule

module tb_rca();
reg [3:0]a,b;
reg cin;
wire cout;
wire [3:0]s;
RCA dut(a,b,cin,cout,s);
initial a=4'b0000;
initial b=4'b0000;
initial cin=1'b0;
always #20 a=a+4'b0001;
always #25 b=b+4'b0001;
always #30 cin=cin+1'b1;
initial $monitor("a=%0b b=%0b s=%0b cout=%0b",a,b,s,cout);
endmodule
