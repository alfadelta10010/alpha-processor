module mux21 #(parameter N = 32) (a, b, s, y);
	input logic [N-1:0] a;
	input logic [N-1:0] b;
	input logic s;
	output logic [N-1:0] y;
	assign y = s ? b : a;
endmodule
