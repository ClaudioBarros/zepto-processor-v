//synchronous reset Flip-Flop D

module dff(d, clk, rst, q, qn);

	input d, clk, rst;	
	output q, qn;
	reg q, qn;

	always @ (posedge clk)
	if (rst) begin
		q <= 1'b0; 
		qn <= 1b1;
	end else begin
		q <= d;
		qn <= !d;
	end

endmodule


