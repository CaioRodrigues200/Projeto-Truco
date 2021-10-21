module Projeto_Truco_LCL 
(input CLK,v1,v2,e,b1,b3,b5,b7,
 ClrVaza,Clr1,Clr2,Clr1V,Clr2V,ClrB,ClrMem, 
 input [3:0] P, 
 output [3:0] VP1,VP2,
 output [2:0] Rec1, Rec2);
 
	wire [3:0] wSvaza, demux1, demux2;
	wire wv, wI1, wI2, wEnd;
	wire [2:0] wPE1, wPE2, wPS1, wPS2;
 
	distribution_vazas dv(.V1(v1),.V2(v2),.E(e),.ClrDist(ClrVaza),.Clk(CLK),.Pont(P),.S(wSvaza),.V(wv));
	
	demux_1_2 d1(.A(wSvaza[0]),.Control(wv),.S1(demux1[0]),.S2(demux2[0]));
	demux_1_2 d2(.A(wSvaza[1]),.Control(wv),.S1(demux1[1]),.S2(demux2[1]));
	demux_1_2 d3(.A(wSvaza[2]),.Control(wv),.S1(demux1[2]),.S2(demux2[2]));
	demux_1_2 d4(.A(wSvaza[3]),.Control(wv),.S1(demux1[3]),.S2(demux2[3]));
	
	placar_partida pp1(.B(demux1),.Clk(CLK),.Clr(wI2|Clr1),.I(wI1),.Vit(VP2));
	placar_partida pp2(.B(demux2),.Clk(CLK),.Clr(wI1|Clr2),.I(wI2),.Vit(VP1));
	
	placar pc1(.I(wI1),.Clk(CLK),.Clr(wEnd),.ClrM(Clr1V),.P(wPE1));
	placar pc2(.I(wI2),.Clk(CLK),.Clr(wEnd),.ClrM(Clr2V),.P(wPE2));	
	
	comparador comp(.P1(wPE1),.P2(wPE2),.B1(b1),.B3(b3),.B5(b5),.B7(b7),.Clr(ClrB),.Clk(CLK),.PS1(wPS1),.PS2(wPS2),.End(wEnd));
	
	memoria mem(.P1(wPS1),.P2(wPS2),.Clr(ClrMem),.placar1(Rec1),.placar2(Rec2));	
	
endmodule 