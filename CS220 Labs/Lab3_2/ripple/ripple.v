`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:07:52 02/07/2018 
// Design Name: 
// Module Name:    ripple 
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
`define SHIFT_TIME 50000000
`define TICK #2
module ripple (clk, LED);
	input clk;
	
	output [7:0]LED;

	reg [25:0]cnt;
	reg [7:0]LED;
	integer i;
	
	
	initial begin
		i = 0;
		LED = 8'b1;
		cnt = 26'b0;
	end
	
	always @(posedge clk) begin
		cnt <= (cnt + 26'b1);
		if (cnt == `SHIFT_TIME) begin
			LED <= 8'b0;
			LED[i] <= 1;
			cnt <= 0;
			if(i==7) begin
				i = 0;
			end
			else begin
				i = i + 1;
			end
		end
	end
endmodule
