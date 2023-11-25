/*           ┌─────────────────BranchSel
          ┌──▼─────────┐
          │            ◄───────BranchInp
          │ Instruction ├──────►PCPresent
          │    Fetch    │
Reset─────►            ├──────►Instruction
  Clk─────►            │        Out
          └─────────────┘
*/
module IF #(parameter XLEN = 32)(clk, reset, branch_sel, branch_inp, pc_present, inst);
	input logic branch_sel;
	input bit clk;
	input bit reset;
	input logic [31:0]branch_inp;
	output logic [31:0] pc_present;
	output logic [31:0] inst;
	const bit [31:0] offset = 4;
	const bit cin = 0;
	logic dump;
	logic [31:0]add_out;
	logic [31:0] pc_in;
	
	InstMem mem(.pcin(pc_present), .dout(inst));
	adder add (.a(offset), .b(pc_present), .s(add_out), .cout(dump), .cin(cin));
	mux21 mux (.a(add_out), .y(pc_in), .b(branch_inp), .s(branch_sel));
	pc pc1 (.clk(clk), .reset(reset), .inp(pc_in), .pc_out(pc_present));
endmodule