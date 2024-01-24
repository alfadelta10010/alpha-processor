//https://edaplayground.com/x/9PRR

module tb_alpha_processor (reset_tb, clk_tb);
  output bit clk_tb;
  output logic reset;
  
  always
    begin
      clk_tb = 0;
			#1;
			clk_tb = 1;
			#1;
    end
  
  alpha_processor dut(.reset(reset_tb), .clk(clk_tb));
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0, tb_alpha_processor);
      reset_tb = 1'b0;
      #2 reset_tb = 1'b1;
      #1 reset_tb = 1'b0;
      #10 $finish;
    end
endmodule