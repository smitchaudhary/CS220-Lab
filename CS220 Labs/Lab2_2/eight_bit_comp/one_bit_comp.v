`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:55:27 01/31/2018 
// Design Name: 
// Module Name:    one_bit_comp 
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
module one_bit_comp(a, b, lin, gin, eqin, lout, gout, eqout);
	input a;
	input b;
	input lin;
	input gin;
	input eqin;
	
	output lout;
	output gout;
	output eqout;
	
	wire lout;
	wire gout;
	wire eqout;
	
	assign lout = lin|(eqin&(b&~a));
	assign gout = gin|(eqin&(a&~b));
	assign eqout = eqin&~(a^b);
	
endmodule
