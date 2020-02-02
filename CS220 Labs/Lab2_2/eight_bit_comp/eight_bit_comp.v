`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:11:46 01/31/2018 
// Design Name: 
// Module Name:    eight_bit_comp 
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
module eight_bit_comp(PB1, PB2, PB3, PB4, Y, l, g, eq);
	input PB1, PB2, PB3, PB4;
	input [3:0]Y;
	
	reg [7:0]A;
	reg [7:0]B;
	
	output l, g, eq;
	
	wire [6:0]ltemp;
	wire [6:0]gtemp;
	wire [6:0]eqtemp;
	wire l, g, eq;
	
	always @(posedge PB1) begin
		A[3:0] <= Y;
	end
	always @(posedge PB2) begin
		A[7:4] <= Y;
	end
	always @(posedge PB3) begin
		B[3:0] <= Y;
	end
	always @(posedge PB4) begin
		B[7:4] <= Y;
	end
	
	one_bit_comp o1(A[7], B[7], 0, 0, 1, ltemp[0], gtemp[0], eqtemp[0]);
	one_bit_comp o2(A[6], B[6], ltemp[0], gtemp[0], eqtemp[0], ltemp[1], gtemp[1], eqtemp[1]);
	one_bit_comp o3(A[5], B[5], ltemp[1], gtemp[1], eqtemp[1], ltemp[2], gtemp[2], eqtemp[2]);
	one_bit_comp o4(A[4], B[4], ltemp[2], gtemp[2], eqtemp[2], ltemp[3], gtemp[3], eqtemp[3]);
	one_bit_comp o5(A[3], B[3], ltemp[3], gtemp[3], eqtemp[3], ltemp[4], gtemp[4], eqtemp[4]);
	one_bit_comp o6(A[2], B[2], ltemp[4], gtemp[4], eqtemp[4], ltemp[5], gtemp[5], eqtemp[5]);
	one_bit_comp o7(A[1], B[1], ltemp[5], gtemp[5], eqtemp[5], ltemp[6], gtemp[6], eqtemp[6]);
	one_bit_comp o8(A[0], B[0], ltemp[6], gtemp[6], eqtemp[6], l, g, eq);
	
endmodule
