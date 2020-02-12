`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:45:41 03/14/2016 
// Design Name: 
// Module Name:    Single_pipelie_branch 
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
module Single_pipeline_branch(clk);
	input clk;
	
	wire signal;
	wire Zero;
	wire RegDest;
	wire RegWrite;
	wire [1:0] ALUOp;
	wire [4:0] out_mux_1;
	
	wire [31:0] PCIn;
	wire [31:0] PCOut;
	wire [31:0] Instruction;
	wire [31:0] A, B;
	wire [3:0] ALUCtrl;
	
	wire [31:0] out_mux_2,out_mux_3;
	wire [31:0] ALUOut, extended;
    wire [31:0] ReadData;
	wire [31:0] shifted;	
	wire [31:0] Location;
	
PC PC(.clk(clk), .PCIn(PCIn), .PCOut(PCOut));	
Instruction_memory IM (.PC(PCOut), .Instruction(Instruction));
Instruction_decoder ID(.OPCode(Instruction[31:26]), .RegDest(RegDest), .ALUSrc(ALUSrc), .MemtoReg(MemtoReg),
								.RegWrite(RegWrite), .MemRead(MemRead), .MemWrite(MemWrite), .ALUOp(ALUOp));
mux_5_bit RD(.In0(Instruction[20:16]), .In1(Instruction[15:11]), .Sel(RegDest), .Out(out_mux_1));
Reg_File RF( .clk(clk), .Read1(Instruction[25:21]), .Read2(Instruction[20:16]), .WriteReg(out_mux_1),
             .WriteData(out_mux_3), .RegWrite(RegWrite), .Data1(A), .Data2(B));
mux_32_bit ALUselB(.In0(B), .In1(extended), .Sel(ALUSrc), .Out(out_mux_2));				 
ALU ALU(.ALUCtrl(ALUCtrl), .A(A), .B(out_mux_2), .ALUOut(ALUOut), .Zero(Zero));
Control_Unit CU(.ALUOp(ALUOp),.FuncCode(Instruction[5:0]), .ALUCtrl(ALUCtrl));
Data_memory DM(.clk(clk), .Address(ALUOut), .WriteData(B), .MemRead(MemRead), .MemWrite(MemWrite), .ReadData(ReadData));
sign_extender SE(.clk(clk), .extend(Instruction[15:0]), .extended(extended));
Shift_Left_2 SL2(.target(extended), .shifted(shifted));
Branch_Adder BA(.PCOut(PCOut), .Shifted(shifted), .Location(Location));
BEQ BEQ(.Branch(ALUOp[0]), .Zero(Zero), .signal(signal));
mux_2_bit M2B(.Sel(signal), .In0(PCOut), .In1(Location), .Out(PCIn));
mux_32_bit MTG(.In0(ALUOut), .In1(ReadData), .Sel(MemtoReg), .Out(out_mux_3));



endmodule
