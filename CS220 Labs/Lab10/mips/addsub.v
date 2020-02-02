`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:38 04/11/2018 
// Design Name: 
// Module Name:    addsub 
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
module addsub(op, A, B, res);
	input op;
	input [7:0]A;
	input [7:0]B;
	
	output wire [7:0]res;
	wire overflow;
	wire [7:0]carry;

	single_bit s0(A[0], B[0], op, op, res[0], carry[0]);
	single_bit s1(A[1], B[1], carry[0], op, res[1], carry[1]);
	single_bit s2(A[2], B[2], carry[1], op, res[2], carry[2]);
	single_bit s3(A[3], B[3], carry[2], op, res[3], carry[3]);
	single_bit s4(A[4], B[4], carry[3], op, res[4], carry[4]);
	single_bit s5(A[5], B[5], carry[4], op, res[5], carry[5]);
	single_bit s6(A[6], B[6], carry[5], op, res[6], carry[6]);
	single_bit s7(A[7], B[7], carry[6], op, res[7], carry[7]);
	assign overflow = carry[6]^carry[7];

endmodule
