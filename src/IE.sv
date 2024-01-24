module IE(r1, r2, Imm, ALUOp, ALUSrc1, ALUSrc2, ExecResult, PCp, b_sel, b_control);
	input logic [31:0] r1;
	input logic [31:0] r2;
	input logic [31:0] Imm;
	input logic [3:0] ALUOp;
	input logic ALUSrc1;
	input logic ALUSrc2;
	output logic [31:0] ExecResult;
	input logic [31:0] PCp;
	input logic [2:0] b_control; //from control unit
	output logic b_sel; // to IF
	logic [31:0] a, b;

	mux21 ALUM1 (.a(PCp), .b(r1), .s(ALUSrc1), .y(a));
	mux21 ALUM2 (.a(Imm), .b(r2), .s(ALUSrc2), .y(b));
	ALU alu(.d1(a), .d2(b), .result(ExecResult), .control(ALUOp));
	branch_control bc (.b_control(b_control), .r1(r1), .r2(r2), .branch_sel(b_sel));
	
endmodule