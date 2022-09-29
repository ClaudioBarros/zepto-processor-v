module alu(a, b, imm, op, res, zero_res, status);
	input [15:0] a;
	input [15:0] b;
	input [15:0] imm;
	input [3:0] op;

	output reg [15:0] res;
	output wire zero_res;
	output reg [3:0] status;
	
	comp16 comp(
		.a(a), .b(b), 
		.eq(status[3]),
	    .neq(status[2]),
		.geq(status[1]),
		.l(status[0]));

	assign zero_res = (res == 16'b0);

	always @ (*) begin
		case(op)
			4'b0000: res = a + b + imm;
			4'b0001: res = a - b - imm;
			4'b0010: res = a & b & imm; 
			4'b0011: res = a | b | imm;
			4'b0100: res = a ^ b ^ imm; 
			default: res = 16'b0;
		endcase
	end
endmodule