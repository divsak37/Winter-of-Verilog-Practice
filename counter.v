module counter(in,out,reset,load,inc,enable,clk);
input [3:0] in;
input reset,load,inc,enable,clk;
output reg [3:0] out;

always@(posedge clk,posedge inc,posedge load,posedge reset)
begin
    if(enable & ~reset & ~load)
	out = (out + 1)%10;
    if(enable & load & ~reset)
        out = in;
    if(reset)
        out = 0;
end

endmodule

