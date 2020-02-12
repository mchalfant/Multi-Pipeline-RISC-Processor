`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:43:07 03/14/2016 
// Design Name: 
// Module Name:    mux_2_to_1 
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
module mux_2_bit(Sel, In0, In1, Out);
	input [31:0] In0, In1;
	input Sel;
	output reg [31:0] Out;
	
	always @ (*)
		case(Sel)
			0: Out <= In0;
			1: Out <= In1;
			default: Out <= In0;
		endcase

endmodule
