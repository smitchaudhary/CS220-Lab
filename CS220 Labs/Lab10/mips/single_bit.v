`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:25 04/11/2018 
// Design Name: 
// Module Name:    single_bit 
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
module single_bit(a, b, cin, op, sum, cout);
	input a;
	input b;
	input cin;
	input op;
	
	output sum;
	output cout;
	
	wire sum;
	wire cout;

	assign sum = a^(b^op)^cin;
	assign cout = (a&(b^op))|((b^op)&cin)|(cin&a);
	
endmodule
