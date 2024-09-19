module Instruction_Memory(
input clk, reset, 
input [31:0] read_address, 
output [31:0] Instruction_out);

reg [31:0] Imemory [63:0];  //making mem


assign Instruction_out = Imemory[read_address];
integer k;

always @(posedge clk)
begin

if (reset) begin
for (k=0; k<64; k=k+1)
				begin
 
 Imemory[k]<=32'b0;
							end		
			end
 
else if (!reset) 

//Imemory[4] = 32'b0000000_00011_00010_000_00001_0110011; // add x1, x2, x3
//Imemory[8] = 32'b0000000_01001_00111_000_00110_0110011; // add x6, x7, x9
//Imemory[4] = 32'b0000000_01001_00010_000_00001_0010011; // addi x1, x2, 9
//Imemory[8] = 32'b0000000_11110_00111_000_00110_0010011; // addi x6, x7, 30
//Imemory[4] = 32'b0000000_01000_00010_010_01110_0000011; // lw x14, 8 (x2)
Imemory[4] = 32'b0000001_01110_00010_010_00100_0100011; // sw x14, 36 (x2)
//Imemory[12] = 32'b0000000_11000_01001_001_01100_1100011; // bne x9, x24, Exit
//Imemory[16] = 32'b0000000_00001_10110_000_10110_0010011; // addi x22, x22, 1 
//Imemory[20] = 32'b1111111_00000_00000_000_01101_1100011; // beq x0, x0, Loop
 
 
end
endmodule