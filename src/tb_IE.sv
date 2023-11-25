//https://edaplayground.com/x/CnWQ
module tb_IE(r1_tb, r2_tb, Imm_tb, ALUOp_tb, ALUSrc1_tb, ALUSrc2_tb, ExecResult_tb, zero_tb, PCp_tb, b_sel_tb, b_control_tb);
	output logic [31:0] r1_tb;
	output logic [31:0] r2_tb;
	output logic [31:0] Imm_tb;
	output logic [3:0] ALUOp_tb;
	output logic [0:0] ALUSrc1_tb;
	output logic [0:0] ALUSrc2_tb;
	output logic [31:0] PCp_tb;
	output logic [2:0] b_control_tb;
	input logic [31:0] ExecResult_tb;
	input logic [0:0] zero_tb;
	input logic [0:0] b_sel_tb; // to IF
	
	IE dut (.r1(r1_tb), 
			.r2(r2_tb), 
			.Imm(Imm_tb), 
			.ALUOp(ALUOp_tb), 
			.ALUSrc1(ALUSrc1_tb), 
			.ALUSrc2(ALUSrc2_tb), 
			.ExecResult(ExecResult_tb), 
			.zero(zero_tb), 
			.PCp(PCp_tb), 
			.b_sel(b_sel_tb), 
			.b_control(b_control_tb)
		   );
	
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, tb_IE);
		// r1 + r2
		ALUOp_tb = 4'b0000;
		r1_tb = 32'hBABEFACE;
		r2_tb = 32'hDEADBEEF;
		ALUSrc1_tb = 1'b1;
		ALUSrc2_tb = 1'b1;
		Imm_tb = 32'h00000010;
		PCp_tb = 32'h00000004;
		b_control_tb = 3'b000;
		// BNE
		#1 ALUOp_tb = 4'b0000;
		r1_tb = 32'h0000000C;
		r2_tb = 32'h00000008;
		ALUSrc1_tb = 1'b0;
		ALUSrc2_tb = 1'b0;
		Imm_tb = 32'h00000010;
		PCp_tb = 32'h00000004;
		b_control_tb = 3'b010;
		// r1 + Imm
		#1 ALUOp_tb = 4'b0000;
		r1_tb = 32'hBABEFACE;
		r2_tb = 32'hDEADBEEF;
		ALUSrc1_tb = 1'b1;
		ALUSrc2_tb = 1'b0;
		Imm_tb = 32'h00000010;
		PCp_tb = 32'h00000004;
		b_control_tb = 3'b000;
		#5 $finish;
	end
endmodule