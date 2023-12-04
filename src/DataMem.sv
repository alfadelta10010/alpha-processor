module DataMem(addrIn, dataW, dataR, memR, memW, clk);
	output logic [31:0] dataR;
	input bit clk;
	input logic [31:0] addrIn, dataW;
	logic [11:0] addr;
	input bit memR;
	input bit memW;
	logic [7:0] datafile [0 : 2**12 - 1];
	assign addr = addrIn[11:0];
	always @(memR) begin
		if(memR == 1) begin
			dataR[7:0] <= datafile[addr];
			dataR[15:8] <= datafile[addr+1];
			dataR[23:16] <= datafile[addr+2];
			dataR[31:24] <= datafile[addr+3];
		end
		else
			dataR <= 32'bX;
	end
	always @(posedge clk) begin
		if(memW == 1) begin
			datafile[addr] <= dataW[7:0];
			datafile[addr+1] <= dataW[15:8];
			datafile[addr+2] <= dataW[23:16];
			datafile[addr+3] <= dataW[31:24];
		end
	end
endmodule
