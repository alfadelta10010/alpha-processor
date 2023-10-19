module top_IF(clk, reset, branch_sel, branch_imp, pc_present, inst);
	input logic branch_sel;
	input logic reset;
	input bit clk;
	input logic branch_imp;
	output logic [4:0] pc_present;
	output logic [31:0] inst;
	
	const [2:0] bit offset = 4;
	const bit cin = 0;
	logic dump;
	logic add_out;
	logic pc_in;
	
	always 
		#5; clk = ~clk;
	
	InstMem mem(.pc_present(addr), .inst(dout));
	adder add #(N=5) (.offset(a), .pc_present(b), .add_out(s), .dump(cout), .cin(cin));
	mux21 mux #(N=5) (.add_out(a), .pc_in(y), .branch_inp(b), .branch_sel(s));
	pc pc1 (.clk(clk), .pc_in(inp), .pc_present(pc_out));
endmodule