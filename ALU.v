module ALU(A,B,ALUControl_in, ALU_result);
input [31:0] A,B;

input [3:0] ALUControl_in;
output reg [31:0] ALU_result;



always @ (*)

begin
case (ALUControl_in)

4'b0000: begin ALU_result <= A&B; end
4'b0001: begin  ALU_result <= A|B; end
4'b0010: begin  ALU_result <= A+B; end
4'b0110: begin ALU_result <= A-B; end
default: begin ALU_result <= A+B; end
endcase
end

endmodule
