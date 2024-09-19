module Control_Unit(reset, OPcode, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
input reset;
input [6:0] OPcode;
output reg ALUSrc, MemtoReg;
output reg RegWrite, MemRead, MemWrite;
output reg Branch;
output reg [1:0] ALUOp;

always @ (*)
begin

if (reset) begin 
			{ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp} <= 7'b0000000 ;
				end
				
	else begin			
		case (OPcode)
		7'b0110011: // R-type instruction
					begin
						ALUSrc<=0;
						MemtoReg<=0;
						RegWrite<=1;
						MemRead<=0;
						MemWrite<=0;
						Branch<=0;
						ALUOp<=2'b10;
					end
					
		7'b0010011: //I-type instruction
					begin
						ALUSrc<=1;
						MemtoReg<=0;
						RegWrite<=1;
						MemRead<=0;
						MemWrite<=0;
						Branch<=0;
						ALUOp<=2'b11;
					end
					
		7'b0000011: begin//I-type instruction lw
						ALUSrc<=1;
						MemtoReg<=1;
						RegWrite<=1;
						MemRead<=1;
						MemWrite<=0;
						//Branch<=0;
						ALUOp<=2'b01;
		
		        end
		7'b0100011: begin//S-type instruction sw
						ALUSrc<=1;
						MemtoReg<=0;
						RegWrite<=0;
						MemRead<=0;
						MemWrite<=1;
						//Branch<=0;
						ALUOp<=2'b01;
		
		        end
		
		
		
		/*7'b0000011: // ld instruction
					begin
						ALUSrc<=1;
						MemtoReg<=1;
						RegWrite<=1;
						MemRead<=1;
						MemWrite<=0;
						Branch<=0;
						ALUOp<=2'b00;
					end		
					
		7'b0100011: // sd instruction
					begin
						ALUSrc<=1;
						MemtoReg<=1'bx;
						RegWrite<=0;
						MemRead<=0;
						MemWrite<=1;
						Branch<=0;
						ALUOp<=2'b00;
					end
					
		7'b1100011: // beq instruction
					begin
						ALUSrc<=0;
						MemtoReg<=1'bx;
						RegWrite<=0;
						MemRead<=0;
						MemWrite<=0;
						Branch<=1;
						ALUOp<=2'b01;
					end*/
		default: begin
						ALUSrc<=0;
						MemtoReg<=0;
						RegWrite<=1;
						MemRead<=0;
						MemWrite<=0;
						Branch<=0;
						ALUOp<=2'b10;
					end
		endcase
		

	end


end






endmodule






