/*
memctrl┌──────────────────────────────┐
 ──────►        mem_controller        │
 [2:0] │   ┌──────────────────────┐   │
       │   │                      │   │
 addr  │   │                      │   │dataR
 ──────►   │addr  ┌────────┐dataR │   ├──────►
 [31:0]│   ├──────►        ├──────►   │[31:0]
       │   │[11:0]│        │[31:0]│   │ 
 	     │   │      │DataMem │      │   │
 dataW │   │dataW │        │      │   │
 ──────►   ├──────►        │      │   │
 [31:0]│   │[31:0]└─▲────▲─┘      │   │
       └───┘        │    │        └───┘
                    │   memW
                   memR
*/
module tb_MA(dataR_tb, dataW_tb, addr_tb, mem_ctrl_tb, memR_tb, memW_tb);
  output logic [31:0] addr_tb;
  output logic [31:0] dataW_tb; 
	output bit memR_tb; 
	output bit memW_tb; 
	bit clk_tb;
  output logic [2:0] mem_ctrl_tb;
  input logic [31:0] dataR_tb; 
  
  always
		begin
			clk_tb = 0;
			#5;
			clk_tb = 1;
			#5;
		end
  
  MA dut(.dataR(dataR_tb),
         .dataW(dataW_tb),
         .addr(addr_tb),
         .mem_ctrl(mem_ctrl_tb), 
         .memR(memR_tb),
         .memW(memW_tb),
         .clk(clk_tb)
        );
  	
	initial
		begin
			$dumpfile("dump.vcd");
      $dumpvars(0, tb_MA);
      mem_ctrl_tb <= 3'b0;
      addr_tb <= 32'b0;
      dataW_tb <= 32'b0;
      memR_tb <= 0;
      memW_tb <= 0;
      

  