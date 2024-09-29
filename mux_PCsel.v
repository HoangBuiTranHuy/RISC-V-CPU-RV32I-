module mux_PCsel (PC_in, mux_Read_data1, PCsel, ALUPCimm_out);

input [31:0] PC_in, mux_Read_data1;
input PCsel;
output [31:0] ALUPCimm_out;


assign ALUPCimm_out = (PCsel) ? PC_in : mux_Read_data1;

endmodule