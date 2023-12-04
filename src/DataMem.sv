module DataMem(addrIn, dataW, dataR, memRW, clk);
	output logic [31:0] dataR;
	input bit clk;
	input logic [31:0] addrIn, dataW;
	logic [11:0] addr;
	input bit memRW;
	logic [7:0] datafile [0 : 2**12 - 1];
	assign addr = addrIn[11:0];
	assign dataR[7:0] = datafile[addr];
	assign dataR[15:8] = datafile[addr+1];
	assign dataR[23:16] = datafile[addr+2];
	assign dataR[31:24] = datafile[addr+3];
	always @(posedge clk) begin
		if(memRW == 1) begin
			datafile[addr] <= dataW[7:0];
			datafile[addr+1] <= dataW[15:8];
			datafile[addr+2] <= dataW[23:16];
			datafile[addr+3] <= dataW[31:24];
		end
	end
endmodule
