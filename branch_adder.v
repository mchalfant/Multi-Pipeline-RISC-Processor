`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:36:47 03/14/2016 
// Design Name: 
// Module Name:    branch_adder 
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
module Branch_Adder(PCOut, Shifted, Location);
	input [31:0] PCOut, Shifted;
	output wire [31:0] Location;
	
	assign Location = PCOut + Shifted;


endmodule
