`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    16:34:04 02/14/2018
// Design Name:
// Module Name:    rs_calc
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
module rs_calc(clk, rotation_event, rotation_direction, Y, LED);
	input clk;
	input rotation_event;
	input rotation_direction;
	input [3:0]Y;

	output [7:0]LED;

	reg prev_rotation_event;
	reg [6:0]A;
	reg [6:0]B;
	reg op;

	wire [7:0]LED;
	wire [6:0]carry;

	integer cnt;

	initial begin
		prev_rotation_event = 1'b1;
		cnt = 0;
	end

	always @(posedge clk) begin
		prev_rotation_event <= rotation_event;
		if ((~prev_rotation_event)&(rotation_event)) begin
			if(cnt == 0) begin
				A[3:0] <= Y;
				cnt = cnt + 1;
			end
			else if(cnt == 1) begin
				A[6:4] <= Y[2:0];
				cnt = cnt + 1;
			end
			else if(cnt == 2) begin
				B[3:0] <= Y;
				cnt = cnt + 1;
			end
			else if(cnt == 3) begin
				B[6:4] <= Y[2:0];
				cnt = cnt + 1;
			end
			else if(cnt == 4) begin
				op <= Y[0];
				cnt = 0;
			end
		end
	end

	single_bit s0(A[0], B[0], op, op, LED[0], carry[0]);
	single_bit s1(A[1], B[1], carry[0], op, LED[1], carry[1]);
	single_bit s2(A[2], B[2], carry[1], op, LED[2], carry[2]);
	single_bit s3(A[3], B[3], carry[2], op, LED[3], carry[3]);
	single_bit s4(A[4], B[4], carry[3], op, LED[4], carry[4]);
	single_bit s5(A[5], B[5], carry[4], op, LED[5], carry[5]);
	single_bit s6(A[6], B[6], carry[5], op, LED[6], carry[6]);
	assign LED[7] = carry[5]^carry[6]

endmodule
