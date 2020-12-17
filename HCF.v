module HCF(A,B,hcf,clk,ready,halt);
input [3:0] A,B;
input clk,ready;
output reg [3:0] hcf;
output reg halt;

reg int_rd;
reg [3:0] temp_a,temp_b,swap;
reg [2:0] state;
reg [2:0] next_state;

parameter [2:0] s0 = 3'b000;
parameter [2:0] s1 = 3'b001;
parameter [2:0] s2 = 3'b010;
parameter [2:0] s3 = 3'b011;
parameter [2:0] sr = 3'b111;


always@(posedge ready)
begin
	halt = 0;
	hcf  = 0;
	temp_a = A;
	temp_b = B;
	int_rd = 1;
	state = sr;
	next_state = s0;
end

always@(posedge clk)
begin
	state = next_state;
	case(state)
		sr:
			next_state = s0;
		s0:
			if(int_rd == 0)
				next_state = sr;
			else if(temp_b == 0)
				next_state = s3;
			else if(temp_a >= temp_b)
				next_state = s1;
			else if(temp_a < temp_b)
				next_state = s2;
		s1: begin
				temp_a = temp_a - temp_b;
				next_state = s0;
			end
		s2: begin
				swap = temp_b;
				temp_b = temp_a;
				temp_a = swap;
				next_state = s0;
			end
		s3: begin
				halt = 1;
				hcf = temp_a;
				int_rd = 0;
				next_state = s0;
			end
	endcase
end

endmodule

				
				