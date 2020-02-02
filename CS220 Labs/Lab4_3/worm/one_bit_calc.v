`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:16:45 03/07/2018 
// Design Name: 
// Module Name:    one_bit_calc 
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
module one_bit_calc(a,b,cin,op,sum,cout);
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
