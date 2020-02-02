`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    14:18:12 04/04/2018
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
module top(clk, LED);
	input clk;

	output reg [7:0]LED;

	reg [31:0] imem [6:0];
	reg [7:0] mem [31:0];

	integer state;
	reg [2:0]pc;
	reg [2:0]MAX_PC;

	reg [31:0]currinst;
	reg [5:0]opcode;
	reg [4:0]rs;
	reg [4:0]rt;
	reg [4:0]rd;
	reg [7:0]imm;

	reg [1:0]op;
	reg [7:0]A;
	reg [7:0]B;
	wire [7:0]res;

	addsub as1(op[0], A, B, res);

	initial begin
		LED = 8'b0;

		state = 0;
		pc = 3'b0;
		MAX_PC = 3'b111;
		
		op = 2'b0;
		A = 8'b0;
		B = 8'b0;

		imem[0] = 32'b00100100000000010000000000101101;
		imem[1] = 32'b00100100000000101111111111101100;
		imem[2] = 32'b00100100000000111111111111000100;
		imem[3] = 32'b00100100000001000000000000011110;
		imem[4] = 32'b00000000001000100010100000010101;
		imem[5] = 32'b00000000011001000011000000010101;
		imem[6] = 32'b00000000101001100010100000010111;

		mem[0] = 8'b0;
		mem[1] = 8'b0;
		mem[2] = 8'b0;
		mem[3] = 8'b0;
		mem[4] = 8'b0;
		mem[5] = 8'b0;
		mem[6] = 8'b0;
		mem[7] = 8'b0;
		mem[8] = 8'b0;
		mem[9] = 8'b0;
		mem[10] = 8'b0;
		mem[11] = 8'b0;
		mem[12] = 8'b0;
		mem[13] = 8'b0;
		mem[14] = 8'b0;
		mem[15] = 8'b0;
		mem[16] = 8'b0;
		mem[17] = 8'b0;
		mem[18] = 8'b0;
		mem[19] = 8'b0;
		mem[20] = 8'b0;
		mem[21] = 8'b0;
		mem[22] = 8'b0;
		mem[23] = 8'b0;
		mem[24] = 8'b0;
		mem[25] = 8'b0;
		mem[26] = 8'b0;
		mem[27] = 8'b0;
		mem[28] = 8'b0;
		mem[29] = 8'b0;
		mem[30] = 8'b0;
		mem[31] = 8'b0;
	end

	always @(posedge clk) begin
		if(state == 0) begin
			currinst <= imem[pc];
			pc <= pc + 1;
			state <= 1;
		end
		else if(state == 1) begin
			if(currinst[31:26] == 6'b0) begin
				opcode <= currinst[5:0];
				rs <= currinst[25:21];
				rt <= currinst[20:16];
				rd <= currinst[15:11];
			end
			else begin
				opcode <= currinst[31:26];
				rs <= currinst[25:21];
				rd <= currinst[20:16];
				imm <= currinst[7:0];
			end
			state <= 2;
		end
		else if(state == 2) begin
			if(currinst[31:26] == 6'b0) begin
				A <= mem[rs];
				B <= mem[rt];
			end
			else begin
				A <= mem[rs];
				B <= imm;
			end
			state <= 3;
		end
		else if(state == 3) begin
			if(opcode == 6'b001001 | opcode == 6'b010101) begin
				op <= 2'b0;
			end
			else if(opcode == 6'b010111) begin
				op <= 2'b1;
			end
			else begin
				op[1] <= 1;
			end
			state <= 4;
		end
		else if(state == 4) begin
			if(~op[1] & rd != 5'b0) begin
				mem[rd] <= res;
			end
			if(pc == MAX_PC) begin
				state <= 5;
			end
			else begin
				state <= 0;
			end
		end
		else if(state == 5) begin
			LED <= mem[rd];
			state <= 6;
		end
	end

endmodule
