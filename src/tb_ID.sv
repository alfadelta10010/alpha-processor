/*
      ┌──────────────────────────────────────┐
      │                ┌─────────────────────┼─────
      │                │    [31:0]           │
      │     ┌─────┐    │DIn ┌─────────┐      │
      │     │     │rd  └────►        │r1    │
      │     │     ├─────────►  Reg   ├──────┼────►
      │     │  D  │rs1[4:0] │   File  │      │
      │     │     ├─────────►        │r2    │
      │     │  E  │rs2[4:0] │         ├──────┼────►
 Data │     │     ├─────────►        │      │
 ─────┼────►  C  │         │      Wr │      │
[31:0]│     │     │         └──────▲─┘      │
      │     │  O  │                │         │
      │     │     │Instruction     │         │
      │     │  D  ├──────────┐     │         │
      │     │     │  [31:0]  │     │         │
      │     │  E  │          │     │         │
      │     │     │      ┌──▼──┐  │         │
      │     │  R  │Opcode│      │  │         │      [31:0]
      │     │     ├┬─────► Ext ├──┼─────────┼────►Immediate
      │     │     ││[6:0]│      │  │         │      Value
      │     └┬──┬─┘│     └──────┘  │         │
      │      │  │  │               │         │
      └──────┼──┼──┼───────────────┼─────────┘
            ▼ ▼ ▼            WriteEn
           F3  F7 Opcode
*/

module tb_ID(data_tb, f3_tb, f7_tb, opcode_tb, WrEn_tb, Imm_tb, r1_tb, r2_tb, DIn_tb, clk_tb);
	output logic [31:0] data_tb;
	input logic [2:0] f3_tb;
	input logic [6:0] f7_tb;
	input logic [6:0] opcode_tb;
	output bit WrEn_tb;
	output bit clk_tb;
	input logic [31:0] Imm_tb;
	input logic [31:0] r1_tb;
	input logic [31:0] r2_tb;
	output logic [31:0] DIn_tb;
	logic [31:0] inst_tb;
	logic [4:0] rs1_tb;
	logic [4:0] rs2_tb;
	logic [4:0] rd_tb;
	ID uut (.data(data_tb), 
			.f3(f3_tb), 
			.f7(f7_tb), 
			.opcode(opcode_tb), 
			.WrEn(WrEn_tb), 
			.Imm(Imm_tb), 
			.r1(r1_tb), 
			.r2(r2_tb), 
			.DIn(DIn_tb), 
			.clk(clk_tb));
	
	always
		begin
			clk_tb = 0;
			#1;
			clk_tb = 1;
			#1;
		end
	
	initial 
		begin
			$dumpfile("dump.vcd");
			$dumpvars(0, tb_ID);
			#1 instIn_tb = 32'h00848933;
			#2 WrEn_tb = 1;
			#3 DIn_tb = 32'h0182a223;
		end
endmodule

// https://www.edaplayground.com/x/Xwvw