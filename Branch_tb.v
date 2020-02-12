`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:47:37 03/16/2016
// Design Name:   Single_pipeline_branch
// Module Name:   C:/.Xilinx/CECS_440_project_7/Branch_tb.v
// Project Name:  CECS_440_project_7
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Single_pipeline_branch
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Branch_tb;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	Single_pipeline_branch uut (
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		forever #20 clk = ~clk;
		end
		
	initial begin	

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

