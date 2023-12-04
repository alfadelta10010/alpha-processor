module mux31 #(parameter N = 32) (a, b, c, s, y);
	input logic [N-1:0] a;
	input logic [N-1:0] b;
	input logic [N-1:0] c;
	input logic [1:0] s;
	output logic [N-1:0] y;
	assign y = s[1] ? c : (s[0] ? b : a);
endmodule
