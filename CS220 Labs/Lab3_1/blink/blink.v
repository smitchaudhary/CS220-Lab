`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:32:46 02/07/2018 
// Design Name: 
// Module Name:    blink 
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
`define OFF_TIME 26'b01011111010111100001000000
`define ON_TIME 26'b10111110101111000010000000
`define TICK #2
module blink (clk, led0);
	input clk;
	
	output led0;
	
	reg [25:0]cnt;
	reg led0;
	
	initial begin
		led0 = 1'b1;
		cnt = 26'b0;
	end
	
	always @(posedge clk) begin
		cnt <= (cnt + 26'b1);
		if (cnt == `OFF_TIME) begin
			led0 <= 0;
		end
		else if (cnt == `ON_TIME) begin
			led0 <= 1;
			cnt <= 0;
		end
	end
endmodule
