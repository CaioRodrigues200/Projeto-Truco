module placar (input I,Clk,Clr,ClrM, output [2:0] P);

	wire [1:0] wsum;
	wire [2:0] ssum, sff;

	somador_1bit soma1(.A(I),.A2(sff[0]),.S(ssum[0]),.Ts(wsum[0]));
	somador_1bit soma2(.A(0),.A2(sff[1]),.S(ssum[1]),.Ts(wsum[1]));
	somador_1bit soma3(.A(0),.A2(sff[2]),.S(ssum[2]));
	
	FF_D ff1(.D(ssum[0]),.clk(Clk),.clr(Clr|ClrM),.Q(sff[0]));
	FF_D ff2(.D(ssum[1]),.clk(Clk),.clr(Clr|ClrM),.Q(sff[1]));
	FF_D ff3(.D(ssum[2]),.clk(Clk),.clr(Clr|ClrM),.Q(sff[2]));
	
	assign P[0] = sff[0];
	assign P[1] = sff[1];
	assign P[2] = sff[2];

endmodule 