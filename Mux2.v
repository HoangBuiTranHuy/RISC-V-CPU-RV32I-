module Mux2 (Sel, A2, B2, Mux2_out);

input Sel;
input [31:0] A2, B2;
output [31:0] Mux2_out;



assign Mux2_out = (Sel == 0)? A2 : B2;

endmodule 

