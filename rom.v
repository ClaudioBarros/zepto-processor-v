module rom(address, inst);
	input wire [9:0] address; //10 bits de endereço, permitindo endereçar 1024 posições na ROM
	output wire [31:0] inst; //cada instrução é uma palavra de 32 bits

	reg [31:0] ROM [1023:0]; //Define uma ROM de 1024 posições contendo palavras de 32 bits.
	
	//a memória ROM é preenchida com os dados contidos no arquivo memfile.dat . O arquivo memfile.dat deve conter, em cada linha, uma instrução em hexadecimal.
	initial begin 
		$readmemh("contador16.mif", ROM);  
	end 
	
	//atribui a instrução a palavra de 32 bits contida em um endereco da ROM
	assign inst = ROM[address];
endmodule