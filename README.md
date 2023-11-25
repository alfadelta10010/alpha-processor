# RISCV-Processor
Single Stage RISC-V 32-bit Processor made in RISC-V Lab (UE21EC352A - RISC-V Architecture) by Team 1

=======
## Checklist

| Module | Completed | Verified |
| :----: | :-: | :-: |
| [Program Counter](src/pc.sv) | Y | N |
| [Adder](src/adder.sv) | Y | [Y](src/tb_adder) |
| [InstMem](src/InstMem.sv) | Y | [Y](src/tb_InstMem.sv)|
| [2:1 MUX](
src/mux21.sv) | Y | N |
| [Inst. Fetch](src/IF.sv) | Y | [Y](src/tb_IF.sv) |
| [Decoder](src/decoder.sv) | Y | [Y](src/tb_decoder.sv) | 
| [Register File](src/RegisterFile.sv) | Y | [Y](src/tb_RegisterFile.sv) |
| [Sign Extender](src/SignExtender.sv) | Y | [Y](src/tb_SignExtender.sv) |
| [Inst. Decode](src/ID.sv) | Y | [Y](src/tb_ID.sv) |
| [ALU](src/ALU.sv) | Y | [Y](src/tb_ALU.sv) |
| [Branch Control](src/branch_control.sv) | Y | [Y](src/tb_branch_control.sv) |
| [Inst. Execute](src/IE.sv) | Y | [Y](src/tb_IE.sv) |
| [4:1 MUX](src/mux41.sv) | N | N |
| [Data Memory](src/DataMem.sv) | N | N |
| [Control Unit](src/controller.sv) | N | N |
| [Branch Detector](src/branch.sv) | N | N |

