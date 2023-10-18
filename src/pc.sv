module pc(clk, inp, pc_out);
	input bit clk;
	input logic [4:0] inp;
	output logic [4:0] pc_out;
	always @(posedge clk)
		pc_out <= inp;
endmodule