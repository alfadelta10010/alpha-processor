/*
https://edaplayground.com/x/Nm7W
*/
module tb_DataMem(addrIn_tb, dataW_tb, dataR_tb, memW_tb, memR_tb, clk_tb);
	input logic [31:0] dataR_tb;
	output bit clk_tb;
	output logic [31:0] addrIn_tb, dataW_tb;
	output bit memR_tb, memW_tb;
	always
		begin
			clk_tb = 0;
			#1;
			clk_tb = 1;
			#1;
		end
	
	DataMem dut(.addrIn(addrIn_tb), 
				.dataW(dataW_tb), 
				.dataR(dataR_tb), 
				.memR(memR_tb),
				.memW(memW_tb),
				.clk(clk_tb)
			   );
	
	initial
		begin
			$dumpfile("dump.vcd");
			$dumpvars(0, tb_DataMem);
			#1 addrIn_tb = 32'h00000000;
			#1 dataW_tb = 32'ha28b538c;
			#2 memW_tb = 1'b1;
			#4 memW_tb = 1'b0;
			#5 memR_tb = 1'b1;
			#6 memR_tb = 1'b0;
			#6 addrIn_tb = 32'h00000003;
			#7 memR_tb = 1'b1;
			#20 $finish;
		end
endmodule