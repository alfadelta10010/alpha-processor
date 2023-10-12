parameter N = 32;
module mux21(a, b, s, y);
	input logic [N-1:0] a, b;
	input logic s;
	output logic [N-1:0] y;
	assign y = s ? a : b;
endmodule