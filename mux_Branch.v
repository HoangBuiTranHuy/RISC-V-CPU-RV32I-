module mux_Branch (Branch, plus4, pcimm, muxBranch_Out);
input [31:0] plus4, pcimm;
input Branch;
output [31:0] muxBranch_Out;

assign muxBranch_Out = (Branch) ? pcimm : plus4;

endmodule
