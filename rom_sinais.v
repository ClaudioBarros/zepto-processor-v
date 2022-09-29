module rom(a, clk, rst, estado, saida);

	input clk;
	input rst;
	input a;

	localparam EST1 = 3'b000, EST2 = 3'b100, EST3 = 3'b001 , EST4 = 3'b101 , EST5 = 3'b110, INDEF = 3'b010;
	
	output reg[2:0] estado;
	output reg[4:0] saida;
	
	integer cont;
	initial cont=0;
	reg bin_cont = 1'b0;
	
	always @(posedge clk) begin
			if (a == 1'b1) begin
				estado <= INDEF;
			end 
			if (a == 1'b0 && estado == INDEF) begin
				estado <= EST1;
			end
			if (rst == 1'b0) begin
				estado <= EST1;
			end 
			
			case(estado)
				EST1: begin
					if(cont < 6) begin
						saida[4] <= 1'b0; //carro vermelho
						saida[3] <= 1'b0; //carro amarelo
						saida[2] <= 1'b1; //carro verde
						saida[1] <= 1'b1; //pedestre vermelho
						saida[0] <= 1'b0; //pedestre verde
						cont <= cont + 1;
					end
					else begin
						estado <= EST2;
						cont <= 0; 
					end		
				end
				EST2: begin
					if(cont < 1) begin
						saida[4] <= 1'b0; //carro vermelho
						saida[3] <= 1'b0; //carro amarelo
						saida[2] <= 1'b1; //carro verde
						saida[1] <= 1'b1; //pedestre vermelho
						saida[0] <= 1'b0; //pedestre verde
						cont <= cont + 1;
					end
					else begin
						estado <= EST3;
						cont <= 0; 
					end		
				end
				EST3: begin
					if(cont < 4) begin
						saida[4] <= 1'b1; //carro vermelho
						saida[3] <= 1'b0; //carro amarelo
						saida[2] <= 1'b0; //carro verde
						saida[1] <= 1'b0; //pedestre vermelho
						saida[0] <= 1'b1; //pedestre verde
						cont <= cont + 1;
					end
					else begin
						estado <= EST4;
						cont <= 0; 
					end		
				end
				EST4: begin
					if(cont < 5) begin
						bin_cont <= ~bin_cont;
					
						saida[4] <= 1'b1; //carro vermelho
						saida[3] <= 1'b0; //carro amarelo
						saida[2] <= 1'b0; //carro verde
						saida[1] <= bin_cont; //pedestre vermelho
						saida[0] <= 1'b0; //pedestre verde
						cont <= cont + 1;
					end
					else begin
						estado <= EST1;
						cont <= 0; 
					end		
				end
				INDEF: begin
					bin_cont <= ~bin_cont;
					
					saida[4] <= 1'b0; //carro vermelho
					saida[3] <= bin_cont; //carro amarelo
					saida[2] <= 1'b0; //carro verde
					saida[1] <= 1'b0; //pedestre vermelho
					saida[0] <= 1'b0; //pedestre verde
					cont <= 0;
					end	
				default: begin
					bin_cont <= ~bin_cont;
					
					saida[4] <= 1'b0; //carro vermelho
					saida[3] <= bin_cont; //carro amarelo
					saida[2] <= 1'b0; //carro verde
					saida[1] <= 1'b0; //pedestre vermelho
					saida[0] <= 1'b0; //pedestre verde
					cont <= 0;
				end
			endcase
		end
endmodule



