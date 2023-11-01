/*
      ┌─────────────────────────────────────┐
      │                    [31:0]           │
      │                ┌────────────────────┼─────
      │     ┌─────┐    │DIn┌─────────┐      │
      │     │     │rd  └───►        │r1    │
      │     │     ├────────►  Reg   ├──────┼────►
      │     │  D  │rs1[4:0]│   File  │      │
      │     │     ├────────►        │r2    │
      │     │  E  │rs2[4:0]│         ├──────┼────►
 Data │     │     ├────────►        │      │
 ─────┼────►  C  │        │      Wr │      │
[31:0]│     │     │        └──────▲─┘      │
      │     │  O  │                │        │
      │     │     │Instruction     │        │
      │     │  D  ├──────────┐     │        │
      │     │     │  [31:0]  │     │        │
      │     │  E  │          │     │        │
      │     │     │      ┌──▼──┐  │        │
      │     │  R  │Opcode│      │  │        │      [31:0]
      │     │     ├┬─────► Ext ├──┼────────┼────►Immediate
      │     │     ││[6:0]│      │  │        │      Value
      │     └┬──┬─┘│     └──────┘  │        │
      │      │  │  │               │        │
      └──────┼──┼──┼───────────────┼────────┘
            ▼ ▼ ▼            WriteEn
           F3  F7 Opcode
*/
module ID(data, f3, f7, opcode, WrEn, Imm, r1, r2, DataIn);
	input logic [31:0] data;
	output logic [2:0] f3;
	output logic [6:0] f7;
	output logic [6:0] opcode
	input bit WrEn;
	output logic [31:0] Imm;
	output logic [31:0] r1;
	output logic [31:0] r2;
	input logic [31:0] DataIn;
	
endmodule