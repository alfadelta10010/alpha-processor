/*
https://edaplayground.com/x/naRb
*/
module tb_mux31(a_tb, b_tb, c_tb, s_tb, y_tb);
	parameter N = 32;
	output logic [N-1:0] a_tb;
	output logic [N-1:0] b_tb;
	output logic [N-1:0] c_tb;
	output logic [1:0] s_tb;
	input logic [N-1:0] y_tb;
	
	mux31 dut (.a(a_tb), 
			   .b(b_tb), 
			   .c(c_tb), 
			   .s(s_tb), 
			   .y(y_tb)
			  );
	
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, tb_mux31);
		a_tb = 32'habcdef12;
		b_tb = 32'h12345678;
		c_tb = 32'hbabeface;
		#1 s_tb = 2'b00;
		#2 s_tb = 2'b01;
		#3 s_tb = 2'b10;
		#4 s_tb = 2'b11;
		#5 $finish;
	end
endmodule