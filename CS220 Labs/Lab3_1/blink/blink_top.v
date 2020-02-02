`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:   14:43:27 02/07/2018
// Design Name:   blink
// Module Name:   /media/smit/9CF6-B991/CS220 Labs/Lab3_1/blink/blink_top.v
// Project Name:  blink
// Target Device:  
// Tool versions:
// Description:
//
// Verilog Test Fixture created by ISE for module: blink
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
////////////////////////////////////////////////////////////////////////////////

module blink_top;

	// Inputs
	reg clk;

	// Outputs
	wire led0;

	// Instantiate the Unit Under Test (UUT)
	blink uut (
		.clk(clk),
		.led0(led0)
	);

	always @(led0) begin
		$display("<%d>: led0=%b",$time,led0);
	end

	//Module to generate clock with period 10 time units
	initial begin
		forever begin
			clk=0;
			#5
			clk=1;
			#5
			clk=0;
		end
	end
   initial begin
		#10000000
		$finish;
	end
endmodule
