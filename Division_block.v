`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.04.2024 10:51:29
// Design Name: 
// Module Name: div_block
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

module divider    
#(parameter N = 18)
(
    input signed [2*N-1:0] dividend,
    input signed [2*N-1:0]  divisor,
    
    output  reg signed [2*N-1:0] div_out
);



always@(divisor) begin
    if (dividend[N-1] == 1) begin
        div_out = {(dividend * (-1)), 10'b0000000000 } / divisor;
        div_out = div_out *(-1);
    end else
    if(dividend >= divisor) begin
        div_out <= {dividend, 10'b0000000000} / divisor;
    end else
    if (dividend < divisor) begin
        div_out = {dividend, 10'b0000000000} / divisor;
    end
    
end



endmodule
