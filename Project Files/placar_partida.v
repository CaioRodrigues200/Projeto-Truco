module placar_partida (input [3:0] B , input Clk, Clr, output I, output [3:0] Vit);

	wire [3:0] wsum ,ssum, sff;
	wire wsaida;

	somador_1bit som1(.A(B[0]),.A2(sff[0]),.S(ssum[0]),.Ts(wsum[0]));
	somador_1bit som2(.A(B[1]),.A2(sff[1]),.Te(wsum[0]),.S(ssum[1]),.Ts(wsum[1]));
	somador_1bit som3(.A(B[2]),.A2(sff[2]),.Te(wsum[1]),.S(ssum[2]),.Ts(wsum[2]));
	somador_1bit som4(.A(B[3]),.A2(sff[3]),.Te(wsum[2]),.S(ssum[3]),.Ts(wsum[3]));
	
	FF_D ff1(.D(ssum[0]),.clk(Clk),.clr(Clr|wsaida),.Q(sff[0]));
	FF_D ff2(.D(ssum[1]),.clk(Clk),.clr(Clr|wsaida),.Q(sff[1]));
	FF_D ff3(.D(ssum[2]),.clk(Clk),.clr(Clr|wsaida),.Q(sff[2]));
	FF_D ff4(.D(ssum[3]),.clk(Clk),.clr(Clr|wsaida),.Q(sff[3]));
	
	FF_D ffs(.D((sff[2]&sff[3]) | wsum[3]),.clk(Clk),.Q(wsaida));
	
	assign I = wsaida;
	
	assign Vit[0] = sff[0];
	assign Vit[1] = sff[1];
	assign Vit[2] = sff[2];
	assign Vit[3] = sff[3];

endmodule 