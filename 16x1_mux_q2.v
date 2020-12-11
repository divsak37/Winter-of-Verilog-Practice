module Mux_16x1_2(Sel,in,out);
input [3:0] Sel;
input  [15:0] in;
output reg out;

  always@(Sel or in or out)
    out <= in[Sel];   // assigning output to one of the input value using selector lines
endmodule


