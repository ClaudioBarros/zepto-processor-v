//16-bit register using a flip-flop D for storing a bit

module reg16(in, clk, rst,  out, out_inv);

	input [15:0] in;
	input wire clk;
	input wire rst;

	output reg [15:0] out;
	output reg [15:0] out_inv;

	dff mem[15:0] (.d(in), .clk(clk), .rst(rst), 
	               .q(out), .qn(out_inv)); 
	
endmodule