module Register_File(clk, reset, Rs1, Rs2, Rd, Write_data, RegWrite, Read_data1, Read_data2);

input clk, reset, RegWrite;  //input 1 bit
input [4:0] Rs1, Rs2, Rd;//5
input [31:0] Write_data;//5
output [31:0] Read_data1, Read_data2;//32

reg [31:0] Registers [31:0] ; // 32 regs 32 bit wide


initial
begin

Registers[0] = 32'd0;
Registers[1] = 1;
Registers[2] = 4;
Registers[3] = 20;
Registers[4] = 30;
Registers[5] = 40;
Registers[6] = 50;
Registers[7] = 60;
Registers[8] = 70;
Registers[9] = 80;
Registers[10] = 10;
Registers[11] = 15;
Registers[12] = 2;
Registers[13] = 35;
Registers[14] = 4;
Registers[15] = 55;
Registers[16] = 6;
Registers[17] = 75;
Registers[18] = 8;
Registers[19] = 10;
Registers[20] = 11;
Registers[21] = 22;
Registers[22] = 33;
Registers[23] = 44;
Registers[24] = 55;
Registers[25] = 66;
Registers[26] = 77;
Registers[27] = 88;
Registers[28] = 99;
Registers[29] = 4;
Registers[30] = 5;
Registers[31] = 6;

end


integer k;

assign Read_data1=Registers[Rs1];
assign Read_data2=Registers[Rs2];

always @ (posedge clk)
begin

if (reset)


	begin 

				for (k=0; k<31; k=k+1)

				begin

				Registers[k] <= 32'h0;	


				end

	end
else if (RegWrite==1'b1) Registers[Rd] = Write_data;

end



endmodule

