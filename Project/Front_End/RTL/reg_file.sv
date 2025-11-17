`timescale 1ns / 1ps

module reg_file(
input logic clk,
input logic rst,
input logic [4:0] rs1,
input logic [4:0] rs2,
input logic [4:0] rsW,
input logic [31:0] dataW,
input logic RegWEn,
output logic [31:0] rf_out1,
output logic [31:0] rf_out2
    );
logic [31:0] mem [31:0];
 
assign rf_out1 = mem[rs1];
assign rf_out2 = mem[rs2];
    
    always_ff @(posedge clk)begin
	if (rst) begin
	for (int i = 0; i < 32; i++) begin
                mem[i] <= 32'b0;
            end

	end
        if(RegWEn && rsW != 5'd0)begin
            mem[rsW] <= dataW;
        end
    end     
   
endmodule
