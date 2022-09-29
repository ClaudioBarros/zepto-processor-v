module pc_mux(opcode, curr_pc, compare, imm, ra, next_pc, rd);

	input [3:0] opcode; 
	input [15:0] curr_pc;
	input [3:0] compare;
	input [15:0] imm;
	input [15:0] ra;

	output reg [15:0] next_pc;
	output reg [15:0] rd;

	always @ (*) begin
		case(opcode) 
			
			//------------ ALU -------------
			//addi rd, ra, rb, imm
			4'b0000:  next_pc <= curr_pc+1; 
			//subi rd, ra, rb, imm
			4'b0001:  next_pc <= curr_pc+1; 
			//andi rd, ra, rb, imm
			4'b0010:  next_pc <= curr_pc+1; 
			//ori rd, ra, rb, imm
			4'b0011:  next_pc <= curr_pc+1; 
			//xori rd, ra, rb, imm
			4'b0100:  next_pc <= curr_pc+1; 
			//----------- Branch ----------
			//beq ra, rb, imm 
			4'b0101:  next_pc <= compare[3]? curr_pc+imm : curr_pc + 1; 
			//bne ra, rb, imm
			4'b0110:  next_pc <= compare[2]? curr_pc+imm : curr_pc + 1;
			//bge ra, rb, imm
			4'b0111:  next_pc <= compare[1]? curr_pc+imm : curr_pc + 1;  
			//blt ra, rb, imm
			4'b1001:  next_pc <= compare[0]? curr_pc+imm : curr_pc + 1;  
			//------------ Jump ------------
			//jal rd, imm
			4'b1011: begin   
				 rd <= curr_pc + 1;
				 next_pc <= curr_pc+imm;
			end
			//jalr rd, ra, imm 
			4'b1100: begin   
				 rd <= curr_pc + 1;
				 next_pc <= ra + imm;
			end
			default: next_pc <= curr_pc +1;
		endcase
	end
endmodule
