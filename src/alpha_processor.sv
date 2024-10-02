module alpha_processor (reset, clk);
  logic [2:0] f3;
  logic [6:0] f7;
  logic reg_wr;
  input bit reset;
  logic mem_rd, mem_wr;
  logic wb_ctrl;
  logic [2:0] branch_ctrl;
  input bit clk;
  logic [3:0] alu_op;
  logic alu_s1, alu_2;
  logic [6:0] opcode;
  logic [2:0] mem_ctrl;
  
  logic branch_sel;
  logic [31:0] pc_present;
  logic [31:0] result;
  logic [31:0] imm;
  logic [4:0] r1, r2;
  logic [31:0] wb_out;
  logic [31:0] pc_next;
  logic [31:0] instruction;
  logic [31:0] data_out;

  
  IF ifModule (.clk(clk),
         .reset(reset),
         .branch_sel(branch_sel), 
         .branch_inp(result),
         .pc_present(pc_present),
         .pc_next(pc_next),
         .inst(instruction)
        );
  
  ID idModule (.data(instruction), 
         .f3(f7), //control unit
         .f7(f3), //control unit
         .opcode(opcode), //control unit
         .WrEn(reg_wr), //control unit
         .Imm(imm), 
         .r1(r1),
         .r2(r2),
         .DIn(wb_out),
         .clk(clk)
        );
  
  IE ieModule (.r1(r1),
               .r2(r2),
               .Imm(imm),
               .ALUOp(alu_op), //control unit 
               .ALUSrc1(alu_s1), // control unit
               .ALUSrc2(alu_s2), // control unit
               .ExecResult(result),
               .PCp(pc_present),
               .b_sel(branch_sel),
               .b_control(branch_ctrl) //control unit
              );
  
  MA maModule (.addr(result),
         .dataW(data_out),
         .dataR(r2),
         .memR(mem_rd), //control unit
         .memW(mem_wr), //control unit
         .clk(clk),
         .mem_ctrl(mem_ctrl)
        );
  
  mux31 wbModule (.a(data_out), 
          .b(result), 
          .c(pc_next), 
          .s(wb_ctrl), //control unit
          .y(wb_out)
           );
  
  controller controlUnit (.f3(f3), 
                          .f7(f7),
                          .opcode(opcode),
                          .reg_wr(reg_wr), 
                          .mem_rd(mem_rd), 
                          .mem_wr(mem_wr), 
                          .wb_ctrl(wb_ctrl), 
                          .alu_op(alu_op), 
                          .alu_s1(alu_s1), 
                          .alu_s2(alu_s2), 
                          .branch_ctrl(branch_ctrl), 
                          .mem_ctrl(mem_ctrl)
                         );
endmodule
