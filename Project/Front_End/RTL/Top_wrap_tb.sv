`timescale 1ns / 1ps

module Top_wrap_tb();
    logic clk;
    logic rst;
    logic [31:0] instr;
    logic [31:0] dataR;
    logic [31:0] pc;
    logic [31:0] alu_result;
    logic [31:0] DataWM;
    logic MemWrite;
    logic MemRead;

    CORE uut (
        .clk(clk),
        .rst(rst),
        .instr(instr),
        .dataR(dataR),
        .pc(pc),
        .alu_result(alu_result),
        .DataWM(DataWM),
        .MemWrite(MemWrite),
        .MemRead(MemRead)
    );

`ifdef SDF_TEST
initial
begin
$sdf_annotate("/home/cc/Physical_Design/Project/Front_End/out/CORE_map.sdf", Top_wrap_tb.uut, "sdf.log", "MAXIMUM");
end
`endif

    always #5 clk = ~clk;

    // Instruction Memory
    logic [31:0] imem [0:31];   // 32-word instruction memory

    initial begin
        clk   = 0;
        rst   = 1;
        instr = 0;
        dataR = 0;

        // preload instructions
        // addi x1, x0, 5     -> x1 = 5
        imem[0] = 32'h00500093;
        // addi x2, x0, 10    -> x2 = 10
        imem[1] = 32'h00a00113;
        // add  x3, x1, x2    -> x3 = 15
        imem[2] = 32'h002081b3;
        // sw   x3, 0(x0)     -> MEM[0] = x3
        imem[3] = 32'h00302023;
        // lw   x4, 0(x0)     -> x4 = MEM[0]
        imem[4] = 32'h00002283;

        // release reset
        #12 rst = 0;

        
        #200 $finish;
    end

    // Instruction instructions 
    always @(posedge clk) begin
        if (!rst) begin
            instr <= imem[pc[6:2]];  // use word address from PC
        end
    end

    // Hardcoded data memory 
    always @(*) begin
        if (MemRead) begin
            dataR = 32'hABCD1234;   // return this value on loads
        end else begin
            dataR = 32'b0;
        end
    end


endmodule
