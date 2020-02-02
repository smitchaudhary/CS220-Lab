`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:04:41 01/31/2018 
// Design Name: 
// Module Name:    five_four_bit_adder 
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
module five_four_bit_adder(PB1, PB2, PB3, PB4, RPB, Y, sum, cout);
	input PB1, PB2, PB3, PB4, RPB;
	input [3:0]Y;
	
	output [5:0]sum;
	output cout;
	
	wire [5:0]sum;
	wire cout;
	
	reg [3:0]A;
	reg [3:0]B;
	reg [3:0]C;
	reg [3:0]D;
	reg [3:0]E;
	
	wire [5:0]E2;
	wire [3:0]AB1;
	wire [4:0]AB2;
	wire [3:0]CD1;
	wire [4:0]CD2;
	wire [4:0]ABCD1;
	wire [5:0]ABCD2;
	wire cab;
	wire ccd;
	wire cabcd;
	
	always @(posedge PB1) begin
		A[3:0] <= Y;
	end
	always @(posedge PB2) begin
		B[3:0] <= Y;
	end
	always @(posedge PB3) begin
		C[3:0] <= Y;
	end
	always @(posedge PB4) begin
		D[3:0] <= Y;
	end
	always @(posedge RPB) begin
		E[3:0] <= Y;
	end
	
	assign E2 = {2'b00,E};
	
	four_bit_adder fob1(A, B, AB1, cab);
	assign AB2 = {cab, AB1};
	four_bit_adder fob2(C, D, CD1, ccd);
	assign CD2 = {ccd, CD1};
	
	five_bit_adder fib1(AB2, CD2, ABCD1, cabcd);
	assign ABCD2 = {cabcd, ABCD1};
	
	six_bit_adder sb1(ABCD2, E2, sum, cout);
	
endmodule
