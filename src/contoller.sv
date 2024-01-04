module controller (f3, f7, opcode, reg_wr, mem_rd, mem_wr, wb_ctrl, alu_op, alu_s1, alu_s2, branch_ctrl);
	output logic [2:0] f3;
	output logic [6:0] f7;
	output logic reg_wr
	output logic reset;
	output logic mem_rd, mem_wr;
	output logic [1:0] wb_ctrl;
	output logic [2:0] branch_ctrl;
	always_comb
		case(opcode)
			7'b0110011: begin // R-type
				reg_wr = 1'b1;
				mem_rd = 1'b0;
				mem_wr = 1'b0;
				wb_ctrl = 2'b01;
				alu_s1 = 1'b1;
				alu_s2 = 1'b1;
				branch_ctrl = 3'bXXX;
				case(f3)
					3'b000: begin 
						if(f7 = 7'b0) 
							alu_op = 4'b0000; //ADD
						else
							alu_op = 4'b1000; //SUB 
					end
					3'b101: begin
						if(f7 = 7'b0)  
							alu_op = 4'b0101; //SRL
						else
							alu_op = 4'b1101; //SRA
					end
					3'b001, 3'b010, 3'b011, 3'b100, 3'b110, 3'b111: alu_op = {1'b0, f3[2:0]};
					default: alu_op = 4'bXXXX; // No ALU usage
				endcase
			end
			7'b0010011: begin // I-type (IR-type)
				reg_wr = 1'b1;
				mem_rd = 1'b0;
				mem_wr = 1'b0;
				wb_ctrl = 2'b01;
				alu_s1 = 1'b1;
				alu_s2 = 1'b0;
				branch_ctrl = 3'bXXX;
				case(f3)
					3'b101: begin
						if(f7 = 7'b0)  
							alu_op = 4'b0101; //SRL
						else
							alu_op = 4'b1101; //SRA
					end
					3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b110, 3'b111: alu_op = {1'b0, f3[2:0]};
					default: alu_op = 4'bXXXX; // No ALU usage
				endcase
			end
			7'b0000011: begin // Loads (IL-type)
				reg_wr = 1'b1;
				mem_rd = 1'b1;
				mem_wr = 1'b0;
				wb_ctrl = 2'b00;
				alu_s1 = 1'b1;
				alu_s2 = 1'b0;
				branch_ctrl = 3'bXXX;
				alu_op = 4'b0000;
			end
			7'b0100011: begin // S-type
				reg_wr = 1'b0;
				mem_rd = 1'b0;
				mem_wr = 1'b1;
				wb_ctrl = 2'bX;
				alu_s1 = 1'b1;
				alu_s2 = 1'b0;
				branch_ctrl = 3'bXXX;
				alu_op = 4'b0000;
			end
			7'b1100011: begin // B-type
				reg_wr = 1'b0;
				mem_rd = 1'b0;
				mem_wr = 1'b1;
				wb_ctrl = 2'bX;
				alu_s1 = 1'b0;
				alu_s2 = 1'b0;
				branch_ctrl = f3;
				alu_op = 4'bX;
			end
			7'b0110111: begin // LUI
				reg_wr = 1'b1;
				mem_rd = 1'b0;
				mem_wr = 1'b0;
				wb_ctrl = 2'b01;
				alu_s1 = 1'b1;
				alu_s2 = 1'b0;
				branch_ctrl = 3'bX;
				alu_op = 4'b0000;
			end
			7'b0010111: begin // AUIPC
				reg_wr = 1'b1;
				mem_rd = 1'b0;
				mem_wr = 1'b0;
				wb_ctrl = 2'b01;
				alu_s1 = 1'b0;
				alu_s2 = 1'b0;
				branch_ctrl = 3'bX;
				alu_op = 4'b0000;
			end
			7'b1101111: begin // JAL
				reg_wr = 1'b1;
				mem_rd = 1'b0;
				mem_wr = 1'b0;
				wb_ctrl = 2'b10;
				alu_s1 = 1'b0;
				alu_s2 = 1'b0;
				branch_ctrl = 3'bX;
				alu_op = 4'b0000;
			end
			7'b0010111: begin // JALR
				reg_wr = 1'b1;
				mem_rd = 1'b0;
				mem_wr = 1'b0;
				wb_ctrl = 2'b10;
				alu_s1 = 1'b1;
				alu_s2 = 1'b0;
				branch_ctrl = 3'bX;
				alu_op = 4'b0000;
			end
			default: begin
				reg_wr = 1'b0;
				mem_rd = 1'b0;
				mem_wr = 1'b0;
				wb_ctrl = 2'bXX;
				alu_s1 = 1'bX;
				alu_s2 = 1'bX;
				branch_ctrl = 3'bX;
				alu_op = 4'bXXXX;
			end
		endcase
endmodule