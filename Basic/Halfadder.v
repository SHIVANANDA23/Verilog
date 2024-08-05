//Verilog code

module halfadder(
input a,b,
output s,c
);

assign s = a ^ b;
assign c = a & b;

endmodule

//Test Bench

module ha_tb();
reg a,b;
wire s,c;

halfadder dut(a,b,s,c);

initial begin
        a = 1'b0;
        b = 1'b0;
        #10;

        a = 1'b0;
        b = 1'b1;
        #10;

        a = 1'b1;
        b = 1'b0;
        #10;
 
        a = 1'b1;
        b = 1'b1;
        #10;

end

initial $monitor("a = %0b b = %0b s = %0b c = %0b",a,b,s,c);
endmodule


