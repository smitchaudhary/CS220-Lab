`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:58:46 01/31/2018 
// Design Name: 
// Module Name:    five_bit_adder 
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
module five_bit_adder(A, B, sum, cout);
	input [4:0]A;
	input [4:0]B;
	
	output [4:0]sum;
	output cout;
	
	wire [4:0]sum;
	wire [3:0]carry;
	wire cout;
	
	full_adder g1(A[0], B[0], 1'b0, sum[0], carry[0]);
	full_adder g2(A[1], B[1], carry[0], sum[1], carry[1]);
	full_adder g3(A[2], B[2], carry[1], sum[2], carry[2]);
	full_adder g4(A[3], B[3], carry[2], sum[3], carry[3]);
	full_adder g5(A[4], B[4], carry[3], sum[4], cout);
	
endmodule
