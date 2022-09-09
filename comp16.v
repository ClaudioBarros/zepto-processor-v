//compares two 16-bit numbers in two's complement form

module comp16(a, b, eq, neq, geq, l);

	input [15:0] a;
	input [15:0] b;

	output wire eq;
	output wire neq;
	output wire geq;
	output wire l;

endmodule