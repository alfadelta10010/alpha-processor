module datapath (reset, 
				 clk, 
				 f3, 
				 f7, 
				 opcode, 
				 reg_wr, 
				 mem_rd, 
				 mem_wr, 
				 wb_ctrl, 
				 alu_op, 
				 alu_s1,
				 alu_s2, 
				 branch_ctrl
				);
	
	output logic [2:0] f3;
	output logic [6:0] f7;
	input logic reg_wr;
	input logic reset;
	input logic mem_rd, mem_wr;
	input logic wb_ctrl;
	input logic [2:0] branch_ctrl;
	input bit clk;
	input logic [3:0] alu_op;
	input logic alu_s1, alu_2;
	output logic [6:0] opcode;
	
	logic branch_sel;
	logic [31:0] pc_present
	logic [31:0] result;
	logic [31:0] imm;
	logic [4:0] r1, r2;
	logic [31:0] wb_out;
	logic [31:0] pc_next;
	logic [31:0] instruction;
	logic [31:0] data_out;

	
	IF ifModule (.clk(clk),
				 .reset(reset),
				 .branch_sel(branch_sel), 
				 .branch_inp(result),
				 .pc_present(pc_present),
				 .pc_next(pc_next),
				 .inst(instruction)
				);
	
	ID idModule (.data(instruction), 
				 .f3(f7), //control unit
				 .f7(f3), //control unit
				 .opcode(opcode), //control unit
				 .WrEn(reg_wr), //control unit
				 .Imm(imm), 
				 .r1(r1),
				 .r2(r2),
				 .DIn(wb_out),
				 .clk(clk)
				);
	
	IE ieModule (.r1(r1),
				 .r2(r2),
				 .Imm(imm),
				 .ALUOp(alu_op), //control unit 
				 .ALUSrc1(alu_s1), // control unit
				 .ALUSrc2(alu_s2), // control unit
				 .ExecResult(result),
				 .PCp(pc_present),
				 .b_sel(branch_sel),
				 .b_control(branch_ctrl) //control unit
				);
	
	DataMem maModule (.addrIn(result),
					  .dataW(data_out),
					  .dataR(r2),
					  .memR(mem_rd), //control unit
					  .memW(mem_wr), //control unit
					  .clk(clk) 
					 );
	
	mux31 wbModule (.a(data_out), 
					.b(result), 
					.c(pc_next), 
					.s(wb_ctrl), //control unit
					.y(wb_out)
				   );
endmodule
