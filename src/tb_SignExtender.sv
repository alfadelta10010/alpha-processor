//https://edaplayground.com/x/scsg
module SignExtender_tb(opcode_tb, instIn_tb, immOut_tb);
	output logic [6:0] opcode_tb;
	output logic [31:0] instIn_tb;
	input logic [31:0] immOut_tb;
	SignExtender dut (.opcode(opcode_tb), .instIn(instIn_tb), .immOut(immOut_tb));
	initial begin
		$dumpfile("dump.vcd");
		$dumpvars(0, SignExtender_tb);
		instIn_tb = 32'hX;
		opcode_tb = 7'b0110011; //R-type
		#1 instIn_tb = 32'h01190933; //XXXXXX
		#2 opcode_tb = 7'b0010011; //I-type
		#2 instIn_tb = 32'hfffb8b93; // -1
		#3 opcode_tb = 7'b0100011; //S-type
		#3 instIn_tb = 32'h0082a223; //4
		#4 opcode_tb = 7'b0000011; //Load-type
		#4 instIn_tb = 32'h0002a303; //0
		#5 opcode_tb = 7'b1100011; //B-type
		#5 instIn_tb = 32'h014c6463; //0000002c
		#6 opcode_tb = 7'b1100111; //JALR
		#6 instIn_tb = 32'h7ff080e7; // 0x7FF
		#7 opcode_tb = 7'b1101111; //JAL
		#7 instIn_tb = 32'h0000006f; //0000007c
		#8 opcode_tb = 7'b0110111; //LUI
		#8 instIn_tb = 32'h872370b7; //0x87237
		#9 opcode_tb = 7'b0010111; //AUIPC
		#9 instIn_tb = 32'h10000917; //0x10000
		#10 $finish;
	end
endmodule