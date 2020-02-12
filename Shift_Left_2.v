`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:32:05 03/14/2016 
// Design Name: 
// Module Name:    Shift_Left_2 
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
module Shift_Left_2(target, shifted);
	input [31:0] target;
	output wire [31:0] shifted;
	
	assign shifted = target << 2;


endmodule
