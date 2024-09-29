module Control_Unit(reset, BrLT, BrEq, BrUn, PCsel, inst, OPcode, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
input reset, BrLT, BrEq;
input [6:0] OPcode;
input [31:0] inst;
output reg ALUSrc, MemtoReg;
output reg RegWrite, MemRead, MemWrite;
output reg Branch, BrUn, PCsel;
output reg [1:0] ALUOp;

always @ *
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
						PCsel <= 1'b0;
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
						PCsel <= 1'b0;
						ALUOp<=2'b11;
					end
					
		7'b0000011: begin//I-type instruction lw
						ALUSrc<=1;
						MemtoReg<=1;
						RegWrite<=1;
						MemRead<=1;
						MemWrite<=0;
						Branch<=0;
						PCsel <= 1'b0;
						ALUOp<=2'b01;
		
		        end
		7'b0100011: begin//S-type instruction sw
						ALUSrc<=1;
						MemtoReg<=0;
						RegWrite<=0;
						MemRead<=0;
						MemWrite<=1;
						Branch<=0;
						PCsel <= 1'b0;
						ALUOp<=2'b01;
		
		        end

	
	// Branch (B-type instructions)
            7'b1100011: begin
                ALUSrc <= 1;
                MemtoReg <= 0;
                RegWrite <= 0;
                MemRead <= 0;
                MemWrite <= 0;
                ALUOp <= 2'b01;
					 PCsel <= 1'b1;
                // Branch control based on funct3 field (inst[14:12])
                case (inst[14:12])
                    3'b000: begin 
                        Branch <= BrEq;    // BEQ: Branch if equal
                        BrUn <= 0;         // Signed comparison
                    end
                    3'b001: begin
                        Branch <= ~BrEq;   // BNE: Branch if not equal
                        BrUn <= 0;         // Signed comparison
                    end
                    3'b100: begin
                        Branch <= BrLT;    // BLT: Branch if less than (signed)
                        BrUn <= 0;         // Signed comparison
                    end
                    3'b101: begin
                        Branch <= ~BrLT;   // BGE: Branch if greater or equal (signed)
                        BrUn <= 0;         // Signed comparison
                    end
                    3'b110: begin
                        Branch <= BrLT;    // BLTU: Branch if less than (unsigned)
                        BrUn <= 1;         // Unsigned comparison
                    end
                    3'b111: begin
                        Branch <= ~BrLT;   // BGEU: Branch if greater or equal (unsigned)
                        BrUn <= 1;         // Unsigned comparison
                    end
                    default: begin
                        Branch <= 0;       // Default: No branch
                        BrUn <= 0;         // Default to signed
                    end
                endcase
            end
		
		
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






