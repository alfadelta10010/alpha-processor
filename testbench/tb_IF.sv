// https://edaplayground.com/x/r3zg
module tb_IF(branch_sel_tb, branch_inp_tb, pc_present_tb, inst_tb);
	logic branch_sel_tb;
	bit clk_tb;
	bit reset_tb;
	logic [31:0] branch_inp_tb;
	logic [31:0] pc_present_tb;
	logic [31:0] inst_tb;
	
	IF dut(.clk(clk_tb), .reset(reset_tb), .branch_sel(branch_sel_tb), .branch_inp(branch_inp_tb), .pc_present(pc_present_tb), .inst(inst_tb));
	
	always
		begin
			clk_tb = 0;
			#5;
			clk_tb = 1;
			#5;
		end
	
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars(0, tb_IF);
			reset_tb <= 1;
			branch_sel_tb <= 0;
			branch_inp_tb <= 0;
			#1 reset_tb <= 0;
			if (pc_present_tb == 32)
				begin
					branch_sel_tb <= 1;
					branch_inp_tb <= 40;
				end
		end
endmodule
					