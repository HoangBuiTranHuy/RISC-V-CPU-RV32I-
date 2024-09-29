module Immediate_Generator(instruction, opcode, immOut);

input [31:0] instruction;
input [6:0] opcode;
output reg signed [31:0] immOut;


always @(*)
begin

case (opcode)

7'b0010011: begin immOut = {{20{instruction[31]}}, instruction[31:20]}; end//imm 

7'b0000011: begin immOut = {{20{instruction[31]}}, instruction[31:20]}; end//imm load


7'b0100011: begin immOut= {{20{instruction[31]}}, instruction[31:25], instruction[11:7]}; end//store

7'b1100011: begin immOut = {{12{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0}; end //branch


endcase
end





endmodule
