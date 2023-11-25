//https://edaplayground.com/x/gt_U
module tb_adder(a_tb, b_tb, cin_tb, s_tb, cout_tb);
	output logic [31:0] a_tb;
	output logic [31:0] b_tb;
	input logic [31:0] s_tb;
	output logic cin_tb;
	input logic cout_tb;
	
	adder dut (.a(a_tb), 
			   .b(b_tb), 
			   .cin(cin_tb), 
			   .s(s_tb), 
			   .cout(cout_tb)
			  );
	
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, tb_adder);
		a_tb = 32'h00000000;
		b_tb = 32'h00000004;
		cin_tb = 0;
		#1 a_tb = 32'h00000004;
		b_tb = 32'h00000004;
		cin_tb = 0;
	end
endmodule
		