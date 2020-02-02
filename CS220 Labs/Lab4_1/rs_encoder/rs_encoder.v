`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:59 02/14/2018 
// Design Name: 
// Module Name:    rs_encoder 
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
module rs_encoder(clk, rotation_event, rotation_direction, LED);
	input clk;
	input rotation_event;
	input rotation_direction;
	
	output [7:0]LED;
	
	reg [7:0]LED;
	reg prev_rotation_event;
	
	initial begin
		LED = 8'b1;
		prev_rotation_event = 1'b1;
	end
	
	always @(posedge clk) begin
		prev_rotation_event <= rotation_event;
		if ((~prev_rotation_event)&(rotation_event)) begin
			if (~rotation_direction) begin
				LED[0] <= LED[1];
				LED[1] <= LED[2];
				LED[2] <= LED[3];
				LED[3] <= LED[4];
				LED[4] <= LED[5];
				LED[5] <= LED[6];
				LED[6] <= LED[7];
				LED[7] <= LED[0];
			end
			else  begin
				LED[0] <= LED[7];
				LED[1] <= LED[0];
				LED[2] <= LED[1];
				LED[3] <= LED[2];
				LED[4] <= LED[3];
				LED[5] <= LED[4];
				LED[6] <= LED[5];
				LED[7] <= LED[6];
			end
		end
	end
endmodule
