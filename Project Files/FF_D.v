module FF_D (input D,clk,clr,preset, output reg Q, Qbar);

	always@(posedge clk or posedge clr or posedge preset)
		begin
			if(clr == 1)
				begin
					Q = 0;
				end
			else 
				begin
					if(preset == 1)
						begin
							Q = 1;
						end
					else
						begin
							case({D})
						
							1:	Q = 1;//1
							0:	Q = 0;//0
						
							endcase	
						end
				end
			Qbar = ~Q;
		end
		
endmodule 