module decoder (input V1,V2,E,Clr, output [1:0] S1,S2,S3);

	wire [1:0] w1, w2;

	FF_D Reg11(.D(0),.clk(V1|V2|E),.clr(Clr),.preset(V1|E),.Q(w1[0]));
	FF_D Reg21(.D(w1[0]),.clk(V1|V2|E),.clr(Clr),.Q(w1[1]));
	FF_D Reg31(.D(w1[1]),.clk(V1|V2|E),.clr(Clr),.Q(S3[0]));
	
	FF_D Reg12(.D(0),.clk(V1|V2|E),.clr(Clr),.preset(V2|E),.Q(w2[0]));
	FF_D Reg22(.D(w2[0]),.clk(V1|V2|E),.clr(Clr),.Q(w2[1]));
	FF_D Reg32(.D(w2[1]),.clk(V1|V2|E),.clr(Clr),.Q(S3[1]));
	
	assign S1[0] = w1[0];
	assign S1[1] = w2[0];
	assign S2[0] = w1[1];
	assign S2[1] = w2[1];

endmodule 