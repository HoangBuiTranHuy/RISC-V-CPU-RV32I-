module Instruction_Memory(
 
input [31:0] read_address, 
output reg [31:0] Instruction_out);

reg [7:0] Imemory [63:0];  //making mem
 initial begin
 {Imemory[3], Imemory[2], Imemory[1], Imemory[0]} = 32'b0000000_00011_00010_000_00001_0110011; // add x1, x2, x3
 {Imemory[7], Imemory[6], Imemory[5], Imemory[4]} = 32'b0000000_00011_00010_000_00001_0110011; // add x1, x2, x3
   
   
end





always @(read_address) begin
    Instruction_out[7:0] = Imemory[read_address + 0];
    Instruction_out[15:8] = Imemory[read_address + 1];
    Instruction_out[23:16] = Imemory[read_address + 2];
    Instruction_out[31:24] = Imemory[read_address + 3];
  end


  
endmodule
/*{Imemory[7], Imemory[6], Imemory[5], Imemory[4]} = 32'h00000433;//2 add x8, x0, x0 # i iterator (starts at 0)
 {Imemory[11], Imemory[10], Imemory[9], Imemory[8]} = 32'h04b40863;//3 outerloop: beq x8, x11, outerexit #i < 10
 {Imemory[15], Imemory[14], Imemory[13], Imemory[12]} = 32'h00800eb3;//4 add x29, x0, x8 # j iterator (set to i each outer loop)
 {Imemory[19], Imemory[18], Imemory[17], Imemory[16]} = 32'h000409b3;//5 add x19, x8, x0
 {Imemory[23], Imemory[22], Imemory[21], Imemory[20]} = 32'h013989b3;//6 add x19, x19, x19
 {Imemory[27], Imemory[26], Imemory[25], Imemory[24]} = 32'h013989b3;//7 add x19, x19, x19
 {Imemory[31], Imemory[30], Imemory[29], Imemory[28]} = 32'h013989b3;//8 add x19, x19, x19
 {Imemory[35], Imemory[34], Imemory[33], Imemory[32]} = 32'h02be8663;//9 innerloop: beq x29, x11, innerexit #j < 10
 {Imemory[39], Imemory[38], Imemory[37], Imemory[36]} = 32'h001e8e93;//10 addi x29, x29, 1 # increment j by 1
 {Imemory[43], Imemory[42], Imemory[41], Imemory[40]} = 32'h00898993;//11 addi x19, x19, 8 # increment j offset
 {Imemory[47], Imemory[46], Imemory[45], Imemory[44]} = 32'h00093d03;//12 ld x26, 0x0(x18)     # load a[i] into register
 {Imemory[51], Imemory[50], Imemory[49], Imemory[48]} = 32'h0009bd83;//13 ld x27, 0x0(x19)     # load a[j] into register
 {Imemory[55], Imemory[54], Imemory[53], Imemory[52]} = 32'h01bd4463;//14 blt x26, x27, bubblesort # if a[i] < a[j], dont restart loop but bubble sort
 {Imemory[59], Imemory[58], Imemory[57], Imemory[56]} = 32'h0;//15 beq x0,x0, innerloop # unconditional loop
 {Imemory[63], Imemory[62], Imemory[61], Imemory[60]} = 32'h0;//16 bubblesort: add x5, x0, x26 # int temp = a[i]

//Imemory[4] = 32'b0000000_00011_00010_000_00001_0110011; // add x1, x2, x3
//Imemory[8] = 32'b0000000_01001_00111_000_00110_0110011; // add x6, x7, x9
//Imemory[4] = 32'b0000000_01001_00010_000_00001_0010011; // addi x1, x2, 9
//Imemory[8] = 32'b0000000_11110_00111_000_00110_0010011; // addi x6, x7, 30
//Imemory[4] = 32'b0000000_01000_00010_010_01110_0000011; // lw x14, 8 (x2)
//Imemory[4] = 32'b0000001_01110_00010_010_00100_0100011; // sw x14, 36 (x2)
//Imemory[12] = 32'b0000000_11000_01001_001_01100_1100011; // bne x9, x24, Exit
//Imemory[16] = 32'b0000000_00001_10110_000_10110_0010011; // addi x22, x22, 1 
//Imemory[20] = 32'b1111111_00000_00000_000_01101_1100011; // beq x0, x0, Loop*/