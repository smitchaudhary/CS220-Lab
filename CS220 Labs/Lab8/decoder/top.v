`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:18:04 03/28/2018
// Design Name:
// Module Name:    top
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
module top(clk, PB, LED);
	input clk;
	input PB;

	output wire [7:0]LED;
	wire [7:0]LED1;
	wire [7:0] mem [7:0];

	reg [7:0]step;
	reg [2:0] imem [7:0];
	reg [7:0]tmp1;
	reg [7:0]tmp2;
	reg [7:0]LED2;

	integer cnt;

	initial begin
		cnt = 0;
		imem[0] <= 3'd3;
		imem[1] <= 3'd4;
		imem[2] <= 3'd7;
		imem[3] <= 3'd2;
		imem[4] <= 3'd3;
		imem[5] <= 3'd5;
		imem[6] <= 3'd0;
		imem[7] <= 3'd2;
		tmp1 = 8'b0;
		tmp2 = 8'b0;
		step = 8'b0;
		LED2 = 8'b0;
	end

	decoder d1(imem[0], mem[0]);
	decoder d2(imem[1], mem[1]);
	decoder d3(imem[2], mem[2]);
	decoder d4(imem[3], mem[3]);
	decoder d5(imem[4], mem[4]);
	decoder d6(imem[5], mem[5]);
	decoder d7(imem[6], mem[6]);
	decoder d8(imem[7], mem[7]);

	Xor x1(tmp1, tmp2, LED1);
	parity p1(LED1, par);

	assign LED = (~step & LED1) | (step & LED2);

	always @(posedge PB) begin
		step <= ~step;
	end

	always @(posedge clk) begin
		if(~step) begin
			if(cnt < 8) begin
				tmp1 <= mem[cnt];
				tmp2 <= LED1;
				cnt <= cnt + 1;
			end
		end
		else begin
			LED2[7:1] <= 7'b0;
			LED2[0] <= par;
		end
	end

endmodule
