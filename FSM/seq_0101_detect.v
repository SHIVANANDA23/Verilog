module seq_0101_detect(din,clk,reset,y
    );
	 input din,clk,reset;
	 output reg y;
	 parameter s0=2'b00,s1=2'b01,s2=2'b10,s3=2'b11;
	 reg [1:0]cst,nst;
	
	 
	 always @(posedge clk)
	   begin
		 if(reset==1'b1)
		    cst<=s0;
		 else 
		   cst<=nst;
		end
	 always @(cst,din)
	   begin
		  case(cst)
		     s0 : begin
			         if(din==1'b0)
						  begin
							 y=1'b0;
						    nst<=s1;
							end
						else
						  begin
					  		 y=1'b0;
						     nst<=s0;
					     end
				end
		     s1 : begin
			         if(din==1'b1)
						  begin
						    y=1'b0;
						    nst<=s2;
							end
						else
						  begin
						     y=1'b0;
						     nst<=s1;
							  
					     end
				    end
		     s2 : begin
			         if(din==1'b0)
						  begin
                      y=1'b0;
						    nst<=s3;
							
							end
						else
						  begin
						     y=1'b0;
						     nst<=s0;
					     end
					end
		     s3 : begin
			         if(din==1'b1)
						  begin
						    y=1'b1;
						    nst<=s2;
							end
						else
						  begin
						     y=1'b0;
						     nst<=s1;
					     end
					end
			 endcase
		end
endmodule
module seq_0101_detect_tb;

	// Inputs
	reg din;
	reg clk;
	reg reset;
	reg [31:0]data;
	integer i;
	

	// Outputs
	wire y;

	// Instantiate the Design Under Test (DUT)
	seq_0101_detect dut (din,clk,reset,y
	);
	initial 
	   begin
		  clk=1'b0;
		  reset=1'b1;#15
		  reset=1'b0;
		 end
	always #5 clk=~clk;
	initial 
	  begin
	    data=32'b00100101010111010010010101011101;
		 #15;
	    for(i=0;i<32;i=i+1)
	       begin
		    din=data[31-i];#10;
			end
		end
    
endmodule

