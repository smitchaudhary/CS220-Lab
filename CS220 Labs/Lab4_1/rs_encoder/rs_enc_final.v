`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:09:01 02/14/2018 
// Design Name: 
// Module Name:    rs_enc_final 
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
module rs_enc_final(clk, ROT_A, ROT_B, LED);
	input clk;
	input ROT_A;
	input ROT_B;
	
	output [7:0]LED;
	
	wire [7:0]LED;
	wire rotation_event;
	wire rotation_direction;
	
	rs_enc_stepdir r1(clk, ROT_A, ROT_B, rotation_event, rotation_direction);
	rs_encoder r2(clk, rotation_event, rotation_direction, LED);
	
endmodule
