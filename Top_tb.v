module Top_tb;
reg clk, reset;


RISCV_Top DUT (
.clk(clk),
.reset(reset)


)
;

//clock generate

initial begin

clk=0;


 end

always #50 clk = ~clk;


//reset generate


initial begin 

reset = 1'b1;
#50;

reset = 1'b0;

#400;




end




endmodule