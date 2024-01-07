module mem_controller(dataRI, dataRO, addrIn, addrOut, dataWI, dataWO, mem_ctrl);
	parameter SIZE = 12;
	input logic [2:0] mem_ctrl;
	input logic [31:0] addrIn;
	input logic [31:0] dataRI;
	input logic [31:0] dataWI;
	output logic [31:0] dataRO;
	output logic [31:0] dataWO;
	output logic [SIZE-1:0] addrOut;
	/*
	assign addrOut = addrIn[SIZE-1:0] + MemOffset 
	*/
	assign addrOut = addrIn[SIZE-1:0]
	always_comb
		case(mem_ctrl)
			3'b000: begin //LB
				if (dataWI[7] == 1'b1)
					dataWO = {24'b1, dataWI[7:0]};
				else 
					if (dataWI[7] == 1'b0)
						dataWO = {24'b0, dataWI[7:0]};
			end
			3'b001: begin //LH
				if (dataWI[15] == 1'b1)
					dataWO = {16'b1, dataWI[15:0]};
				else 
					if (dataWI[7] == 1'b0)
						dataWO = {16'b0, dataWI[15:0]};
			end
			3'b010: begin //LW
				dataWO = dataWI;
			end
			3'b011: begin //LBU
				dataWO = {24'b0, dataWI[7:0]};
			end
			3'b100: begin //LHU
				dataWO = {16'b0, dataWI[15:0]};
			end
			3'b101: begin // SB
				dataRO = {24'bX, dataRI[7:0]};
			end
			3'b110: begin // SH
				dataRO = {16'bX, dataRI[15:0]};
			end
			3'b111: begin // SW
				dataRO = dataRI;
			end
		endcase
endmodule