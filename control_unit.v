//
module control_unit(opcode, alu_op, we);

	input [3:0] opcode;
	
	output reg [3:0] alu_op;
	output reg we;
	
	always @ (*) begin
		case(opcode) 
			//------------ ALU ------------ 
			//addi rd, ra, rb, imm
			4'b0000: begin
				alu_op <= opcode; 
				we <= 1'b1;
			end
			//subi rd, ra, rb, imm
			4'b0001: begin
				alu_op <= opcode; 
				we <= 1'b1;
			end
			//andi rd, ra, rb, imm
			4'b0010: begin 
				alu_op <= opcode; 
				we <= 1'b1;
			end
			//ori rd, ra, rb, imm
			4'b0011: begin 
				alu_op <= opcode; 
				we <= 1'b1;
			end
			//xori rd, ra, rb, imm
			4'b0100: begin 
				alu_op <= opcode; 
				we <= 1'b1;
			end
			//--------- Branch ----------
			//beq ra, rb, imm 
			4'b0101: we <= 1'b0; 
			//bne ra, rb, imm
			4'b0110: we <= 1'b0;  
			//bge ra, rb, imm
			4'b0111: we <= 1'b0;
			//blt ra, rb, imm
			4'b1001: we <= 1'b0;
			//-------- Jump -------
			//jal rd, imm
			4'b1011: we <= 1'b1;
			//jalr rd, ra, imm 
			4'b1100: we <= 1'b1;
			default: we <= 1'b0;
		endcase	
	end

endmodule
