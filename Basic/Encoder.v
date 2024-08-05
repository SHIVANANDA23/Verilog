module encoder(a,y);
input [7:0]y;
output [2:0]a;
assign a[0]=y[7]|y[5]|y[3]|y[1];
assign a[1]=y[2]|y[3]|y[6]|y[7];
assign a[2]=y[4]|y[5]|y[6]|y[7];
endmodule

module encoder_tb;
	reg [7:0] y;
	wire [2:0] a;
	encoder uut (
		.a(a), 
		.y(y)
	);
	initial begin
                y=8'b00000001 ; #100 ;
		y=8'b00000010 ; #100 ;
		y=8'b00000100 ; #100 ;
		y=8'b00001000 ; #100 ;
	end
initial $monitor("a = %3b y = %8b",a,y);
      
endmodule
