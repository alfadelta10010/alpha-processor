module InstMem(addr, dout);
	input logic [4:0] addr;
	//input logic [31:0] addr;
	output logic [31:0] dout;
	//logic [7:0] mem [2**31:0]
	logic [7:0] mem [31:0] = '{8'bX, 8'bX, 8'bX, 8'bX,
				   8'bX, 8'bX, 8'bX, 8'bX,
				   8'bX, 8'bX, 8'bX, 8'bX,
				   8'hX, 8'hX, 8'hX, 8'hX,
				   8'b00, 8'b00, 8'b00, 8'b00,
				   8'h00, 8'h84, 8'h89, 8'h33,
				   8'h10, 8'h10, 8'h04, 8'h93,
				   8'h01, 8'h00, 8'h04, 8'h13};
	mem
	/*
    0:        01000413        00000001000000000000010000010011
    4:        10100493        00010000000100000000010010010011
    8:        00848933        00000000100001001000100100110011
	*/
	assign dout = {mem [addr+3], mem [addr+2], mem [addr+1], mem [addr]};
endmodule
