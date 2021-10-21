module comparador
(input [2:0] P1, P2,
 input B1,B3,B5,B7,Clr,Clk, 
 output [2:0] PS1, PS2,
 output End
 );
 
	wire [2:0] sffB;
	wire comb, wdelay, wdelay2;
	
	assign comb = (~(P1[0]^sffB[0])&~(P1[1]^sffB[1])&~(P1[2]^sffB[2])) | (~(P2[0]^sffB[0])&~(P2[1]^sffB[1])&~(P2[2]^sffB[2]));
 
	FF_D ffs11(.D(P1[0]),.clk(comb&Clk),.clr(wdelay2),.Q(PS1[0]));
	FF_D ffs12(.D(P1[1]),.clk(comb&Clk),.clr(wdelay2),.Q(PS1[1]));
	FF_D ffs13(.D(P1[2]),.clk(comb&Clk),.clr(wdelay2),.Q(PS1[2]));
	FF_D ffs21(.D(P2[0]),.clk(comb&Clk),.clr(wdelay2),.Q(PS2[0]));
	FF_D ffs22(.D(P2[1]),.clk(comb&Clk),.clr(wdelay2),.Q(PS2[1]));
	FF_D ffs23(.D(P2[2]),.clk(comb&Clk),.clr(wdelay2),.Q(PS2[2]));
	
	FF_D ffB1(.preset(B1|B3|B5|B7),.clr(Clr),.Q(sffB[0]));
	FF_D ffB2(.preset(B3|B7),.clr(Clr),.Q(sffB[1]));
	FF_D ffB3(.preset(B5|B7),.clr(Clr),.Q(sffB[2]));
	
	FF_D ffdelay1(.D(comb),.clk(Clk),.Q(wdelay));
	FF_D ffdelay2(.D(wdelay),.clk(Clk),.Q(wdelay2));
	
	assign End = wdelay2;

endmodule 

