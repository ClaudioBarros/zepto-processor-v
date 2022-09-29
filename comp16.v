//compares two 16-bit numbers in two's complement form

module comp16(a, b, eq, neq, geq, l);
	input [15:0] a;
	input [15:0] b;

	output reg eq;
	output reg neq;
	output reg geq;
	output reg l;
	
	reg [16:0] sum; // extra bit for overflow

	always @ (*) begin
		if (a == b) begin
			eq <= 1'b1;
			neq <= 1'b0;
			geq <= 1'b0;
			l <= 1'b0;
		end else if(a[15] == 1'b0 && b[15] == 1'b1) begin
			eq <= 1'b1;
			neq <= 1'b1;
			geq <= 1'b1;
			l <= 1'b0;
		end else if(a[15] == 1'b1 && b[15] == 1'b0) begin
			eq <= 1'b0;
			neq <= 1'b1;
			geq <= 1'b0;
			l <= 1'b1;
		end else begin
			sum <= a + b;
			if(sum[16] == 1'b1 || (sum[16] == 1'b0 && sum[15] == 1'b1)) begin
				//handle overflow	
				eq <= 1'b0;
				neq <= 1'b1;
				geq <= 1'b0;
				l <= 1'b1;
			end else begin
				eq <= 1'b0;
				neq <= 1'b1;
				geq <= 1'b1;
				l <= 1'b0;
			end
		end
	end
endmodule
