//https://edaplayground.com/x/WcD9
module tb_pc(clk_tb, reset_tb, inp_tb, pc_out_tb);
	output bit clk_tb;
	output bit reset_tb;
	output logic [31:0] inp_tb;
	input logic [31:0] pc_out_tb;
	
	pc dut(.clk(clk_tb), .reset(reset_tb), .inp(inp_tb), .pc_out(pc_out_tb));
	
	always
		begin
			clk_tb = 0;
			#5;
			clk_tb = 1;
			#5;
		end
	
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, tb_pc);
		reset_tb = 1;
		#1 reset_tb = 0;
		// testing write into PC
		#3 inp_tb = 32'h00000010;
		#9 inp_tb = 32'h00000004;
		#20 $finish;
	end
endmodule
		