module controller (f3, f7, opcode, reg_wr, wb_out, reg_wr, mem_rd, mem_wr, wb_ctrl, alu_op, alu_s1, alu_s2, branch_ctrl);
	output logic [2:0] f3;
	output logic [6:0] f7;
	output logic [31:0] wb_out;
	output logic reg_wr
	output logic reset;
	output logic mem_rd, mem_wr;
	output logic wb_ctrl;
	output logic [2:0] branch_ctrl;
	always_comb
		case(opcode)
			7'b0110011:
				begin
					if(f3 == 3'b010)
						if(f7 = 7'b0)
						
		