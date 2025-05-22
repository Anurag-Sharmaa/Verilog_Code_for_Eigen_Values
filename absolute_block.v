`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT Mandi
// Engineer: Anurag Sharma
// 
// Create Date: 13.04.2024 17:10:45
// Design Name: 
// Module Name: abs
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mat_abs
#(parameter N = 18)
(
input signed [2*N-1:0] real_a,
input signed [2*N-1:0] imag_b,
output reg signed [2*N-1:0] abs);


reg signed [2*N-1:0] a_abs;
reg signed [2*N-1:0] b_abs;
reg signed [2*N-1:0] s;
reg signed [2*N-1:0] l;
reg signed [2*N-1:0] max;

always @(real_a,imag_b)
begin
if (real_a[N-1]==1)
a_abs=real_a*(-1);
else
a_abs=real_a;


if (imag_b[N-1]==1)
b_abs=imag_b*(-1);
else
b_abs=imag_b;

s=a_abs+b_abs;

l=a_abs-b_abs;
if(l[N-1]==1)
max=b_abs;
else
max=a_abs;

abs=(3*s+5*max)/8;

end
endmodule
