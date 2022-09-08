// register bank consisting of 16 16-bit registers (reg16)

module reg16x16(ra, rb, rd, wd, //input; wd = data to write in rd
				clk, we, rst, //input; we = enable writing to rd
				ra_out, rb_out); //output

	input clk, we, rst;

	input [4:0] ra;
	input [4:0] rb;
	input [4:0] rd;
	input [15:0] wd;
	
	output reg ra_out[15:0];
	output reg rb_out[15:0];

	reg [15:0] reg_in[15:0];
	reg [15:0] reg_out[15:0];
	reg [15:0] reg_out_inv[15:0]; 
	
	// -- array of 16-bit registers -- 
	// the reset of each register is connected to 
	// the reset input of the block, handling 
	// resets automatically 
	reg16 registers[15:0] (
		.in(reg_in), .out(reg_out), 
		.out_inv(reg_out_inv),
		.clk(clk), .rst(rst));
	
	//convert input to integer to use as index 
	//to retrive reg16 value in memory
	integer ra_index, rb_index, rd_index;
	always @ (ra or rb or rd)
	begin
		ra_index <= ra; 
		rb_index <= rb;
		rd_index <= rd;
	end
	
	//memory write
	always @ (posedge clk)	
	if(we) begin
		reg_in[rd_index] <= wd; 
	end

	//memory read
	always @(posedge clk)
	begin		
		ra_out <= reg_out[ra_index];
		rb_out <= reg_out[rb_index];
	end

endmodule