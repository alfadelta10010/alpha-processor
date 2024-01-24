/*
memctrl┌──────────────────────────────┐
 ──────►        mem_controller        │
 [2:0] │   ┌──────────────────────┐   │
       │   │                      │   │
 addrIn│   │                      │   │dataRO
 ──────►   │addrOut         dataRI│   ├──────►
 [31:0]│   ├──────►         ──────►   │[31:0]
       │   │[11:0]          [31:0]│   │ 
 	   │   │                      │   │
 dataWI│   │dataWO                │   │
 ──────►   ├──────►               │   │
 [31:0]│   │[31:0]                │   │
       └───┘                      └───┘
*/

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
  assign addrOut = addrIn[SIZE-1:0];
	always_comb
		case(mem_ctrl)
			3'b000: begin //LB
				if (dataRI[7] == 1'b1)
					dataRO = {24'b1, dataRI[7:0]};
				else 
					if (dataRI[7] == 1'b0)
						dataRO = {24'b0, dataRI[7:0]};
			end
			3'b001: begin //LH
				if (dataRI[15] == 1'b1)
					dataRO = {16'b1, dataRI[15:0]};
				else 
					if (dataRI[7] == 1'b0)
						dataRO = {16'b0, dataWI[15:0]};
			end
			3'b010: begin //LW
				dataRO = dataRI;
			end
			3'b011: begin //LBU
				dataRO = {24'b0, dataRI[7:0]};
			end
			3'b100: begin //LHU
				dataRO = {16'b0, dataRI[15:0]};
			end
			3'b101: begin // SB
				dataWO = {24'bX, dataWI[7:0]};
			end
			3'b110: begin // SH
				dataWO = {16'bX, dataWI[15:0]};
			end
			3'b111: begin // SW
				dataWO = dataWI;
			end
		endcase
endmodule