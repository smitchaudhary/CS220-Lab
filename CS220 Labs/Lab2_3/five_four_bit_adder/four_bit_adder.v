`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:50:05 01/31/2018 
// Design Name: 
// Module Name:    four_bit_adder 
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
module four_bit_adder(A, B, sum, cout);
	input [3:0]A;
	input [3:0]B;
	
	output [3:0]sum;
	output cout;
	
	wire [3:0]sum;
	wire [2:0]carry;
	wire cout;
	
	full_adder f1(A[0], B[0], 1'b0, sum[0], carry[0]);
	full_adder f2(A[1], B[1], carry[0], sum[1], carry[1]);
	full_adder f3(A[2], B[2], carry[1], sum[2], carry[2]);
	full_adder f4(A[3], B[3], carry[2], sum[3], cout);
	
endmodule
