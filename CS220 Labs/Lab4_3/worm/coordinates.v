`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:23:29 03/07/2018 
// Design Name: 
// Module Name:    coordinates 
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
module coordinates(clk, rotation_event, rotation_direction, Y, LED);
	input clk;
	input rotation_event;
	input rotation_direction;
	input [3:0]Y;

	output [7:0]LED;

	reg prev_rotation_event;
	reg [1:0]steps;
	reg [1:0]dir;
	reg [7:0]LED;
	reg faltu;
	
	wire [4:0]x;
	wire [4:0]y;
	wire [7:0]carry;
	wire coutx, couty;

	initial begin
		prev_rotation_event = 1'b1;
		LED = 8'b0;
		steps = 2'b0;
		dir = 2'b0;
	end
	
	one_bit_calc s0(LED[0], steps[0], dir[0], dir[0], x[0], carry[0]);
	one_bit_calc s1(LED[1], steps[1], carry[0], dir[0], x[1], carry[1]);
	one_bit_calc s2(LED[2], 0, carry[1], dir[0], x[2], carry[2]);
	one_bit_calc s3(LED[3], 0, carry[2], dir[0], x[3], carry[3]);
	one_bit_calc s4(0, 0, carry[3], dir[0], x[4], coutx);
	
	one_bit_calc s5(LED[4], steps[0], dir[0], dir[0], y[0], carry[4]);
	one_bit_calc s6(LED[5], steps[1], carry[4], dir[0], y[1], carry[5]);
	one_bit_calc s7(LED[6], 0, carry[5], dir[0], y[2], carry[6]);
	one_bit_calc s8(LED[7], 0, carry[6], dir[0], y[3], carry[7]);
	one_bit_calc s9(0, 0, carry[7], dir[0], y[4], couty);
	

	always @(posedge clk) begin
		prev_rotation_event <= rotation_event;
		if ((~prev_rotation_event) & (rotation_event)) begin
			steps[1:0] <= Y[1:0];
			dir[1:0] <= Y[3:2];
			faltu = 0;
			
			if (dir[1]) begin	
				if (y[4] & dir[0]) begin
					LED[7:4] <= 4'b0000;
				end
				else if (y[4] & ~dir[0]) begin
					LED[7:4] <= 4'b1111;
				end
				else begin
					LED[7:4] <= y[3:0];
				end
			end
			else begin
				if (x[4] & dir[0]) begin
					LED[3:0] <= 4'b0000;
				end
				else if (x[4] & ~dir[0]) begin
					LED[3:0] <= 4'b1111;
				end
				else begin
					LED[3:0] <= x[3:0];
				end
			end
		end
	end
	
endmodule
