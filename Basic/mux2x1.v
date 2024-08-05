module mux2x1_tb();
reg[1:0]i;
reg s;
wire y;
mux2x1 dut(i,s,y);

initial begin
s=1'b0;
i=2'b00;
end
always #50 s=s+1'b1;
always #50 i=i+2'b01;
endmodule

module mux2x1(s,i,y);
input [1:0]i;
input s;
output y;
assign y=(~s&i[0])|(s&i[1]);
endmodule
