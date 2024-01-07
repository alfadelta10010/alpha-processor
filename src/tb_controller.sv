module tb_controller(f3_tb, f7_tb, opcode_tb, reg_wr_tb, mem_rd_tb, mem_wr_tb, wb_ctrl_tb, alu_op_tb, alu_s1_tb, alu_s2_tb, branch_ctrl_tb, mem_ctrl_tb);
	output logic [2:0] f3_tb;
	output logic [6:0] f7_tb;
	output logic [6:0] opcode_tb;
	input logic reg_wr_tb;
	input logic mem_rd_tb, mem_wr_tb;
	input logic [1:0] wb_ctrl_tb;
	input logic [2:0] branch_ctrl_tb;
	input logic [2:0] mem_ctrl_tb;
	input logic alu_s1_tb, alu_s2_tb;
	input logic [3:0] alu_op_tb;
	
	controller dut(.f3(f3_tb), 
				   .f7(f7_tb), 
				   .opcode(opcode_tb), 
				   .reg_wr(reg_wr_tb), 
				   .mem_rd(mem_rd_tb), 
				   .mem_wr(mem_wr_tb), 
				   .wb_ctrl(wb_ctrl_tb), 
				   .alu_op(alu_op_tb), 
				   .alu_s1(alu_s1_tb), 
				   .alu_s2(alu_s2_tb), 
				   .branch_ctrl(branch_ctrl_tb), 
				   .mem_ctrl(mem_ctrl_tb)
				  );
	
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, tb_controller);
		f7_tb = 7'b0;
		opcode_tb = 7'b0;
		f3_tb = 3'b0;
		#1 opcode_tb = 7'b0110011; // R-type
		f3_tb = 3'b000;
		#1 f7_tb = 7'b0100000;
		#1 f3_tb = 3'b001;
		#1 f7_tb = 7'b0;
		#1 f3_tb = 3'b010;
		#1 f3_tb = 3'b011;
		#1 f3_tb = 3'b100;
		#1 f3_tb = 3'b101;
		#1 f7_tb = 7'b0100000;
		#1 f3_tb = 3'b110;
		#1 f7_tb = 7'b0;
		#1 f3_tb = 3'b111;
		#1 opcode_tb = 7'b0010011; // IR-Type
		f3_tb = 3'b000;
		#1 f3_tb = 3'b001;
		#1 f3_tb = 3'b010;
		#1 f3_tb = 3'b011;
		#1 f3_tb = 3'b100;
		#1 f3_tb = 3'b101;
		#1 f3_tb = 3'b110;
		#1 f3_tb = 3'b111;
		#1 opcode_tb = 7'b0000011; // IL-Type
		f3_tb = 3'b000;
		#1 f3_tb = 3'b001;
		#1 f3_tb = 3'b010;
		#1 f3_tb = 3'b011;
		#1 f3_tb = 3'b100;
		#1 f3_tb = 3'b101;
		#1 f3_tb = 3'b110;
		#1 f3_tb = 3'b111;
		#1 opcode_tb = 7'b0100011; // S-type
		f3_tb = 3'b000;
		#1 f3_tb = 3'b001;
		#1 f3_tb = 3'b010;
		#1 f3_tb = 3'b011;
		#1 f3_tb = 3'b100;
		#1 f3_tb = 3'b101;
		#1 f3_tb = 3'b110;
		#1 f3_tb = 3'b111;
		#1 opcode_tb = 7'b1100011; // B-type
		f3_tb = 3'b000;
		#1 f3_tb = 3'b001;
		#1 f3_tb = 3'b010;
		#1 f3_tb = 3'b011;
		#1 f3_tb = 3'b100;
		#1 f3_tb = 3'b101;
		#1 f3_tb = 3'b110;
		#1 f3_tb = 3'b111;
		#1 opcode_tb = 7'b0110111; // LUI
		f3_tb = 3'b000;
		#1 f3_tb = 3'b001;
		#1 f3_tb = 3'b010;
		#1 f3_tb = 3'b011;
		#1 f3_tb = 3'b100;
		#1 f3_tb = 3'b101;
		#1 f3_tb = 3'b110;
		#1 f3_tb = 3'b111;
		#1 opcode_tb = 7'b0010111; // AUPIC
		f3_tb = 3'b000;
		#1 f3_tb = 3'b001;
		#1 f3_tb = 3'b010;
		#1 f3_tb = 3'b011;
		#1 f3_tb = 3'b100;
		#1 f3_tb = 3'b101;
		#1 f3_tb = 3'b110;
		#1 f3_tb = 3'b111;
		#1 opcode_tb = 7'b1101111; // JAL
		f3_tb = 3'b000;
		#1 f3_tb = 3'b001;
		#1 f3_tb = 3'b010;
		#1 f3_tb = 3'b011;
		#1 f3_tb = 3'b100;
		#1 f3_tb = 3'b101;
		#1 f3_tb = 3'b110;
		#1 f3_tb = 3'b111;
		#1 opcode_tb = 7'b0010111; // JALR
		f3_tb = 3'b000;
		#1 f3_tb = 3'b001;
		#1 f3_tb = 3'b010;
		#1 f3_tb = 3'b011;
		#1 f3_tb = 3'b100;
		#1 f3_tb = 3'b101;
		#1 f3_tb = 3'b110;
		#1 f3_tb = 3'b111;
		#1 opcode_tb = 7'b0011111; // default case
	end
endmodule