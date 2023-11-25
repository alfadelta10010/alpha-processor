module branch_control(b_control, r1, r2, branch_sel);
	input logic [2:0] b_control;
	input logic [31:0] r1;
	input logic [31:0] r2;
	output logic [0:0] branch_sel;
	always_comb
		begin
			case(b_control)
				3'b001: begin // BEQ
					if (r1 == r2)
						branch_sel = 1'b1;
					else
						branch_sel = 1'b0;
				end
				3'b010: begin // BNE
					if (r1 != r2)
						branch_sel = 1'b1;
					else
						branch_sel = 1'b0;
				end
				3'b011: begin // BLT
					if ($signed(r1) < $signed(r2))
						branch_sel = 1'b1;
					else
						branch_sel = 1'b0;
				end
				3'b111: begin // BLTU
					if (r1 < r2)
						branch_sel = 1'b1;
					else
						branch_sel = 1'b0;
				end
				3'b100: begin // BGE
					if ($signed(r1) >= $signed(r2))
						branch_sel = 1'b1;
					else
						branch_sel = 1'b0;
				end
				3'b101: begin // BGEU
					if (r1 >= r2)
						branch_sel = 1'b1;
					else
						branch_sel = 1'b0;
				end
				default: begin 
					branch_sel = 1'b0;
				end
			endcase
		end
endmodule