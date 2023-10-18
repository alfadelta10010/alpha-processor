module tb_InstMem;
	reg [4:0] tb_addr;
	wire [31:0] tb_dout;
	InstMem dut(.addr(tb_addr), .dout(tb_dout));
	initial begin
		tb_addr = 0;  //5'b00000; 
		#10;
		$display("[tb] Address = %0b: Data = %0h", tb_addr, tb_dout);
		tb_addr = 4; //5'b00100; 
		#10;
		$display("[tb] Address = %0b: Data = %0h", tb_addr, tb_dout);
		tb_addr = 8; //5'b01000; 
		#10;
		$display("[tb] Address = %0b: Data = %0h", tb_addr, tb_dout);
		tb_addr = 12; //5'b01100; 
		#10;
		$display("[tb] Address = %0b: Data = %0h", tb_addr, tb_dout);
		tb_addr = 16; //5'b10000; 
		#10;
		$display("[tb] Address = %0b: Data = %0h", tb_addr, tb_dout);
		tb_addr = 20; //5'b10100; 
		#10;
		$display("[tb] Address = %0b: Data = %0h", tb_addr, tb_dout);
		tb_addr = 24; //5'b11000; 
		#10;
		$display("[tb] Address = %0b: Data = %0h", tb_addr, tb_dout);
		tb_addr = 28; //5'b11100; 
		#10;
		$display("[tb] Address = %0b: Data = %0h", tb_addr, tb_dout);	
	end
endmodule

