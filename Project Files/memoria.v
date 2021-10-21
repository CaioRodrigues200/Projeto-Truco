module memoria
(input [2:0] P1,P2,
 input Clr,
 output [2:0] placar1, placar2);
 
	wire manual_clk;
	wire [6:0] 	wline1, wline2, wline3, wline4, wline5, wline6;
	
	assign manual_clk = P1[0]&P1[1]&P1[2]&P2[0]&P2[1]&P2[2];
 
	FF_D ff11(.D(0),.clk(manual_clk),.clr(Clr),.preset(P1[0]),.Q(wline1[0]));
	FF_D ff12(.D(wline1[0]),.clk(manual_clk),.clr(Clr),.Q(wline1[1]));
	FF_D ff13(.D(wline1[1]),.clk(manual_clk),.clr(Clr),.Q(wline1[2]));
	FF_D ff14(.D(wline1[2]),.clk(manual_clk),.clr(Clr),.Q(wline1[3]));
	FF_D ff15(.D(wline1[3]),.clk(manual_clk),.clr(Clr),.Q(wline1[4]));
	FF_D ff16(.D(wline1[4]),.clk(manual_clk),.clr(Clr),.Q(wline1[5]));
	FF_D ff17(.D(wline1[5]),.clk(manual_clk),.clr(Clr),.Q(wline1[6]));
	FF_D ff18(.D(wline1[6]),.clk(manual_clk),.clr(Clr),.Q(placar1[0]));
	
	FF_D ff21(.D(0),.clk(manual_clk),.clr(Clr),.preset(P1[1]),.Q(wline2[0]));
	FF_D ff22(.D(wline2[0]),.clk(manual_clk),.clr(Clr),.Q(wline2[1]));
	FF_D ff23(.D(wline2[1]),.clk(manual_clk),.clr(Clr),.Q(wline2[2]));
	FF_D ff24(.D(wline2[2]),.clk(manual_clk),.clr(Clr),.Q(wline2[3]));
	FF_D ff25(.D(wline2[3]),.clk(manual_clk),.clr(Clr),.Q(wline2[4]));
	FF_D ff26(.D(wline2[4]),.clk(manual_clk),.clr(Clr),.Q(wline2[5]));
	FF_D ff27(.D(wline2[5]),.clk(manual_clk),.clr(Clr),.Q(wline2[6]));
	FF_D ff28(.D(wline2[6]),.clk(manual_clk),.clr(Clr),.Q(placar1[1]));

	FF_D ff31(.D(0),.clk(manual_clk),.clr(Clr),.preset(P1[2]),.Q(wline3[0]));
	FF_D ff32(.D(wline3[0]),.clk(manual_clk),.clr(Clr),.Q(wline3[1]));
	FF_D ff33(.D(wline3[1]),.clk(manual_clk),.clr(Clr),.Q(wline3[2]));
	FF_D ff34(.D(wline3[2]),.clk(manual_clk),.clr(Clr),.Q(wline3[3]));
	FF_D ff35(.D(wline3[3]),.clk(manual_clk),.clr(Clr),.Q(wline3[4]));
	FF_D ff36(.D(wline3[4]),.clk(manual_clk),.clr(Clr),.Q(wline3[5]));
	FF_D ff37(.D(wline3[5]),.clk(manual_clk),.clr(Clr),.Q(wline3[6]));
	FF_D ff38(.D(wline3[6]),.clk(manual_clk),.clr(Clr),.Q(placar1[2]));
	
	FF_D ff41(.D(0),.clk(manual_clk),.clr(Clr),.preset(P2[0]),.Q(wline4[0]));
	FF_D ff42(.D(wline4[0]),.clk(manual_clk),.clr(Clr),.Q(wline4[1]));
	FF_D ff43(.D(wline4[1]),.clk(manual_clk),.clr(Clr),.Q(wline4[2]));
	FF_D ff44(.D(wline4[2]),.clk(manual_clk),.clr(Clr),.Q(wline4[3]));
	FF_D ff45(.D(wline4[3]),.clk(manual_clk),.clr(Clr),.Q(wline4[4]));
	FF_D ff46(.D(wline4[4]),.clk(manual_clk),.clr(Clr),.Q(wline4[5]));
	FF_D ff47(.D(wline4[5]),.clk(manual_clk),.clr(Clr),.Q(wline4[6]));
	FF_D ff48(.D(wline4[6]),.clk(manual_clk),.clr(Clr),.Q(placar2[0]));
	
	FF_D ff51(.D(0),.clk(manual_clk),.clr(Clr),.preset(P2[1]),.Q(wline5[0]));
	FF_D ff52(.D(wline5[0]),.clk(manual_clk),.clr(Clr),.Q(wline5[1]));
	FF_D ff53(.D(wline5[1]),.clk(manual_clk),.clr(Clr),.Q(wline5[2]));
	FF_D ff54(.D(wline5[2]),.clk(manual_clk),.clr(Clr),.Q(wline5[3]));
	FF_D ff55(.D(wline5[3]),.clk(manual_clk),.clr(Clr),.Q(wline5[4]));
	FF_D ff56(.D(wline5[4]),.clk(manual_clk),.clr(Clr),.Q(wline5[5]));
	FF_D ff57(.D(wline5[5]),.clk(manual_clk),.clr(Clr),.Q(wline5[6]));
	FF_D ff58(.D(wline5[6]),.clk(manual_clk),.clr(Clr),.Q(placar2[1]));
	
	FF_D ff61(.D(0),.clk(manual_clk),.clr(Clr),.preset(P2[2]),.Q(wline6[0]));
	FF_D ff62(.D(wline6[0]),.clk(manual_clk),.clr(Clr),.Q(wline6[1]));
	FF_D ff63(.D(wline6[1]),.clk(manual_clk),.clr(Clr),.Q(wline6[2]));
	FF_D ff64(.D(wline6[2]),.clk(manual_clk),.clr(Clr),.Q(wline6[3]));
	FF_D ff65(.D(wline6[3]),.clk(manual_clk),.clr(Clr),.Q(wline6[4]));
	FF_D ff66(.D(wline6[4]),.clk(manual_clk),.clr(Clr),.Q(wline6[5]));
	FF_D ff67(.D(wline6[5]),.clk(manual_clk),.clr(Clr),.Q(wline6[6]));
	FF_D ff68(.D(wline6[6]),.clk(manual_clk),.clr(Clr),.Q(placar2[2]));
	
endmodule 