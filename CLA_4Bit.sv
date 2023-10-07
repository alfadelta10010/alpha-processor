// Carry Lookahead Adder - 4 bit
// P = A XOR B
// G = A AND B
// C[i+1] = G[i] + P[i]&C[i]
// Expanding C[i] at each stage speeds up the calculation

module CLA_4Bit(a, b, cin, s, cout);
input logic [3:0] a;
input logic [3:0] b;
output logic [3:0] s;
input logic cin;
output logic cout;
logic [3:0] ci;
logic [3:0] p;
logic [3:0] g;
assign ci[0] = cin;
assign ci[1] = (a[0] & b[0]) | ((a[0]^b[0]) & ci[0]);
assign ci[2] = (a[1] & b[1]) | ((a[1]^b[1]) & ((a[0] & b[0]) | ((a[0]^b[0]) & ci[0])));
assign ci[3] = (a[2] & b[2]) | ((a[2]^b[2]) & ((a[1] & b[1]) | ((a[1]^b[1]) & ((a[0] & b[0]) | ((a[0]^b[0]) & ci[0])))));
assign cout  = (a[3] & b[3]) | ((a[3]^b[3]) & ((a[2] & b[2]) | ((a[2]^b[2]) & ((a[1] & b[1]) | ((a[1]^b[1]) & ((a[0] & b[0]) | ((a[0]^b[0]) & ci[0])))))));
assign s = a ^ b ^ ci;
endmodule