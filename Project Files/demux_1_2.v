module demux_1_2 (input A, Control, output S1,S2);

	assign S1 = A&Control;
	assign S2 = A&(~Control);

endmodule 