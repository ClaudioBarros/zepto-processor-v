module reg_mux(opcode, alu, pc_mux, wd); 
	input [3:0] opcode;
	input [15:0] alu;
	input [15:0] pc_mux;

	output reg [15:0] wd;
	
	always @ (*) 
	begin
		case(opcode)
			4'b1011: wd <= pc_mux;
			4'b1101: wd <= pc_mux;
			default: wd <= alu;
		endcase
	end
	
endmodule