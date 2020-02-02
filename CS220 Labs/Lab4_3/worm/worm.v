`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:19:28 03/07/2018 
// Design Name: 
// Module Name:    worm 
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
module worm(clk, ROT_A, ROT_B, Y, LED);
	input clk;
	input ROT_A;
	input ROT_B;
	input [3:0]Y;
	
	output [7:0]LED;
	
	wire [7:0]LED;
	wire rotation_event;
	wire rotation_direction;
	
	
	rs_enc_stepdir r1(clk, ROT_A, ROT_B, rotation_event, rotation_direction);
	coordinates c1(clk, rotation_event, rotation_direction, Y, LED);

endmodule
