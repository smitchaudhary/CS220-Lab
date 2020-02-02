`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:10:52 04/11/2018 
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
	
	reg [31:0] imem [13:0];
	reg [7:0] mem [31:0];
	reg [7:0] dmem [10:0];
	
	integer state;
	reg [7:0]pc;
	reg [7:0]MAX_PC;
	reg invalid;
	
	reg [31:0]currinst;
	reg [5:0]opcode;
	reg [4:0]rd;
	reg [4:0]rs;
	reg [4:0]rt;
	reg [5:0]func;
	reg [7:0]jtar;
	reg [7:0]imm;
	
	reg [7:0]A;
	reg [7:0]B;
	wire [7:0]res;
	
	reg [7:0]joff;
	wire [7:0]xjtar;
	
	initial begin
		LED <= 8'b0;
		
		pc = 8'b1100;
		MAX_PC = 8'b1110;
		state = 0;
		invalid = 0;
		
		A = 8'b0;
		B = 8'b0;
		
		imem[0] = 32'b00100100000000100000000000000000;//addiu
		imem[1] = 32'b00100100000000110000000000000000;//addiu
		imem[2] = 32'b00000000011000010010000000101010;//slt
		imem[3] = 32'b00010000100000000000000000001000;//beq
		imem[4] = 32'b00100100000001010000000000001010;//addiu
		imem[5] = 32'b00010000011001010000000000000110;//beq
		imem[6] = 32'b10001100011001100000000000000000;//lw
		imem[7] = 32'b00000000010001100001000000100001;//addu
		imem[8] = 32'b00100100011000110000000000000001;//addiu
		imem[9] = 32'b00000000011000010010000000101010;//slt
		imem[10] = 32'b00010000100000001111111111111011;//bne
		imem[11] = 32'b00000011111000000000000000001000;//jr
		imem[12] = 32'b10001100000000010000000000001010;//lw
		imem[13] = 32'b00001100000000000000000000000000;//jal
		
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
		mem[31] = 8'b1110;
		
		dmem[0] = 8'b1;
		dmem[1] = 8'b1;
		dmem[2] = 8'b1;
		dmem[3] = 8'b0;
		dmem[4] = 8'b0;
		dmem[5] = 8'b0;
		dmem[6] = 8'b0;
		dmem[7] = 8'b0;
		dmem[8] = 8'b0;
		dmem[9] = 8'b0;
		dmem[10] = 8'b1000;
	end
	
	addsub as1(0, A, B, res);
	addsub aspc(0, pc, joff, xjtar);
	
	always @(posedge clk) begin
		if(state == 0) begin
			currinst <= imem[pc];
			state <= 1;
		end
		else if(state == 1) begin
			if(currinst[31:26] == 6'b0) begin
				opcode <= currinst[31:26];
				rs <= currinst[25:21];
				rt <= currinst[20:16];
				rd <= currinst[15:11];
				func <= currinst[5:0];
			end
			else if(currinst[31:26] == 6'b11) begin
				opcode <= currinst[31:26];
				jtar <= currinst[7:0];
			end
			else begin
				opcode <= currinst[31:26];
				rs <= currinst[25:21];
				rt <= currinst[20:16];
				imm <= currinst[7:0];
			end
			state <= 2;
		end
		else if(state == 2) begin
			if(opcode == 6'b0) begin
				if(func == 6'b010101) begin//addu
					A <= mem[rs];
					B <= mem[rt];
				end
				else if(func == 6'b101010) begin//slt
					A <= mem[rs];
					B <= mem[rt];
				end
				else if(func == 6'b001000) begin//jr
					jtar <= mem[rs];
				end
			end
			else if(opcode == 6'b11) begin//jal
				
			end
			else if(opcode == 6'b001001) begin//addiu
				A <= mem[rs];
				B <= imm;
			end
			else if(opcode == 6'b000100) begin//beq
				A <= mem[rs];
				B <= mem[rt];
				joff <= imm;
			end
			else if(opcode == 6'b000101) begin//bne
				A <= mem[rs];
				B <= mem[rt];
				joff <= imm;
			end
			else if(opcode == 6'b100011) begin//lw
				A <= mem[rs];
				B <= imm;
			end
			else begin
				invalid <= 1;
			end
			state <= 3;
		end
		else if(state == 3) begin
			if(opcode == 6'b0) begin
				if(func == 6'b010101 & ~invalid & rd != 5'b0) begin//addu
					mem[rd] <= res;
					pc <= pc + 1;
				end
				else if(func == 6'b101010 & ~invalid & rd != 5'b0) begin//slt
					if (A < B) begin
						mem[rd] <= 8'b1;
					end
					pc <= pc + 1;
				end
				else if(func == 6'b001000 & ~invalid) begin//jr
					pc <= jtar;
				end
			end
			else if(opcode == 6'b11 & ~invalid) begin//jal
				pc <= jtar;
			end
			else if(opcode == 6'b001001 & ~invalid & rt != 5'b0) begin//addiu
				mem[rt] <= res;
				pc <= pc + 1;
			end
			else if(opcode == 6'b000100 & ~invalid) begin//beq
				if (A == B) begin
					pc <= xjtar;
				end
			end
			else if(opcode == 6'b000101 & ~invalid) begin//bne
				if (A != B) begin
					pc <= xjtar;
				end
			end
			state <= 4;
		end
		else if(state == 4) begin
			if(opcode == 6'b100011) begin//lw
				mem[rt] <= dmem[res];
				pc <= pc + 1;
			end
			state <= 5;
		end
		else if(state == 5) begin
			if(pc == MAX_PC) begin
				state <= 6;
			end
			else begin
				state <= 0;
			end
		end
		else if(state == 6) begin
			LED <= mem[1];
			state <= 7;
		end
	end
	
endmodule
