module pc(clk, reset inp, pc_out);
	input bit clk;
	input bit reset;
	input logic [31:0] inp;
	output logic [31:0] pc_out;
	always @(posedge clk)
		begin
          if (reset == 1)
				pc_out <= 32'b0;
			else
				pc_out <= inp;
		end
endmodule