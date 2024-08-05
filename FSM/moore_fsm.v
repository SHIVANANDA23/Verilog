module moore_fsm_tb();
reg din;
reg reset;
reg clk;
wire y;
reg[10:0]data;
integer i;

moore_fsm dut(din,reset,clk,y);

initial begin
reset=#10 1'b1;
reset=1'b0;
clk=1'b0;
data=11'b00101001111;
for(i=0;i<11;i=i+1)
begin 
#50 din=data[i];
end
end
always #25 clk=~clk;
endmodule

module moore_fsm(din,reset,clk,y);
input din,reset,clk;
output reg y;
reg[2:0]cst,nst;
parameter s0=3'b000,s1=3'b001,s2=3'b010,s3=3'b011,s4=3'b100;

always @(cst or din)
begin
case(cst)
s0:begin y=1'b0;
if(din==1'b1) nst=s0;
else nst=s1;end

s1:begin y=1'b0;
if(din==1'b1) nst=s2;
else nst=s1;end

s2:begin y=1'b0;
if(din==1'b1) nst=s4;
else nst=s1;end

s3:begin y=1'b0;
if(din==1'b1) nst=s0;
else nst=s3;end

s4:begin y=1'b1;
if(din==1'b1) nst=s0;
else nst=s3;end

default:nst=s0;
endcase
end

always @(posedge clk)
begin
if(reset)cst<=s0;
else cst<=nst;
end
endmodule



