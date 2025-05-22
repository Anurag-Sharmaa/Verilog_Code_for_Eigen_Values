`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: IIT Mandi
// Engineer: Anurag Sharma
// 
// Create Date: 02.04.2024 15:39:33
// Design Name: 
// Module Name: Eigen
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

module  eigen 
#(parameter N = 18)
(
input clk,
input [N-1:0] reala1, reala2, reala3, reala4,
input [N-1:0] realb1, realb2, realb3, realb4,
input [N-1:0] realc1, realc2, realc3, realc4,
input [N-1:0] reald1, reald2, reald3, reald4,

input [N-1:0] imaga1, imaga2, imaga3, imaga4,
input [N-1:0] imagb1, imagb2, imagb3, imagb4,
input [N-1:0] imagc1, imagc2, imagc3, imagc4,
input [N-1:0] imagd1, imagd2, imagd3, imagd4,
input start,
input [N-1:0] c1 ,
input [N-1:0] c2 ,
input [N-1:0] c3 ,
input [N-1:0] c4 ,
input [N-1:0] d1 ,
input [N-1:0] d2 ,
input [N-1:0] d3 ,
input [N-1:0] d4 ,
output [2*N-1:0] eigen_value
);
 
// results of matrix multiplication of real matrix with C matrix and same imag matrix with C as well
reg signed [2*N-1:0] res_real1;
reg signed [2*N-1:0] res_real2;
reg signed [2*N-1:0] res_real3;
reg signed [2*N-1:0] res_real4;
reg signed [2*N-1:0] res_imag1;
reg signed [2*N-1:0] res_imag2;
reg signed [2*N-1:0] res_imag3; 
reg signed [2*N-1:0] res_imag4;
reg signed [2*N-1:0] new_c1;
reg signed [2*N-1:0] new_c2;
reg signed [2*N-1:0] new_c3;
reg signed [2*N-1:0] new_c4;
reg signed [2*N-1:0] new_d1;
reg signed [2*N-1:0] new_d2;
reg signed [2*N-1:0] new_d3;
reg signed [2*N-1:0] new_d4;
///////////////////////

wire signed [2*N-1:0] abs1;
wire signed [2*N-1:0] abs2;
wire signed [2*N-1:0] abs3;
wire signed [2*N-1:0] abs4;
wire signed [2*N-1:0] comp1;
wire signed [2*N-1:0] comp2;

wire [2*N-1:0] comp_result;
wire signed [2*N-1:0] div_real1;
wire signed [2*N-1:0] div_real2;
wire signed [2*N-1:0] div_real3;
wire signed [2*N-1:0] div_real4;
wire signed  [2*N-1:0] div_imag1;
wire signed [2*N-1:0] div_imag2;
wire signed [2*N-1:0] div_imag3;
wire signed [2*N-1:0] div_imag4;
wire signed [2*N-1:0] mux_c1;
wire signed [2*N-1:0] mux_c2;
wire signed [2*N-1:0] mux_c3;
wire signed [2*N-1:0] mux_c4;

wire signed [2*N-1:0] mux_d1;
wire signed [2*N-1:0] mux_d2;
wire signed [2*N-1:0] mux_d3;
wire signed [2*N-1:0] mux_d4;


assign eigen_value = comp_result;

assign mux_c1 = start ? new_c1: c1;
assign mux_c2 = start ? new_c2: c2;
assign mux_c3 = start ? new_c3: c3;
assign mux_c4 = start ? new_c4: c4;

assign mux_d1 = start ? new_d1: d1;
assign mux_d2 = start ? new_d2: d2;
assign mux_d3 = start ? new_d3: d3;
assign mux_d4 = start ? new_d4: d4;


always@(posedge clk) begin
res_real1 <= (reala1*mux_c1 - imaga1*mux_d1) + (reala2*mux_c2 - imaga2*mux_d2) + (reala3*mux_c3 - imaga3*mux_d3) + (reala4*mux_c4 - imaga4*mux_d4);
res_real2 <= (realb1*mux_c1 - imagb1*mux_d1) + (realb2*mux_c2 - imagb2*mux_d2) + (realb3*mux_c3 - imagb3*mux_d3) + (realb4*mux_c4 - imagb4*mux_d4);
res_real3 <= (realc1*mux_c1 - imagc1*mux_d1) + (realc2*mux_c2 - imagc2*mux_d2) + (realc3*mux_c3 - imagc3*mux_d3) + (realc4*mux_c4 - imagc4*mux_d4);
res_real4 <= (reald1*mux_c1 - imagd1*mux_d1) + (reald2*mux_c2 - imagd2*mux_d2) + (reald3*mux_c3 - imagd3*mux_d3) + (reald4*mux_c4 - imagd4*mux_d4);
res_imag1 <= (imaga1*mux_c1 + reala1*mux_d1) + (imaga2*mux_c2 + reala2*mux_d2) + (imaga3*mux_c3 + reala3*mux_d3) + (imaga4*mux_c4 + reala4*mux_d4);
res_imag2 <= (imagb1*mux_c1 + realb1*mux_d1) + (imagb2*mux_c2 + realb2*mux_d2) + (imagb3*mux_c3 + realb3*mux_d3) + (imagb4*mux_c4 + realb4*mux_d4);
res_imag3 <= (imagc1*mux_c1 + realc1*mux_d1) + (imagc2*mux_c2 + realc2*mux_d2) + (imagc3*mux_c3 + realc3*mux_d3) + (imagc4*mux_c4 + realc4*mux_d4);
res_imag4 <= (imagd1*mux_c1 + reald1*mux_d1) + (imagd2*mux_c2 + reald2*mux_d2) + (imagd3*mux_c3 + reald3*mux_d3) + (imagd4*mux_c4 + reald4*mux_d4);

end


// absolute calculation for all the values of new C matrix values of 4x1 matrix
mat_abs abs_cal1
(
.real_a(res_real1),
.imag_b(res_imag1),
.abs(abs1));

mat_abs abs_cal2
(
.real_a(res_real2),
.imag_b(res_imag2),
.abs(abs2));

mat_abs abs_cal3
(
.real_a(res_real3),
.imag_b(res_imag3),
.abs(abs3));

mat_abs abs_cal4
(
.real_a(res_real4),
.imag_b(res_imag4),
.abs(abs4));

/////// absolute calculation completed

/// now we want to get out the maximum from these absolute values i.e OUR EIGEN VECTOR

comparator comp_cal1
(
.a(abs1),
.b(abs2),
.comp_out(comp1)
 );

comparator comp_cal2
(
.a(comp1),
.b(abs3),
.comp_out(comp2)
 );
 comparator comp_cal3
(
.a(comp2),
.b(abs4),
.comp_out(comp_result)
 );
 
 
// division blocks reuslt of matrix1*matrix2 get divided by maximum abs value  
 divider div_real_cal1
(
.dividend(res_real1),
.divisor(comp_result),
.div_out(div_real1)
);

divider div_real_cal2
(
.dividend(res_real2),
.divisor(comp_result),
.div_out(div_real2)
);

divider div_real_cal3
(
.dividend(res_real3),
.divisor(comp_result),
.div_out(div_real3)
);

divider div_real_cal4
(
.dividend(res_real4),
.divisor(comp_result),
.div_out(div_real4)
);

// division of imaginary values

divider div_imag_cal1
(
.dividend(res_imag1),
.divisor(comp_result),
.div_out(div_imag1)
);

divider div_imag_cal2
(
.dividend(res_imag2),
.divisor(comp_result),
.div_out(div_imag2)
);

divider div_imag_cal3
(
.dividend(res_imag3),
.divisor(comp_result),
.div_out(div_imag3)
);

divider div_imag_cal4
(
.dividend(res_imag4),
.divisor(comp_result),
.div_out(div_imag4)
);

always@(div_real4) begin
    new_c1 <= div_real1;
    new_c2 <= div_real2;
    new_c3 <= div_real3;
    new_c4 <= div_real4;   
end

always@(div_imag4) begin
    new_d1 <= div_imag1;
    new_d2 <= div_imag2;
    new_d3 <= div_imag3;
    new_d4 <= div_imag4;   
end


 

endmodule
