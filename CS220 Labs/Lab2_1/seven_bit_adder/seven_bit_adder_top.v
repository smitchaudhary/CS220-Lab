`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   14:50:52 01/31/2018
// Design Name:   seven_bit_adder
// Module Name:   /media/smit/9CF6-B991/CS220 Labs/Lab2_1/seven_bit_adder/seven_bit_adder_top.v
// Project Name:  seven_bit_adder
// Target Device:
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: seven_bit_adder
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module seven_bit_adder_top;

	// Inputs
	reg PB1;
	reg PB2;
	reg PB3;
	reg PB4;
	reg [3:0] Y;

	// Outputs
	wire [6:0] sum;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	seven_bit_adder uut (
		.PB1(PB1),
		.PB2(PB2),
		.PB3(PB3),
		.PB4(PB4),
		.Y(Y),
		.sum(sum),
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		PB1=1;Y=4'b1000;
		#10
		PB2=1;Y=4'b0100;
		#10
		PB3=1;Y=4'b0010;
		#10
		PB4=1;Y=4'b0110;
	end

	initial begin
		#100
		$finish;
	end

endmodule
