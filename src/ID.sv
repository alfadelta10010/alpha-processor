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
module ID(data, f3, f7, opcode, WrEn, Imm, r1, r2, DIn, clk);
	input logic [31:0] data;
	output logic [2:0] f3;
	output logic [6:0] f7;
	output logic [6:0] opcode;
	input bit WrEn;
	input bit clk;
	output logic [31:0] Imm;
	output logic [31:0] r1;
	output logic [31:0] r2;
	input logic [31:0] DIn;
	logic [31:0] inst;
	logic [4:0] rs1;
	logic [4:0] rs2;
	logic [4:0] rd;
	decoder dec(.InstIn(data), .opcode(opcode), .InstOut(inst), .rs1(rs1), .rs2(rs2), .rd(rd), .fn3(f3), .fn7(f7));
	//decoder dec(.(data), .(opcode), .(inst), .(rs1), .(rs2), .(rd), .(f3), .(f7));
	SignExtender sext(.opcode(opc), .instIn(inst), .immOut(Imm));
	RegisterFile regfile(.din(DIn), .rd(rd), .rs1(rs1), .rs2(rs2), .wen(WrEn), .r1(r1), .r2(r2), .clk(clk));
endmodule