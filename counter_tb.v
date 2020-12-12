module counter_tb();
  reg [3:0] in;
  reg reset,load,inc,enable,clk;
  wire [3:0] out;

counter dut(.in(in),.out(out),.reset(reset),.load(load),.inc(inc),.enable(enable),.clk(clk));

initial begin
    in = 0;
    reset =0;
    load=0;
    inc=0;
    enable=1;
    clk=0;
    forever #5 clk = ~clk;
end

initial begin
#10 in = 4'b0101; load=1;
#1 load =0;
#4 inc=1; #1 inc=0;
#5 reset = 1;
#20 reset = 0;
#30 in = 4'b1000; load = 1; 
#1 load =0;
#1 inc =1; #1 inc =0;
#10 reset =1;#30 reset =0;
end

initial
$monitor("inp=%b, out=%b, reset=%b, load=%b, inc=%b, enable=%b, clk=%b",in,out,reset,load,inc,enable,clk);  // monitor output
endmodule
  