module Mux_16x1(Sel,in,out); //top level 16_1 mux module
input [3:0] Sel;
input  [15:0] in;
output out;
wire o1,o2,o3,o4;

Mux_4_1 m1(.Sel(Sel[1:0]),.in(in[3:0]),.out(o1));
Mux_4_1 m2(.Sel(Sel[1:0]),.in(in[7:4]),.out(o2));
Mux_4_1 m3(.Sel(Sel[1:0]),.in(in[11:8]),.out(o3));
Mux_4_1 m4(.Sel(Sel[1:0]),.in(in[15:12]),.out(o4));
Mux_4_1 m5(.Sel(Sel[3:2]),.in({o4,o3,o2,o1}),.out(out));

endmodule

module Mux_4_1(Sel,in,out); // 4_1 mux inputs which has to be used to build 16_1 mux
input [1:0] Sel;
input  [3:0] in;
output out;

assign out = Sel[0]?(Sel[1]?in[3]:in[1]):(Sel[1]?in[2]:in[0]);

endmodule

