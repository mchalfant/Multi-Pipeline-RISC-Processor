`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:40:25 03/14/2016 
// Design Name: 
// Module Name:    BEQ 
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
module BEQ(Branch, Zero, signal);
	input Branch, Zero;
	output wire signal;
	
	assign signal = Branch & Zero;

endmodule
