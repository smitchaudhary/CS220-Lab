`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:21:57 03/28/2018
// Design Name:
// Module Name:    parity
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
module parity(bus, par);
	input [7:0]bus;

	output wire par;

	assign par = bus[0] ^ bus[1] ^ bus[2] ^ bus[3] ^ bus[4] ^ bus[5] ^ bus[6] ^ bus[7];

endmodule
