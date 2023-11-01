module top_IF;
	logic branch_sel;
	bit clk;
	logic [31:0] branch_inp;
	logic [31:0] pc_present;
	logic [31:0] inst;
	
	always #5 clk = ~clk;
	IF mod(.clk(clk), .branch_sel(branch_sel), .branch_inp(branch_inp), .pc_present(pc_present), .inst(inst));
	tb_IF test(clk, branch_sel, branch_inp, pc_present, inst);
endmodule
