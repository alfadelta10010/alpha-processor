module RegisterFile(clk, wen, rd, rs1, rs2, r1, r2, din);
	input logic clk, wen;
	input logic [4:0] rd;
	input logic [4:0] rs1;
	input logic [4:0] rs2;
	input logic [31:0] din;
	output logic [31:0] r1;
	output logic [31:0] r2;

	logic [31:0] regs [0:31];

	initial begin
		for (int i = 0; i < 32; i++)
			regs[i] <= 32'b0;
	end
	
	always @(posedge clk)
		if (wen) 
			regs[rd] <= din;
    assign r1 = regs[rs1];
	assign r2 = regs[rs2];
endmodule