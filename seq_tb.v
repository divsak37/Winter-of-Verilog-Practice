module seq_tb();
reg in;
reg clk;
wire out;

Sequence_det node(.in(in),.out(out),.clk(clk));

initial begin
	clk = 0;
	in = 0;
	forever #5 clk = ~clk;
end

initial begin
	#10 in = 0;
	#10 in = 0;
	#10 in = 1; 
	#10 in = 1;
	#10 in = 0;
	#10 in = 0;
	#10 in = 1;
	#10 in = 0;
	#10 in = 0;
	#10 in = 0;
	#10 in = 1; 
	#10 in = 0;
	#10 in = 1;
	#10 in = 1;
	#10 in = 1;
	#10 in = 0;
	#10 in = 0;
	#10 in = 1;
end

initial
	$monitor("Input : %b, Output = %b, Clock : %b",in,out,clk);

endmodule
