module pipe_ex2 (Zout, rs1, rs2, rd, func, addr, clk1, clk2);
input [3:0] rs1, rs2, rd, func;
input [7:0] addr;
input wire clk1, clk2; 
output [15:0] Zout;
reg [15:0] L12_A, L12_B, L23_Z, L34_Z;
reg [3:0] L12_rd, L12_func, L23_rd;
reg [7:0] L12_addr, L23_addr, L34_addr;
reg [15:0] regbank [0:15]; 
reg [15:0] mem [0:255]; 
assign Zout = L34_Z;

always @(posedge clk1)
begin
L12_A <= #2 regbank[rs1];
L12_B <= #2 regbank[rs2];
L12_rd <= #2 rd;
L12_func <= #2 func;
L12_addr <= #2 addr; // ** stage 1 **
end

always @(negedge clk2)//Stage 2
begin
case (func)
0: L23_Z <= #2 L12_A + L12_B;
1: L23_Z <= #2 L12_A - L12_B;
2: L23_Z <= #2 L12_A * L12_B;
3: L23_Z <= #2 L12_A;
4: L23_Z <= #2 L12_B;
5: L23_Z <= #2 L12_A & L12_B;
6: L23_Z <= #2 L12_A | L12_B;
7: L23_Z <= #2 L12_A ^ L12_B;
8: L23_Z <= #2 - L12_A;
9: L23_Z <= #2 - L12_B;
10: L23_Z <= #2 L12_A >> 1;
11: L23_Z <= #2 L12_A << 1;
default: L23_Z <= #2 16'hxxxx;
endcase
L23_rd <= #2 L12_rd;
L23_addr <= #2 L12_addr; 
end

always @(posedge clk1)//STAGE 3 
begin
regbank[L23_rd] <= #2 L23_Z;
L34_Z <= #2 L23_Z;
L34_addr <= #2 L23_addr; 
end
always @(negedge clk2)// STAGE 4 
begin
mem[L34_addr] <= #2 L34_Z; 
end
endmodule



module pipe2_test;
wire [15:0] Z;
reg [3:0] rs1, rs2, rd, func;
reg [7:0] addr;
reg clk1, clk2;
integer k;
pipe_ex2 MYPIPE (Z, rs1, rs2, rd, func, addr, clk1, clk2);
initial
begin
clk1 = 0; clk2 = 0;
repeat (20) // Generating two-phase clock
begin
#5 clk1 = 1; #5 clk1 = 0;
#5 clk2 = 1; #5 clk2 = 0;
end
end
initial
for (k=0; k<16; k=k+1)
MYPIPE.regbank[k] = k; // Initialize registers

initial
begin
#5 rs1 = 3; rs2 = 5; rd = 10; func = 0; addr = 125; // ADD
#20 rs1 = 3; rs2 = 8; rd = 12; func = 2; addr = 126; // MUL
#20 rs1 = 10; rs2 = 5; rd = 14; func = 1; addr = 128; // SUB
#20 rs1 = 7; rs2 = 3; rd = 13; func = 11; addr = 127; // SLA
#20 rs1 = 10; rs2 = 5; rd = 15; func = 1; addr = 129; // SUB
#20 rs1 = 12; rs2 = 13; rd = 16; func = 0; addr = 130; // ADD
#60 for (k=125; k<131; k=k+1)
$display ("Mem[%3d] = %3d", k, MYPIPE.mem[k]);
end
initial
begin
$dumpfile ("pipe2.vcd");
$dumpvars (0, pipe2_test);
$monitor ("Time: %3d, F = %3d", $time, Z);
#300 $finish;
end
endmodule
