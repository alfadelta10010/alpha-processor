//https://edaplayground.com/x/uuSe

module tb_RegisterFile(clk_tb, wen_tb, rd_tb, rs1_tb, rs2_tb, din_tb, r1_tb, r2_tb);
	output logic clk_tb, wen_tb;
	output logic [4:0] rd_tb;
	output logic [4:0] rs1_tb;
	output logic [4:0] rs2_tb;
	output logic [31:0] din_tb;
	input logic [31:0] r1_tb;
	input logic [31:0] r2_tb;
	
	///*
	RegisterFile regs (.clk(clk_tb), 
					   .wen(wen_tb), 
					   .rd(rd_tb), 
					   .rs1(rs1_tb), 
					   .rs2(rs2_tb), 
					   .r1(r1_tb),
					   .r2(r2_tb),
					   .din(din_tb));
	
	always
		begin
			clk_tb = 0;
			#5;
			clk_tb = 1;
			#5;
		end
	//*/
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, tb_RegisterFile);
		rd_tb = 5'b01010;
		din_tb = 32'hBABEFACE;
		#3 wen_tb = 1;
		#5 rs1_tb = 5'b00010;
		#5 rs2_tb = 5'b01010;
		#10 rs2_tb = 5'bX;
		#10 rd_tb = 5'b00010;
		#20 $finish;
	end
endmodule