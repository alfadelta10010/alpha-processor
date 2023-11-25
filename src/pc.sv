module pc(clk, reset, inp, pc_out);
	input bit clk;
	input bit reset;
	input logic [31:0] inp;
	output logic [31:0] pc_out;
	always_ff @(posedge clk, posedge reset)
		if (reset) 
			pc_out <= 32'b0;
        else 
            pc_out <= inp;
endmodule