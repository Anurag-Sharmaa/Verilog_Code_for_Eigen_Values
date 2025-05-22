`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.04.2024 18:19:37
// Design Name: 
// Module Name: comparator
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


module comparator
#(parameter N = 18)
(
input signed [2*N-1:0] a,
input signed[2*N-1:0] b,
output reg signed [2*N-1:0] comp_out
 );
   reg signed [N-1:0] sub1;

   
   
    always@(a,b) begin
        sub1 <= a - b;
    end
    
    always@(sub1) begin
        if(sub1[N-1] == 1) begin
            comp_out <=  b;
        end else
        
        comp_out <= a;
    end
    
    
endmodule
