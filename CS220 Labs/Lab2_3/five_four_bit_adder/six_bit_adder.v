`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:48 01/31/2018 
// Design Name: 
// Module Name:    six_bit_adder 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module six_bit_adder(A, B, sum, cout);
	input [5:0]A;
	input [5:0]B;
	
	output [5:0]sum;
	output cout;
	
	wire [5:0]sum;
	wire [4:0]carry;
	wire cout;
	
	full_adder h1(A[0], B[0], 1'b0, sum[0], carry[0]);
	full_adder h2(A[1], B[1], carry[0], sum[1], carry[1]);
	full_adder h3(A[2], B[2], carry[1], sum[2], carry[2]);
	full_adder h4(A[3], B[3], carry[2], sum[3], carry[3]);
	full_adder h5(A[4], B[4], carry[3], sum[4], carry[4]);
	full_adder h6(A[5], B[5], carry[4], sum[5], cout);
	
endmodule
