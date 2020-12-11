module mux_tb();   // testbench for 16x1 mux
  reg [15:0] inp;   // 16 bit input
  reg [3:0] sel;   // 4 bits for 4 selector lines
  reg clk; 
  wire out;    // output of 16x1 mux
  
Mux_16x1 m(.Sel(sel),.in(inp),.out(out));
initial begin 
inp = 16'hFAC7 ;   // input given to 16 input lines
clk=0;
sel = 0;
forever #5 clk=~clk;  // clock with period of 10ns
end

always@(posedge clk)
begin
  sel <= sel + 1;   // incrementing selector line to test all possibilties 
end

initial
$monitor("inp = %d, select line = %d, out = %d",inp,sel,out);  // monitor output

endmodule