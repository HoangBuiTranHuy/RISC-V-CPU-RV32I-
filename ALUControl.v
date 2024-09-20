module ALUControl (ALUOp, funct7, funct3, ALUControl_out);
input [1:0] ALUOp;
input funct7;
input [14:12] funct3;

output reg [3:0] ALUControl_out;



always @ (*)
begin
	
	case({ALUOp, funct7, funct3})
	
	//6'b00_x_xxx:  ALUControl_out = 4'b0010; 
	//6'bx1_x_xxx:  ALUControl_out = 4'b0110; 
	6'b10_0_000:  ALUControl_out = 4'b0010; //add
	6'b10_1_000:  ALUControl_out = 4'b0110; ///sub
	6'b10_0_111:  ALUControl_out = 4'b0000; //AND
	6'b10_0_110:  ALUControl_out = 4'b0001; //OR
	//6'b10_0_010:  ALUControl_out = 4'b0011; //XOR
	
// I type	
	6'b11_x_000:  ALUControl_out = 4'b0010; //A+imm
	6'b11_x_111:  ALUControl_out = 4'b0000; //A&imm
	6'b11_x_110:  ALUControl_out = 4'b0001; //A|imm
//lw,sw case	

	6'b01_x_010:  ALUControl_out = 4'b0010; //A+imm


	
	default: 				ALUControl_out = 4'b0010;
	endcase

end

endmodule