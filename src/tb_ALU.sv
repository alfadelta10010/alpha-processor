module tb_ALU(d1, d2, result, zero, control);
	output logic [31:0] d1;
	output logic [31:0] d2;
	input logic [31:0] result;
	input logic [0:0] zero;
	output logic [3:0] control;
	
	ALU dut (.d1(d1_tb), .d2(d2_tb), .result(result_tb), .zero(zero_tb), .control(control_tb));
	
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, tb_ALU);
		d1 = 32'h10101010;
		d2 = 32'h01010101;
		contol = 4'bX
		#10 control = 4'b0000;
		#10 control = 4'b0001;
		#10 control = 4'b0010;
		#10 control = 4'b0011;
		#10 control = 4'b0100;
		#10 control = 4'b0101;
		#10 control = 4'b0110;
		#10 control = 4'b0111;
		#10 control = 4'b1000;
		#10 control = 4'b1001;
		#10 control = 4'b1010;
		#10 control = 4'b1011;
		#10 d2 = 32'h10101010;
		#10 control 4'b0001;
		#150 $finish;
	end
endmodule