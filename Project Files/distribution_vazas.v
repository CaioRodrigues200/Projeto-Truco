module distribution_vazas
(input V1,V2,E,ClrDist,Clk, 
 input [3:0] Pont,
 output [3:0] S,
 output V);
 
	wire [1:0] ws1, ws2, ws3;
	wire wV, wE, wF;
	wire qV, qE, qF;
	wire [3:0] wff, qwff;
 
	decoder decod(.V1(V1),.V2(V2),.E(E),.Clr(ClrDist|qF),.S1(ws1),.S2(ws2),.S3(ws3));
	vaza vaz(.I11(ws1[0]),.I12(ws1[1]),.I21(ws2[0]),.I22(ws2[1]),.I32(ws3[0]),.I33(ws3[1]),.V(wV),.E(wE),.F(wF));
 
	FF_D ffF(.D(wF),.clk(Clk),.Q(qF));
	FF_D ffE(.D(wE),.clk(Clk),.Q(qE));
	FF_D ffV(.D(wV),.clk(Clk),.Q(qV));
	FF_D ffV2(.D(qV),.clk(Clk),.Q(V));
	
	FF_D ff11(.D(Pont[0]),.clk(qF&(~qE)&(~Clk)),.clr(qwff[0]|qwff[1]|qwff[2]|qwff[3]),.Q(wff[0]));
	FF_D ff12(.D(Pont[1]),.clk(qF&(~qE)&(~Clk)),.clr(qwff[0]|qwff[1]|qwff[2]|qwff[3]),.Q(wff[1]));
	FF_D ff13(.D(Pont[2]),.clk(qF&(~qE)&(~Clk)),.clr(qwff[0]|qwff[1]|qwff[2]|qwff[3]),.Q(wff[2]));
	FF_D ff14(.D(Pont[3]),.clk(qF&(~qE)&(~Clk)),.clr(qwff[0]|qwff[1]|qwff[2]|qwff[3]),.Q(wff[3]));
	FF_D ff21(.D(wff[0]),.clk(Clk),.Q(qwff[0]));
	FF_D ff22(.D(wff[1]),.clk(Clk),.Q(qwff[1]));
	FF_D ff23(.D(wff[2]),.clk(Clk),.Q(qwff[2]));
	FF_D ff24(.D(wff[3]),.clk(Clk),.Q(qwff[3]));
	
	assign S[0] = qwff[0];
	assign S[1] = qwff[1];
	assign S[2] = qwff[2];
	assign S[3] = qwff[3];

endmodule 