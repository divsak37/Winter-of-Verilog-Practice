module hcf_tb();
reg [3:0] A,B;
reg ready,clk;
wire halt;
wire [3:0] hcf;

HCF node(.A(A),.B(B),.hcf(hcf),.clk(clk),.ready(ready),.halt(halt));
initial begin
	clk = 0;
	ready = 0;
	forever #5 clk = ~clk;
end

initial begin
	#10 A = 4; B = 13; ready = 1;
	#5 ready = 0;
	#300 A = 10; B = 2; ready = 1;
	#5 ready = 0;
end

initial
	$monitor("A = %d, B = %d, clk = %b, ready = %b, halt = %b, hcf = %d",A,B,clk,ready,halt,hcf);

endmodule

