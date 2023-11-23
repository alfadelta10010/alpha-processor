module RegisterFile(clk, wen, rd, rs1, rs2, r1, r2, din);
	input logic clk, wen;
	input logic [4:0] rd;
	input logic [4:0] rs1;
	input logic [4:0] rs2;
	input logic [31:0] din;
	output logic [31:0] r1;
	output logic [31:0] r2;

	logic [31:0] regs [0:31]; //= '{32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0, 32'h0} ;

	always @(posedge clk)
		if (wen) 
			regs[rd[4:0]] <= din;
    assign r1 = regs[rs1[4:0]];
	assign r2 = regs[rs2[4:0]];
endmodule