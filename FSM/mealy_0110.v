// 0110

module test_sequence;
reg clk, x, reset;
wire z;
seq_detector SEQ (x, clk, reset, z);
initial
begin
clk = 1'b0; reset = 1'b1;
#15 reset = 1'b0;
end

always #5 clk=~clk;

initial
begin
#12 x = 0; #10 x = 0; #10 x = 1; #10 x = 1;
#10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
#10 x = 0; #10 x = 1; #10 x = 1; #10 x = 0;
# 50 $finish;
end

initial
begin
$monitor("x = %b Z = %b",x,z);
end

endmodule









module seq_detector (x, clk, reset, z);
input x, clk, reset;
output reg z;
parameter S0=0, S1=1, S2=2, S3=3;
reg [0:1] PS, NS;

always @(posedge clk or posedge reset)
if (reset) PS <= S0;
else
PS <= NS;

always @(PS,x)
case (PS)
S0: begin
z = x ? 0 : 0;
NS = x ? S0 : S1;
end

S1: begin
z = x ? 0 : 0;
NS = x ? S2 : S1;
end
S2: begin
z = x ? 0 : 0;
NS = x ? S3 : S1;
end
S3: begin
z = x ? 0 : 1;
NS = x ? S0 : S1;
end
endcase
endmodule
