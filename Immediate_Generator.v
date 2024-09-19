module Immediate_Generator(instruction, opcode, immOut);

input [31:0] instruction;
input [6:0] opcode;
output reg signed [31:0] immOut;


always @(*)
begin

case (opcode)

7'b0010011: begin immOut = {{20{instruction[11]}}, instruction[31:20]}; end//imm 

7'b0000011: begin immOut = {{20{instruction[11]}}, instruction[31:20]}; end//imm lw


7'b0100011: begin immOut= {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; end//store

//SB = {{12{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0}; //branch


endcase
end





endmodule
