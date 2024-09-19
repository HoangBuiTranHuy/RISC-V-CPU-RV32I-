module RISCV_Top (
input clk,reset);


wire [31:0] PCoutTop, NexttoPCout, instruction_outTop, Read_data2Top,
Read_data1Top, toALU, ALU_resultTop, Data_outTop, writeBacktop, immOutTop;

wire [3:0] ALUControl_outTop;

wire RegWriteTop, ALUSrcTop, MemWriteTop, MemReadTop, MemtoRegTop;

wire [1:0] ALUOpTop;
PCplus4 pc4(
.fromPC(PCoutTop),
.NexttoPC(NexttoPCout)
);



Program_Counter PC (
.clk(clk),
.reset(reset),
.PC_in(NexttoPCout),
.PC_out(PCoutTop)

);



Instruction_Memory Imem(
.clk(clk),
.reset(reset),
.read_address(PCoutTop),
.Instruction_out(instruction_outTop)

); 




Register_File Register_File (
.clk(clk),
.reset(reset),
.Rs1(instruction_outTop[19:15]),
.Rs2(instruction_outTop[24:20]),
.Rd(instruction_outTop[11:7]),
.Write_data(writeBacktop),
.RegWrite(RegWriteTop), 
.Read_data1(Read_data1Top),
.Read_data2(Read_data2Top)
);




ALU ALU(
.A(Read_data1Top),
.B(toALU), 
.zero(), 
.ALUControl_in(ALUControl_outTop), 
.ALU_result(ALU_resultTop)
);


Mux1 Mux1(
.Sel(ALUSrcTop), 
.A1(Read_data2Top), 
.B1(immOutTop), 
.Mux1_out(toALU)
);


ALUControl ALUControl (
.ALUOp(ALUOpTop), 
.funct7(instruction_outTop[30]), 
.funct3(instruction_outTop[14:12]), 
.ALUControl_out(ALUControl_outTop)
);

Data_Memory Data_Memory (
.clk(clk),
.reset(reset),
.MemWrite(MemWriteTop), 
.MemRead(MemReadTop), 
.address(ALU_resultTop), 
.Writedata(Read_data2Top), 
.Data_out(Data_outTop)
);





Mux2 Mux2(.
Sel(MemtoRegTop), 
.A2(ALU_resultTop), 
.B2(Data_outTop), 
.Mux2_out(writeBacktop)

);



Control_Unit Control_Unit(
.reset(reset),
.OPcode(instruction_outTop[6:0]), 
//.Branch(), 
.MemRead(MemReadTop), 
.MemtoReg(MemtoRegTop), 
.ALUOp(ALUOpTop), 
.MemWrite(MemWriteTop), 
.ALUSrc(ALUSrcTop), 
.RegWrite(RegWriteTop)
);

Immediate_Generator imm (
.instruction(instruction_outTop[31:0]),
.opcode(instruction_outTop[6:0]),
.immOut(immOutTop)

);









endmodule