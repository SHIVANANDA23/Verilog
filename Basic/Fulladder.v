module fulladder(
input a,b,cin,
output s,cout
);

assign s = a ^ b ^ cin;
assign cout = ((a ^ b) & cin)|(a & b);

endmodule

module fulladder_tb();
reg a,b,cin;
wire s,cout;

fulladder dut(a,b,cin,s,cout);

initial a=1'b0;
initial b=1'b0;
initial cin=1'b0;

always #20 a=a+1'b1;
always #25 b=b+1'b1;
always #30 cin=cin+1'b1;

initial $monitor("a = %0b b = %0b cin = %0b s = %0b cout = %0b",a,b,cin,s,cout);

endmodule
