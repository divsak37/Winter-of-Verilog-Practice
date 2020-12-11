module alu_tb();
reg [7:0] A;
reg [7:0] B;
reg op;
wire zero;
wire overflow;
wire sign;
wire carry;
wire [7:0] out;
reg clk;

ALU_status m(.a(A),.b(B),.op(op),.out(out),.zero(zero),.carry(carry),.overflow(overflow),.sign(sign));

initial begin
A = 8'h78;
B = 8'hA7;
clk = 0;
op = 0;
forever #5 clk = ~clk;
end

always@(posedge clk)
begin
    op = op+1;
end

initial
$monitor("A = %b, B = %b, Operation = %b, out = %b, Zero = %b, Carry = %b, Overflow = %b, Sign = %b, Clock = %b ",A,B,op,out,zero,carry,overflow,sign,clk);  // monitor output

endmodule