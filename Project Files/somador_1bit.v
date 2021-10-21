module somador_1bit(input A,A2,Te, output S,Ts);

	assign S = (A^A2)^Te;
	assign Ts = (A&Te)|(A2&Te)|(A&A2);

endmodule 