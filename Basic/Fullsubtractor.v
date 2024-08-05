module fullsub(
input a,b,bin,
output diff,borr
);

assign diff = a ^ b ^ bin;
assign borr = ((~a)&(b ^ bin))|(b & bin);

endmodule

module fullsub_tb();
reg a,b,bin;
wire diff,borr;

fullsub dut(a,b,bin,diff,borr);

initial begin
a=1'b0;
b=1'b0;
bin=1'b0;
#10;

a=1'b0;
b=1'b0;
bin=1'b1;
#10;

a=1'b0;
b=1'b1;
bin=1'b0;
#10;

a=1'b0;
b=1'b1;
bin=1'b1;
#10;

a=1'b1;
b=1'b0;
bin=1'b0;
#10;

a=1'b1;
b=1'b0;
bin=1'b1;
#10;

a=1'b1;
b=1'b1;
bin=1'b0;
#10;

a=1'b1;
b=1'b1;
bin=1'b1;
#10;

end

initial $monitor("a = %0b b = %0b bin = %0b diff = %0b borr = %0b",a,b,bin,diff,borr);

endmodule
