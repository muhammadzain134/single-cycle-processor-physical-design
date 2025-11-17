`timescale 1ns / 1ps

module CORE(
    // Inputs
    input  logic clk,
    input  logic rst,
    input  logic [31:0] instr,
    input  logic [31:0] dataR,

    // Outputs 
    output logic [31:0] pc,
    output logic [31:0] alu_result,
    output logic [31:0] DataWM,
    output logic MemWrite,
    output logic MemRead
);

    // Internal Signals
    logic [31:0] pc_4, pc_target, pc_next, pc_jal;
    logic [1:0] ALUOp;
    logic RegWrite, ALUSrc, MemtoReg;
    logic [4:0] rs1, rs2, rd;
    logic [31:0] data1, data2, write_data;
    logic [31:0] imm_out;

    logic [3:0] alu_ctrl;
    logic [31:0] alu_in2, alu_in1;
    logic carry_out, Zero, Overflow, Negative;

    logic [6:0] opcode, funct7;
    logic [2:0] funct3;

    logic jump, jalr;
    logic branch, uimm, lui, PCSrc;

    // Branch Unit 
    branch_unit BU (
        .funct3(funct3),
        .PCSrc(PCSrc),
        .Zero(Zero),
        .Negative(Negative),
        .Overflow(Overflow),
        .carry_out(carry_out),
        .branch(branch)
    );

    // PC Next Logic
    assign pc_4 = pc + 4;
    assign pc_target = pc + imm_out;
    assign pc_jal = (jump || PCSrc ) ? pc_target : pc_4;
    assign pc_next = (jalr) ? (alu_result & ~32'd1) : pc_jal;

    program_counter PC (
        .clk(clk),
        .rst(rst),
        .pc_next(pc_next),
        .pc(pc)
    );

    // Instruction Partition
    assign opcode = instr[6:0];
    assign rd = instr[11:7];
    assign funct3 = instr[14:12];
    assign rs1 = instr[19:15];
    assign rs2 = instr[24:20];
    assign funct7 = instr[31:25];

    // Main Control
    main_control CTRL (
        .opcode(opcode),
        .ALUOp(ALUOp),
        .RegWrite(RegWrite),
        .ALUSrc(ALUSrc),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .MemtoReg(MemtoReg),
        .jump(jump),
        .jalr(jalr),
        .branch(branch),
        .uimm(uimm),
        .lui(lui)
    );

    // Register File 
    reg_file RF (
        .clk(clk),
	.rst(rst),
        .rs1(rs1),
        .rs2(rs2),
        .rsW(rd),
        .dataW(write_data),
        .RegWEn(RegWrite),
        .rf_out1(data1),
        .rf_out2(data2)
    );

    // Immediate Generator 
    imm_gen IMM (
        .instr(instr),
        .opcode(opcode),
        .imm_out(imm_out)
    );

    // ALU Control
    ALU_control ALUCTRL (
        .funct7(funct7),
        .funct3(funct3),       
        .ALUOp(ALUOp),
        .control_sig(alu_ctrl)
    );

    // ALU Inputs 
    assign alu_in2 = (ALUSrc) ? imm_out : data2;
    assign alu_in1 = (uimm) ? pc : data1;
    // Output to write in memeory
    assign DataWM  = data2;

    // ALU 
    alu_logic ALU (
        .alu_in1(alu_in1),
        .alu_in2(alu_in2),
        .alu_op(alu_ctrl),
        .alu_result(alu_result),
        .carry_out(carry_out),
        .Zero(Zero),
        .Negative(Negative),
        .Overflow(Overflow)
    );

    // Write-back selection 
    assign write_data = jump ? pc_4 :
                        MemtoReg ? dataR :
                        lui ? imm_out :
                        alu_result;

endmodule
