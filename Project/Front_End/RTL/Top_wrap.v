`timescale 1ns / 1ps

module Top_wrap (
    input  [31:0] instr,   // instruction input
    input  [31:0] dataR,   // data read input
    input  clk,            // clock
    input  rst,            // reset
    output [31:0] pc,      // program counter output
    output [31:0] alu_result, // ALU result
    output [31:0] DataWM,     // data to write to memory
    output MemWrite,          // memory write enable
    output MemRead            // memory read enable
);

//======================================================================
// Internal Nets (Connections Between Pads and Core)
//======================================================================
wire [31:0] w_instr;
wire [31:0] w_dataR;
wire [31:0] w_pc;
wire [31:0] w_alu_result;
wire [31:0] w_DataWM;
wire w_MemWrite, w_MemRead;
wire w_clk, w_rst;

//======================================================================
// Core Instantiation
//======================================================================
CORE uut (
    .clk(w_clk),
    .rst(w_rst),
    .instr(w_instr),
    .dataR(w_dataR),
    .pc(w_pc),
    .alu_result(w_alu_result),
    .DataWM(w_DataWM),
    .MemWrite(w_MemWrite),
    .MemRead(w_MemRead)
);

//======================================================================
// Clock and Reset Pad Connections
//======================================================================
// Clock Pad (input buffer)
PDXOE3DG clk_inst (.E(1'b1), .XIN(clk), .XOUT(), .XC(w_clk));

// Reset Pad (input buffer)
PDDW16DGZ rst_inst (.OEN(1'b1), .I(1'b1), .PAD(rst), .REN(1'b1), .C(w_rst));

//======================================================================
// Input Pads for instr[31:0]
//======================================================================
PDDW16DGZ instr_inst0  (.OEN(1'b1), .I(1'b1), .PAD(instr[0]),  .REN(1'b1), .C(w_instr[0]));
PDDW16DGZ instr_inst1  (.OEN(1'b1), .I(1'b1), .PAD(instr[1]),  .REN(1'b1), .C(w_instr[1]));
PDDW16DGZ instr_inst2  (.OEN(1'b1), .I(1'b1), .PAD(instr[2]),  .REN(1'b1), .C(w_instr[2]));
PDDW16DGZ instr_inst3  (.OEN(1'b1), .I(1'b1), .PAD(instr[3]),  .REN(1'b1), .C(w_instr[3]));
PDDW16DGZ instr_inst4  (.OEN(1'b1), .I(1'b1), .PAD(instr[4]),  .REN(1'b1), .C(w_instr[4]));
PDDW16DGZ instr_inst5  (.OEN(1'b1), .I(1'b1), .PAD(instr[5]),  .REN(1'b1), .C(w_instr[5]));
PDDW16DGZ instr_inst6  (.OEN(1'b1), .I(1'b1), .PAD(instr[6]),  .REN(1'b1), .C(w_instr[6]));
PDDW16DGZ instr_inst7  (.OEN(1'b1), .I(1'b1), .PAD(instr[7]),  .REN(1'b1), .C(w_instr[7]));
PDDW16DGZ instr_inst8  (.OEN(1'b1), .I(1'b1), .PAD(instr[8]),  .REN(1'b1), .C(w_instr[8]));
PDDW16DGZ instr_inst9  (.OEN(1'b1), .I(1'b1), .PAD(instr[9]),  .REN(1'b1), .C(w_instr[9]));
PDDW16DGZ instr_inst10 (.OEN(1'b1), .I(1'b1), .PAD(instr[10]), .REN(1'b1), .C(w_instr[10]));
PDDW16DGZ instr_inst11 (.OEN(1'b1), .I(1'b1), .PAD(instr[11]), .REN(1'b1), .C(w_instr[11]));
PDDW16DGZ instr_inst12 (.OEN(1'b1), .I(1'b1), .PAD(instr[12]), .REN(1'b1), .C(w_instr[12]));
PDDW16DGZ instr_inst13 (.OEN(1'b1), .I(1'b1), .PAD(instr[13]), .REN(1'b1), .C(w_instr[13]));
PDDW16DGZ instr_inst14 (.OEN(1'b1), .I(1'b1), .PAD(instr[14]), .REN(1'b1), .C(w_instr[14]));
PDDW16DGZ instr_inst15 (.OEN(1'b1), .I(1'b1), .PAD(instr[15]), .REN(1'b1), .C(w_instr[15]));
PDDW16DGZ instr_inst16 (.OEN(1'b1), .I(1'b1), .PAD(instr[16]), .REN(1'b1), .C(w_instr[16]));
PDDW16DGZ instr_inst17 (.OEN(1'b1), .I(1'b1), .PAD(instr[17]), .REN(1'b1), .C(w_instr[17]));
PDDW16DGZ instr_inst18 (.OEN(1'b1), .I(1'b1), .PAD(instr[18]), .REN(1'b1), .C(w_instr[18]));
PDDW16DGZ instr_inst19 (.OEN(1'b1), .I(1'b1), .PAD(instr[19]), .REN(1'b1), .C(w_instr[19]));
PDDW16DGZ instr_inst20 (.OEN(1'b1), .I(1'b1), .PAD(instr[20]), .REN(1'b1), .C(w_instr[20]));
PDDW16DGZ instr_inst21 (.OEN(1'b1), .I(1'b1), .PAD(instr[21]), .REN(1'b1), .C(w_instr[21]));
PDDW16DGZ instr_inst22 (.OEN(1'b1), .I(1'b1), .PAD(instr[22]), .REN(1'b1), .C(w_instr[22]));
PDDW16DGZ instr_inst23 (.OEN(1'b1), .I(1'b1), .PAD(instr[23]), .REN(1'b1), .C(w_instr[23]));
PDDW16DGZ instr_inst24 (.OEN(1'b1), .I(1'b1), .PAD(instr[24]), .REN(1'b1), .C(w_instr[24]));
PDDW16DGZ instr_inst25 (.OEN(1'b1), .I(1'b1), .PAD(instr[25]), .REN(1'b1), .C(w_instr[25]));
PDDW16DGZ instr_inst26 (.OEN(1'b1), .I(1'b1), .PAD(instr[26]), .REN(1'b1), .C(w_instr[26]));
PDDW16DGZ instr_inst27 (.OEN(1'b1), .I(1'b1), .PAD(instr[27]), .REN(1'b1), .C(w_instr[27]));
PDDW16DGZ instr_inst28 (.OEN(1'b1), .I(1'b1), .PAD(instr[28]), .REN(1'b1), .C(w_instr[28]));
PDDW16DGZ instr_inst29 (.OEN(1'b1), .I(1'b1), .PAD(instr[29]), .REN(1'b1), .C(w_instr[29]));
PDDW16DGZ instr_inst30 (.OEN(1'b1), .I(1'b1), .PAD(instr[30]), .REN(1'b1), .C(w_instr[30]));
PDDW16DGZ instr_inst31 (.OEN(1'b1), .I(1'b1), .PAD(instr[31]), .REN(1'b1), .C(w_instr[31]));

//======================================================================
// Input Pads for dataR[31:0]
//======================================================================
PDDW16DGZ dataR_inst0  (.OEN(1'b1), .I(1'b1), .PAD(dataR[0]),  .REN(1'b1), .C(w_dataR[0]));
PDDW16DGZ dataR_inst1  (.OEN(1'b1), .I(1'b1), .PAD(dataR[1]),  .REN(1'b1), .C(w_dataR[1]));
PDDW16DGZ dataR_inst2  (.OEN(1'b1), .I(1'b1), .PAD(dataR[2]),  .REN(1'b1), .C(w_dataR[2]));
PDDW16DGZ dataR_inst3  (.OEN(1'b1), .I(1'b1), .PAD(dataR[3]),  .REN(1'b1), .C(w_dataR[3]));
PDDW16DGZ dataR_inst4  (.OEN(1'b1), .I(1'b1), .PAD(dataR[4]),  .REN(1'b1), .C(w_dataR[4]));
PDDW16DGZ dataR_inst5  (.OEN(1'b1), .I(1'b1), .PAD(dataR[5]),  .REN(1'b1), .C(w_dataR[5]));
PDDW16DGZ dataR_inst6  (.OEN(1'b1), .I(1'b1), .PAD(dataR[6]),  .REN(1'b1), .C(w_dataR[6]));
PDDW16DGZ dataR_inst7  (.OEN(1'b1), .I(1'b1), .PAD(dataR[7]),  .REN(1'b1), .C(w_dataR[7]));
PDDW16DGZ dataR_inst8  (.OEN(1'b1), .I(1'b1), .PAD(dataR[8]),  .REN(1'b1), .C(w_dataR[8]));
PDDW16DGZ dataR_inst9  (.OEN(1'b1), .I(1'b1), .PAD(dataR[9]),  .REN(1'b1), .C(w_dataR[9]));
PDDW16DGZ dataR_inst10 (.OEN(1'b1), .I(1'b1), .PAD(dataR[10]), .REN(1'b1), .C(w_dataR[10]));
PDDW16DGZ dataR_inst11 (.OEN(1'b1), .I(1'b1), .PAD(dataR[11]), .REN(1'b1), .C(w_dataR[11]));
PDDW16DGZ dataR_inst12 (.OEN(1'b1), .I(1'b1), .PAD(dataR[12]), .REN(1'b1), .C(w_dataR[12]));
PDDW16DGZ dataR_inst13 (.OEN(1'b1), .I(1'b1), .PAD(dataR[13]), .REN(1'b1), .C(w_dataR[13]));
PDDW16DGZ dataR_inst14 (.OEN(1'b1), .I(1'b1), .PAD(dataR[14]), .REN(1'b1), .C(w_dataR[14]));
PDDW16DGZ dataR_inst15 (.OEN(1'b1), .I(1'b1), .PAD(dataR[15]), .REN(1'b1), .C(w_dataR[15]));
PDDW16DGZ dataR_inst16 (.OEN(1'b1), .I(1'b1), .PAD(dataR[16]), .REN(1'b1), .C(w_dataR[16]));
PDDW16DGZ dataR_inst17 (.OEN(1'b1), .I(1'b1), .PAD(dataR[17]), .REN(1'b1), .C(w_dataR[17]));
PDDW16DGZ dataR_inst18 (.OEN(1'b1), .I(1'b1), .PAD(dataR[18]), .REN(1'b1), .C(w_dataR[18]));
PDDW16DGZ dataR_inst19 (.OEN(1'b1), .I(1'b1), .PAD(dataR[19]), .REN(1'b1), .C(w_dataR[19]));
PDDW16DGZ dataR_inst20 (.OEN(1'b1), .I(1'b1), .PAD(dataR[20]), .REN(1'b1), .C(w_dataR[20]));
PDDW16DGZ dataR_inst21 (.OEN(1'b1), .I(1'b1), .PAD(dataR[21]), .REN(1'b1), .C(w_dataR[21]));
PDDW16DGZ dataR_inst22 (.OEN(1'b1), .I(1'b1), .PAD(dataR[22]), .REN(1'b1), .C(w_dataR[22]));
PDDW16DGZ dataR_inst23 (.OEN(1'b1), .I(1'b1), .PAD(dataR[23]), .REN(1'b1), .C(w_dataR[23]));
PDDW16DGZ dataR_inst24 (.OEN(1'b1), .I(1'b1), .PAD(dataR[24]), .REN(1'b1), .C(w_dataR[24]));
PDDW16DGZ dataR_inst25 (.OEN(1'b1), .I(1'b1), .PAD(dataR[25]), .REN(1'b1), .C(w_dataR[25]));
PDDW16DGZ dataR_inst26 (.OEN(1'b1), .I(1'b1), .PAD(dataR[26]), .REN(1'b1), .C(w_dataR[26]));
PDDW16DGZ dataR_inst27 (.OEN(1'b1), .I(1'b1), .PAD(dataR[27]), .REN(1'b1), .C(w_dataR[27]));
PDDW16DGZ dataR_inst28 (.OEN(1'b1), .I(1'b1), .PAD(dataR[28]), .REN(1'b1), .C(w_dataR[28]));
PDDW16DGZ dataR_inst29 (.OEN(1'b1), .I(1'b1), .PAD(dataR[29]), .REN(1'b1), .C(w_dataR[29]));
PDDW16DGZ dataR_inst30 (.OEN(1'b1), .I(1'b1), .PAD(dataR[30]), .REN(1'b1), .C(w_dataR[30]));
PDDW16DGZ dataR_inst31 (.OEN(1'b1), .I(1'b1), .PAD(dataR[31]), .REN(1'b1), .C(w_dataR[31]));

//======================================================================
// Output Pads for pc[31:0]
//======================================================================
PDDW16DGZ pc_inst0  (.OEN(1'b0), .I(w_pc[0]),  .PAD(pc[0]),  .REN(), .C());
PDDW16DGZ pc_inst1  (.OEN(1'b0), .I(w_pc[1]),  .PAD(pc[1]),  .REN(), .C());
PDDW16DGZ pc_inst2  (.OEN(1'b0), .I(w_pc[2]),  .PAD(pc[2]),  .REN(), .C());
PDDW16DGZ pc_inst3  (.OEN(1'b0), .I(w_pc[3]),  .PAD(pc[3]),  .REN(), .C());
PDDW16DGZ pc_inst4  (.OEN(1'b0), .I(w_pc[4]),  .PAD(pc[4]),  .REN(), .C());
PDDW16DGZ pc_inst5  (.OEN(1'b0), .I(w_pc[5]),  .PAD(pc[5]),  .REN(), .C());
PDDW16DGZ pc_inst6  (.OEN(1'b0), .I(w_pc[6]),  .PAD(pc[6]),  .REN(), .C());
PDDW16DGZ pc_inst7  (.OEN(1'b0), .I(w_pc[7]),  .PAD(pc[7]),  .REN(), .C());
PDDW16DGZ pc_inst8  (.OEN(1'b0), .I(w_pc[8]),  .PAD(pc[8]),  .REN(), .C());
PDDW16DGZ pc_inst9  (.OEN(1'b0), .I(w_pc[9]),  .PAD(pc[9]),  .REN(), .C());
PDDW16DGZ pc_inst10  (.OEN(1'b0), .I(w_pc[10]),  .PAD(pc[10]),  .REN(), .C());
PDDW16DGZ pc_inst11  (.OEN(1'b0), .I(w_pc[11]),  .PAD(pc[11]),  .REN(), .C());
PDDW16DGZ pc_inst12  (.OEN(1'b0), .I(w_pc[12]),  .PAD(pc[12]),  .REN(), .C());
PDDW16DGZ pc_inst13  (.OEN(1'b0), .I(w_pc[13]),  .PAD(pc[13]),  .REN(), .C());
PDDW16DGZ pc_inst14  (.OEN(1'b0), .I(w_pc[14]),  .PAD(pc[14]),  .REN(), .C());
PDDW16DGZ pc_inst15  (.OEN(1'b0), .I(w_pc[15]),  .PAD(pc[15]),  .REN(), .C());
PDDW16DGZ pc_inst16  (.OEN(1'b0), .I(w_pc[16]),  .PAD(pc[16]),  .REN(), .C());
PDDW16DGZ pc_inst17  (.OEN(1'b0), .I(w_pc[17]),  .PAD(pc[17]),  .REN(), .C());
PDDW16DGZ pc_inst18  (.OEN(1'b0), .I(w_pc[18]),  .PAD(pc[18]),  .REN(), .C());
PDDW16DGZ pc_inst19  (.OEN(1'b0), .I(w_pc[19]),  .PAD(pc[19]),  .REN(), .C());
PDDW16DGZ pc_inst20  (.OEN(1'b0), .I(w_pc[20]),  .PAD(pc[20]),  .REN(), .C());
PDDW16DGZ pc_inst21  (.OEN(1'b0), .I(w_pc[21]),  .PAD(pc[21]),  .REN(), .C());
PDDW16DGZ pc_inst22  (.OEN(1'b0), .I(w_pc[22]),  .PAD(pc[22]),  .REN(), .C());
PDDW16DGZ pc_inst23  (.OEN(1'b0), .I(w_pc[23]),  .PAD(pc[23]),  .REN(), .C());
PDDW16DGZ pc_inst24  (.OEN(1'b0), .I(w_pc[24]),  .PAD(pc[24]),  .REN(), .C());
PDDW16DGZ pc_inst25  (.OEN(1'b0), .I(w_pc[25]),  .PAD(pc[25]),  .REN(), .C());
PDDW16DGZ pc_inst26  (.OEN(1'b0), .I(w_pc[26]),  .PAD(pc[26]),  .REN(), .C());
PDDW16DGZ pc_inst27  (.OEN(1'b0), .I(w_pc[27]),  .PAD(pc[27]),  .REN(), .C());
PDDW16DGZ pc_inst28  (.OEN(1'b0), .I(w_pc[28]),  .PAD(pc[28]),  .REN(), .C());
PDDW16DGZ pc_inst29  (.OEN(1'b0), .I(w_pc[29]),  .PAD(pc[29]),  .REN(), .C());
PDDW16DGZ pc_inst30  (.OEN(1'b0), .I(w_pc[30]),  .PAD(pc[30]),  .REN(), .C());
PDDW16DGZ pc_inst31  (.OEN(1'b0), .I(w_pc[31]),  .PAD(pc[31]),  .REN(), .C());

//======================================================================
// Output Pads for alu_result[31:0]
//======================================================================
PDDW16DGZ alu_inst0  (.OEN(1'b0), .I(w_alu_result[0]),  .PAD(alu_result[0]),  .REN(), .C());
PDDW16DGZ alu_inst1  (.OEN(1'b0), .I(w_alu_result[1]),  .PAD(alu_result[1]),  .REN(), .C());
PDDW16DGZ alu_inst2  (.OEN(1'b0), .I(w_alu_result[2]),  .PAD(alu_result[2]),  .REN(), .C());
PDDW16DGZ alu_inst3  (.OEN(1'b0), .I(w_alu_result[3]),  .PAD(alu_result[3]),  .REN(), .C());
PDDW16DGZ alu_inst4  (.OEN(1'b0), .I(w_alu_result[4]),  .PAD(alu_result[4]),  .REN(), .C());
PDDW16DGZ alu_inst5  (.OEN(1'b0), .I(w_alu_result[5]),  .PAD(alu_result[5]),  .REN(), .C());
PDDW16DGZ alu_inst6  (.OEN(1'b0), .I(w_alu_result[6]),  .PAD(alu_result[6]),  .REN(), .C());
PDDW16DGZ alu_inst7  (.OEN(1'b0), .I(w_alu_result[7]),  .PAD(alu_result[7]),  .REN(), .C());
PDDW16DGZ alu_inst8  (.OEN(1'b0), .I(w_alu_result[8]),  .PAD(alu_result[8]),  .REN(), .C());
PDDW16DGZ alu_inst9  (.OEN(1'b0), .I(w_alu_result[9]),  .PAD(alu_result[9]),  .REN(), .C());
PDDW16DGZ alu_inst10 (.OEN(1'b0), .I(w_alu_result[10]), .PAD(alu_result[10]), .REN(), .C());
PDDW16DGZ alu_inst11 (.OEN(1'b0), .I(w_alu_result[11]), .PAD(alu_result[11]), .REN(), .C());
PDDW16DGZ alu_inst12 (.OEN(1'b0), .I(w_alu_result[12]), .PAD(alu_result[12]), .REN(), .C());
PDDW16DGZ alu_inst13 (.OEN(1'b0), .I(w_alu_result[13]), .PAD(alu_result[13]), .REN(), .C());
PDDW16DGZ alu_inst14 (.OEN(1'b0), .I(w_alu_result[14]), .PAD(alu_result[14]), .REN(), .C());
PDDW16DGZ alu_inst15 (.OEN(1'b0), .I(w_alu_result[15]), .PAD(alu_result[15]), .REN(), .C());
PDDW16DGZ alu_inst16 (.OEN(1'b0), .I(w_alu_result[16]), .PAD(alu_result[16]), .REN(), .C());
PDDW16DGZ alu_inst17 (.OEN(1'b0), .I(w_alu_result[17]), .PAD(alu_result[17]), .REN(), .C());
PDDW16DGZ alu_inst18 (.OEN(1'b0), .I(w_alu_result[18]), .PAD(alu_result[18]), .REN(), .C());
PDDW16DGZ alu_inst19 (.OEN(1'b0), .I(w_alu_result[19]), .PAD(alu_result[19]), .REN(), .C());
PDDW16DGZ alu_inst20 (.OEN(1'b0), .I(w_alu_result[20]), .PAD(alu_result[20]), .REN(), .C());
PDDW16DGZ alu_inst21 (.OEN(1'b0), .I(w_alu_result[21]), .PAD(alu_result[21]), .REN(), .C());
PDDW16DGZ alu_inst22 (.OEN(1'b0), .I(w_alu_result[22]), .PAD(alu_result[22]), .REN(), .C());
PDDW16DGZ alu_inst23 (.OEN(1'b0), .I(w_alu_result[23]), .PAD(alu_result[23]), .REN(), .C());
PDDW16DGZ alu_inst24 (.OEN(1'b0), .I(w_alu_result[24]), .PAD(alu_result[24]), .REN(), .C());
PDDW16DGZ alu_inst25 (.OEN(1'b0), .I(w_alu_result[25]), .PAD(alu_result[25]), .REN(), .C());
PDDW16DGZ alu_inst26 (.OEN(1'b0), .I(w_alu_result[26]), .PAD(alu_result[26]), .REN(), .C());
PDDW16DGZ alu_inst27 (.OEN(1'b0), .I(w_alu_result[27]), .PAD(alu_result[27]), .REN(), .C());
PDDW16DGZ alu_inst28 (.OEN(1'b0), .I(w_alu_result[28]), .PAD(alu_result[28]), .REN(), .C());
PDDW16DGZ alu_inst29 (.OEN(1'b0), .I(w_alu_result[29]), .PAD(alu_result[29]), .REN(), .C());
PDDW16DGZ alu_inst30 (.OEN(1'b0), .I(w_alu_result[30]), .PAD(alu_result[30]), .REN(), .C());
PDDW16DGZ alu_inst31 (.OEN(1'b0), .I(w_alu_result[31]), .PAD(alu_result[31]), .REN(), .C());

//======================================================================
// Output Pads for DataWM[31:0]
//======================================================================
PDDW16DGZ DataWM_inst0  (.OEN(1'b0), .I(w_DataWM[0]),  .PAD(DataWM[0]),  .REN(), .C());
PDDW16DGZ DataWM_inst1  (.OEN(1'b0), .I(w_DataWM[1]),  .PAD(DataWM[1]),  .REN(), .C());
PDDW16DGZ DataWM_inst2  (.OEN(1'b0), .I(w_DataWM[2]),  .PAD(DataWM[2]),  .REN(), .C());
PDDW16DGZ DataWM_inst3  (.OEN(1'b0), .I(w_DataWM[3]),  .PAD(DataWM[3]),  .REN(), .C());
PDDW16DGZ DataWM_inst4  (.OEN(1'b0), .I(w_DataWM[4]),  .PAD(DataWM[4]),  .REN(), .C());
PDDW16DGZ DataWM_inst5  (.OEN(1'b0), .I(w_DataWM[5]),  .PAD(DataWM[5]),   .REN(), .C());
PDDW16DGZ DataWM_inst6  (.OEN(1'b0), .I(w_DataWM[6]),  .PAD(DataWM[6]),  .REN(), .C());
PDDW16DGZ DataWM_inst7  (.OEN(1'b0), .I(w_DataWM[7]),  .PAD(DataWM[7]),  .REN(), .C());
PDDW16DGZ DataWM_inst8  (.OEN(1'b0), .I(w_DataWM[8]),  .PAD(DataWM[8]),  .REN(), .C());
PDDW16DGZ DataWM_inst9  (.OEN(1'b0), .I(w_DataWM[9]),  .PAD(DataWM[9]),  .REN(), .C());
PDDW16DGZ DataWM_inst10  (.OEN(1'b0), .I(w_DataWM[10]),  .PAD(DataWM[10]),  .REN(), .C());
PDDW16DGZ DataWM_inst11  (.OEN(1'b0), .I(w_DataWM[11]),  .PAD(DataWM[11]),  .REN(), .C());
PDDW16DGZ DataWM_inst12  (.OEN(1'b0), .I(w_DataWM[12]),  .PAD(DataWM[12]),  .REN(), .C());
PDDW16DGZ DataWM_inst13  (.OEN(1'b0), .I(w_DataWM[13]),  .PAD(DataWM[13]),  .REN(), .C());
PDDW16DGZ DataWM_inst14  (.OEN(1'b0), .I(w_DataWM[14]),  .PAD(DataWM[14]),  .REN(), .C());
PDDW16DGZ DataWM_inst15  (.OEN(1'b0), .I(w_DataWM[15]),  .PAD(DataWM[15]),  .REN(), .C());
PDDW16DGZ DataWM_inst16  (.OEN(1'b0), .I(w_DataWM[16]),  .PAD(DataWM[16]),  .REN(), .C());
PDDW16DGZ DataWM_inst17  (.OEN(1'b0), .I(w_DataWM[17]),  .PAD(DataWM[17]),  .REN(), .C());
PDDW16DGZ DataWM_inst18  (.OEN(1'b0), .I(w_DataWM[18]),  .PAD(DataWM[18]),  .REN(), .C());
PDDW16DGZ DataWM_inst19  (.OEN(1'b0), .I(w_DataWM[19]),  .PAD(DataWM[19]),  .REN(), .C());
PDDW16DGZ DataWM_inst20  (.OEN(1'b0), .I(w_DataWM[20]),  .PAD(DataWM[20]),  .REN(), .C());
PDDW16DGZ DataWM_inst21  (.OEN(1'b0), .I(w_DataWM[21]),  .PAD(DataWM[21]),  .REN(), .C());
PDDW16DGZ DataWM_inst22  (.OEN(1'b0), .I(w_DataWM[22]),  .PAD(DataWM[22]),  .REN(), .C());
PDDW16DGZ DataWM_inst23  (.OEN(1'b0), .I(w_DataWM[23]),  .PAD(DataWM[23]),  .REN(), .C());
PDDW16DGZ DataWM_inst24  (.OEN(1'b0), .I(w_DataWM[24]),  .PAD(DataWM[24]),  .REN(), .C());
PDDW16DGZ DataWM_inst25  (.OEN(1'b0), .I(w_DataWM[25]),  .PAD(DataWM[25]),  .REN(), .C());
PDDW16DGZ DataWM_inst26  (.OEN(1'b0), .I(w_DataWM[26]),  .PAD(DataWM[26]),  .REN(), .C());
PDDW16DGZ DataWM_inst27  (.OEN(1'b0), .I(w_DataWM[27]),  .PAD(DataWM[27]),  .REN(), .C());
PDDW16DGZ DataWM_inst28  (.OEN(1'b0), .I(w_DataWM[28]),  .PAD(DataWM[28]),  .REN(), .C());
PDDW16DGZ DataWM_inst29  (.OEN(1'b0), .I(w_DataWM[29]),  .PAD(DataWM[29]),  .REN(), .C());
PDDW16DGZ DataWM_inst30  (.OEN(1'b0), .I(w_DataWM[30]),  .PAD(DataWM[30]),  .REN(), .C());
PDDW16DGZ DataWM_inst31  (.OEN(1'b0), .I(w_DataWM[31]),  .PAD(DataWM[31]),  .REN(), .C());


//======================================================================
// Output Pads for MemWrite and MemRead
//======================================================================
PDDW16DGZ MemWrite_inst (.OEN(1'b0), .I(w_MemWrite), .PAD(MemWrite), .REN(), .C());
PDDW16DGZ MemRead_inst  (.OEN(1'b0), .I(w_MemRead),  .PAD(MemRead),  .REN(), .C());

endmodule

