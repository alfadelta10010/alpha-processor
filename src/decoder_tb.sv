module decoder_tb(instIn_tb, opcode_tb, rd_tb, rs1_tb, rs2_tb, instOut_tb, fn3_tb, fn7_tb);
	output logic [31:0] instIn_tb;
	input logic [4:0] rd_tb;
	input logic [4:0] rs1_tb;
	input logic [4:0] rs2_tb;
	input logic [31:0] instOut_tb;
	input logic [6:0] opcode_tb;
	input logic [2:0] fn3_tb;
	input logic [6:0] fn7_tb;
	
	///*
	decoder dut(.instIn(instIn_tb), 
				.opcode(opcode_tb), 
				.rd(rd_tb), 
				.rs1(rs1_tb), 
				.rs2(rs2_tb), 
				.instOut(instOut_tb), 
				.fn3(fn3_tb), 
				.fn7(fn7_tb));
	//*/
	
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, decoder_tb);
		instIn_tb = 32'h00848933;
		#1 instIn_tb = 32'h10100493;
		#1.5 instIn_tb = 32'h01000413;
		// add more instructions here
		#5 $finish;
	end
endmodule