module Data_Memory (clk, reset, MemWrite, MemRead, address, Writedata, Data_out);
input clk, reset, MemWrite, MemRead;
input [31:0] address, Writedata;
output reg [31:0] Data_out;

reg [7:0] DataMemory [1024-1:0];
integer k;
initial begin


DataMemory[0] = 2;
DataMemory[1] = 4;
DataMemory[2] = 8;
DataMemory[3] = 16;
DataMemory[4] = 12;
DataMemory[5] = 7;
DataMemory[6] = 19;
DataMemory[7] = 3;
DataMemory[8] = 5;
DataMemory[9] = 10;
DataMemory[10] = 6;
DataMemory[11] = 18;
DataMemory[12] = 14;
DataMemory[13] = 20;
DataMemory[14] = 9;
DataMemory[15] = 11;
DataMemory[16] = 13;
DataMemory[17] = 1;
DataMemory[18] = 17;
DataMemory[19] = 15;
DataMemory[20] = 7;
DataMemory[21] = 2;
DataMemory[22] = 3;
DataMemory[23] = 16;
DataMemory[24] = 4;
DataMemory[25] = 12;
DataMemory[26] = 5;
DataMemory[27] = 19;
DataMemory[28] = 8;
DataMemory[29] = 6;
DataMemory[30] = 10;
DataMemory[31] = 18;




end

always @(posedge clk) begin 
if (reset==1'b1) begin
		for (k=0; k<1024; k=k+1)
		DataMemory[k]= 32'h0;
                end
	else if (MemWrite) begin 
		
			DataMemory[address] <= Writedata[7:0];
			DataMemory[address + 1] <= Writedata[15:8]; 
			DataMemory[address + 2] <= Writedata[23:16];
			DataMemory[address + 3] <= Writedata[31:24];  end
		
		end

always @(*)begin
	if (MemRead) begin
			
		
			Data_out[7:0] <= DataMemory[address];
			Data_out[15:8] <= DataMemory[address+1];
			Data_out[23:16] <= DataMemory[address+2];
			Data_out[31:24]<= DataMemory[address+3]; end
		
	
	else 
		Data_out[7:0] = 8'd0;
		Data_out[15:8] = 8'd0;
		Data_out[23:16] = 8'd0;
		Data_out[31:24]= 8'd0;
	end



endmodule