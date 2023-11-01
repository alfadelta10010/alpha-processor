/*           ┌─────────────────►BranchSel
          ┌──┴──────────┐
          │  Testbench  ├──────►BranchInp
          │ Instruction◄────────PCPresent
Reset◄───┤    Fetch   ◄────────Instruction
  Clk─────►            │        Out
          └─────────────┘
*/
module tb_IF; //(clk, tb_branch_sel, tb_branch_inp, tb_pc_present, tb_inst);
	logic tb_branch_sel;
	bit clk;
	bit reset;
	logic [31:0] tb_branch_inp;
	logic [31:0] tb_pc_present;
	logic [31:0] tb_inst;
	IF mod(.clk(clk), .reset(tb_reset), .branch_sel(tb_branch_sel), .branch_inp(tb_branch_inp), .pc_present(tb_pc_present), .inst(tb_inst));
	initial
		begin
			tb_branch_sel <= 0;
			tb_branch_inp <= 0;
          	$display("Instruction %0h at PC = %0h", tb_inst, tb_pc_present);
			#10 $display("Instruction %0h at PC = %0h", tb_inst, tb_pc_present);
			#20 $display("Instruction %0h at PC = %0h", tb_inst, tb_pc_present);
			#30 $display("Instruction %0h at PC = %0h", tb_inst, tb_pc_present);
			#40 $display("Instruction %0h at PC = %0h", tb_inst, tb_pc_present);
			#50 $display("Instruction %0h at PC = %0h", tb_inst, tb_pc_present);
			#60 $display("Instruction %0h at PC = %0h", tb_inst, tb_pc_present);
			
			if (tb_pc_present == 32)
				begin
					tb_branch_sel <= 1;
					tb_branch_inp <= 40;
                  	$display("Branch: Incrememted by 40");
          			$display("Instruction %0h at PC = %0h", tb_inst, tb_pc_present);
				end
		end
	always #5 clk = !clk;
endmodule
					