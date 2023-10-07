module CLA_32Bit(a, b, cin, s, cout);
	input logic [31:0] a;
	input logic [31:0] b;
	output logic [31:0] s;
	input logic cin;
	output logic cout;
	logic [3:0] c;
	CLA_4Bit fa1(a[3:0], b[3:0], cin, s[3:0], c[0]);
	CLA_4Bit fa2(a[7:4], b[7:4], c[0], s[7:4], c[1]);
	CLA_4Bit fa3(a[15:8], b[15:8], c[1], s[15:8], c[2]);
	CLA_4Bit fa4(a[23:16], b[23:16], c[2], s[23:16], c[3]);
	CLA_4Bit fa5(a[31:24], b[31:24], c[3], s[31:24], cout);
endmodule