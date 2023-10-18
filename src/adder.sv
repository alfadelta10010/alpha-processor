module adder(a, b, cin, s, cout);
	input logic [4:0] a;
	input logic [4:0] b;
	output logic [4:0] s;
	input logic cin;
	output logic cout;
	{cout, sum} = a + b + cin;
endmodule