`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:30:35 03/28/2018 
// Design Name: 
// Module Name:    decoder 
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
module decoder(imem, mem);
	input [2:0]imem;

	output wire [7:0]mem;
	
	assign mem[0] = (~imem[2]) & (~imem[1]) & (~imem[0]);
	assign mem[1] = (~imem[2]) & (~imem[1]) & (imem[0]);
	assign mem[2] = (~imem[2]) & (imem[1]) & (~imem[0]);
	assign mem[3] = (~imem[2]) & (imem[1]) & (imem[0]);
	assign mem[4] = (imem[2]) & (~imem[1]) & (~imem[0]);
	assign mem[5] = (imem[2]) & (~imem[1]) & (imem[0]);
	assign mem[6] = (imem[2]) & (imem[1]) & (~imem[0]);
	assign mem[7] = (imem[2]) & (imem[1]) & (imem[0]);
	
endmodule
