`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   16:25:46 01/31/2018
// Design Name:   eight_bit_comp
// Module Name:   /media/smit/9CF6-B991/CS220 Labs/Lab2_2/eight_bit_comp/eight_bit_comp_top.v
// Project Name:  eight_bit_comp
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: eight_bit_comp
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module eight_bit_comp_top;

	// Inputs
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;
	reg [3:0] Y;

	// Outputs
	wire l;
	wire g;
	wire eq;

	// Instantiate the Unit Under Test (UUT)
	eight_bit_comp uut (
		.PB1(PB1),
		.PB2(PB2),
		.PB3(PB3),
		.PB4(PB4),
		.Y(Y),
		.l(l),
		.g(g),
		.eq(eq)
	);

	initial begin
		// Initialize Inputs
		PB1=1;Y=4'b1000;
		#10
		PB2=1;Y=4'b1110;
		#10
		PB3=1;Y=4'b0010;
		#10
		PB4=1;Y=4'b1110;
	end

	initial begin
		#100
		$finish;
	end

endmodule
