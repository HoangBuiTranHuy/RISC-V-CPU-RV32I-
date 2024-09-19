module ALUControl (ALUOp, funct7, funct3, ALUControl_out);
input [1:0] ALUOp;
input [31:25] funct7;
input [14:12] funct3;

output reg [3:0] ALUControl_out;



always @ (*)
begin
	
	case({ALUOp, funct7, funct3})
	
	//12'b00_xxxxxxx_xxx:  ALUControl_out = 4'b0010; 
	//12'bx1_xxxxxxx_xxx:  ALUControl_out = 4'b0110; 
	12'b10_0000000_000:  ALUControl_out = 4'b0010; //add
	12'b10_0100000_000:  ALUControl_out = 4'b0110; ///sub
	12'b10_0000000_111:  ALUControl_out = 4'b0000; //AND
	12'b10_0000000_110:  ALUControl_out = 4'b0001; //OR
	
// I type	
	12'b11_xxxxxxx_000:  ALUControl_out = 4'b0010; //A+imm
	12'b11_xxxxxxx_111:  ALUControl_out = 4'b0000; //A&imm
	12'b11_xxxxxxx_110:  ALUControl_out = 4'b0001; //A|imm
//lw,sw case	

	12'b01_xxxxxxx_010:  ALUControl_out = 4'b0010; //A+imm


	
	default: 				ALUControl_out = 4'b0010;
	endcase

end

endmodule