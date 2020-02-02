`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:14 03/28/2018 
// Design Name: 
// Module Name:    Xor 
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
module Xor(a, b, c);
	input [7:0]a;
	input [7:0]b;

	output wire [7:0]c;

	assign c[0] = a[0] ^ b[0];
	assign c[1] = a[1] ^ b[1];
	assign c[2] = a[2] ^ b[2];
	assign c[3] = a[3] ^ b[3];
	assign c[4] = a[4] ^ b[4];
	assign c[5] = a[5] ^ b[5];
	assign c[6] = a[6] ^ b[6];
	assign c[7] = a[7] ^ b[7];

endmodule
