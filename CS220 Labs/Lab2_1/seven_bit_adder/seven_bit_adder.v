`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:14:14 01/31/2018 
// Design Name: 
// Module Name:    seven_bit_adder 
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
module seven_bit_adder(PB1, PB2, PB3, PB4, Y, sum, cout);
	input PB1, PB2, PB3, PB4;
	input [3:0]Y;
	
	output [6:0]sum;
	output cout;
	
	wire [6:0]sum;
	wire [5:0]carry;
	wire cout;
	
	reg [6:0]A;
	reg [6:0]B;
	
	always @(posedge PB1) begin
		A[3:0] <= Y;
	end
	always @(posedge PB2) begin
		A[6:4] <= Y[2:0];
	end
	always @(posedge PB3) begin
		B[3:0] <= Y;
	end
	always @(posedge PB4) begin
		B[6:4] <= Y[2:0];
	end
	
	full_adder f1(A[0], B[0], 1'b0, sum[0], carry[0]);
	full_adder f2(A[1], B[1], carry[0], sum[1], carry[1]);
	full_adder f3(A[2], B[2], carry[1], sum[2], carry[2]);
	full_adder f4(A[3], B[3], carry[2], sum[3], carry[3]);
	full_adder f5(A[4], B[4], carry[3], sum[4], carry[4]);
	full_adder f6(A[5], B[5], carry[4], sum[5], carry[5]);
	full_adder f7(A[6], B[6], carry[5], sum[6], cout);
	
endmodule
