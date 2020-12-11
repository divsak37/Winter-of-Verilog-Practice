module ALU_status(a,b,op,out,zero,carry,overflow,sign);
input [7:0] a;
input [7:0] b;
input op; // 0 for addition, 1 for subtraction 
output reg [7:0] out;
output reg zero;
output reg carry;
output reg overflow;
output reg sign;

always@(a | b | op)
begin
    if(op==0)
        {carry,out} <= a + b;
    else
        {carry,out} <= a - b;
    zero <= (out?0:1);
    sign <= out[7];
    overflow <= (a[7]==b[7]?(a[7]==out[7]?0:1):0);
end

endmodule