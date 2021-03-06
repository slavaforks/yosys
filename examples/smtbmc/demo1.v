module demo1(input clk, input addtwo, output iseven);
	reg [3:0] cnt;
	wire [3:0] next_cnt;

	inc inc_inst (addtwo, iseven, cnt, next_cnt);

	always @(posedge clk)
		cnt = (iseven ? cnt == 10 : cnt == 11) ? 0 : next_cnt;
	
	assert property (cnt != 15);
	initial assume (!cnt[3] && !cnt[0]);
	// initial predict ((iseven && addtwo) || cnt == 9);
endmodule

module inc(input addtwo, output iseven, input [3:0] a, output [3:0] y);
	assign iseven = !a[0];
	assign y = a + (addtwo ? 2 : 1);
endmodule
