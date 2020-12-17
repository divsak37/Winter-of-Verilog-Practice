module Sequence_det(in,out,clk);
input in;
input clk;
output reg out;


reg [2:0] state;
reg [2:0] next_state;

parameter [2:0] s0 = 3'b000;
parameter [2:0] s1 = 3'b001;
parameter [2:0] s2 = 3'b010;
parameter [2:0] s3 = 3'b011;
parameter [2:0] s4 = 3'b100;
parameter [2:0] s5 = 3'b101;
parameter [2:0] s6 = 3'b110;

initial begin
	state = s0;
	next_state = s0;
end

always@(posedge clk)
begin
	state = next_state;
	case(state)
		s0 : 
			if(in) begin
				out = 0;
				next_state = s4;
			end
			else begin
				out = 0;
				next_state = s1;
			end
		s1 : 
			if(in) begin
				out = 0;
				next_state = s2;
			end
			else begin
				out = 0;
				next_state = s1;
			end
		s2 : 
			if(in) begin
				out = 1;
				next_state = s3;
			end
			else begin
				out = 0;
				next_state = s5;
			end
		s3 : 
			if(in) begin
				out = 1;
				next_state = s4;
			end
			else begin
				out = 0;
				next_state = s5;
			end
		s4 : 
			if(in) begin
				out = 0;
				next_state = s0;
			end
			else begin
				out = 0;
				next_state = s5;
			end
		s5 : 
			if(in) begin
				out = 0;
				next_state = s2;
			end
			else begin
				out = 0;
				next_state = s6;
			end
		s6 : 
			if(in) begin
				out = 1;
				next_state = s2;
			end
			else begin
				out = 0;
				next_state = s1;
			end
	endcase
end
endmodule

