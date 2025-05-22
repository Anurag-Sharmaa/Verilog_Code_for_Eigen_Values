`timescale 1ns/1ps
///// ///// //// ////////////////////////////////////////////////////////////////////
// Company: 
// Engineer : 
// 
// Create Da te: 02.04.2024 15:50:37
// Design Name: 
// Module Name: eigen_tb
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


module eigen_tb ();
parameter N = 18;

reg clk = 0;
reg [N-1:0] reala1, reala2, reala3, reala4;
reg [N-1:0] realb1, realb2, realb3, realb4;
reg [N-1:0] realc1, realc2, realc3, realc4;
reg [N-1:0] reald1, reald2, reald3, reald4;

reg [N-1:0] imaga1, imaga2, imaga3, imaga4;
reg [N-1:0] imagb1, imagb2, imagb3, imagb4;
reg [N-1:0] imagc1, imagc2, imagc3, imagc4;
reg [N-1:0] imagd1, imagd2, imagd3, imagd4;
reg start;
reg [N-1:0] c1 ;
reg [N-1:0] c2 ;
reg [N-1:0] c3 ;
reg [N-1:0] c4 ;
reg [N-1:0] d1 ;
reg [N-1:0] d2 ;
reg [N-1:0] d3 ;
reg [N-1:0] d4 ;
wire [2*N-1:0] eigen_value;

eigen uut
(
clk,
reala1, reala2, reala3, reala4,
realb1, realb2, realb3, realb4,
realc1, realc2, realc3, realc4,
reald1, reald2, reald3, reald4,

imaga1, imaga2, imaga3, imaga4,
imagb1, imagb2, imagb3, imagb4,
imagc1, imagc2, imagc3, imagc4,
imagd1, imagd2, imagd3, imagd4,
start,
c1,c2,c3,c4,
d1,d2,d3,d4,
eigen_value
);



always #10 clk = ~clk;

initial begin
start = 0;


reala1 = 'd1; reala2 = 'd2; reala3 = 'd3;reala4 = 'd4;
realb1 = 'd4; realb2 = 'd4; realb3 = 'd3; realb4 = 'd5;
realc1 = 'd2; realc2 = 'd3; realc3 = 'd2; realc4 = 'd3;
reald1 = 'd5; reald2 = 'd7; reald3 = 'd2; reald4 = 'd1;

imaga1 = 'd2; imaga2 = 'd4; imaga3 = 'd6; imaga4 = 'd3;
imagb1 = 'd5; imagb2 = 'd2; imagb3 = 'd4; imagb4 = 'd2;
imagc1 = 'd5; imagc2 = 'd2; imagc3 = 'd2; imagc4 = 'd2;
imagd1 = 'd2; imagd2 = 'd2; imagd3 = 'd3;  imagd4 = 'd3;

c1 = 1;
c2 = 1;
c3 = 1;
c4 = 1;
d1 = 0;
d2 = 0;
d3 = 0;
d4 = 0;

#80
start = 1;


end

endmodule
