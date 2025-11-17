`timescale 1ns / 1ps

module alu_logic(
input logic signed [31:0] alu_in1,
input logic signed [31:0] alu_in2,
input logic [3:0] alu_op,
output logic signed  [31:0] alu_result,
output logic carry_out,
output logic Zero,
output logic Negative,
output logic Overflow
    );
logic [32:0] temp_result; 
logic [31:0] a_u, b_u;
assign a_u = alu_in1;
assign b_u = alu_in2;
    always_comb begin
        carry_out = 0;
        Overflow = 0;
        case (alu_op)
            4'b0000: begin // ADD
                temp_result = {1'b0, alu_in1} + {1'b0, alu_in2};
                alu_result = temp_result[31:0];
                carry_out = temp_result[32];
                Overflow = (alu_in1[31] == alu_in2[31]) && (alu_result[31] != alu_in1[31]);
            end
            4'b1000: begin // SUB
                temp_result = {1'b0, alu_in1} - {1'b0, alu_in2};
                alu_result = temp_result[31:0];
                carry_out = (a_u >= b_u); // Borrow bit
                Overflow = (alu_in1[31] != alu_in2[31]) && (alu_result[31] != alu_in1[31]);
            end
            4'b0001: alu_result = alu_in1 << alu_in2[4:0]; // shift left
            4'b0010: alu_result = (alu_in1 < alu_in2) ? 32'h1 : 32'd0;// set less than
            4'b0011: alu_result = (alu_in1 <alu_in2) ? 32'd1 : 32'd0; // set less than unsigned
            4'b0100: alu_result = alu_in1 ^ alu_in2; // XOR
            4'b0101: alu_result = alu_in1 >> alu_in2[4:0]; // shift right logical
            4'b1101: alu_result = alu_in1 >>> alu_in2[4:0]; // shift right arithmatic
            4'b0110: alu_result = alu_in1| alu_in2; // or 
            4'b0111: alu_result = alu_in1 & alu_in2;// and
            default: begin
                alu_result = 32'd0;
            end
        endcase
        Negative = alu_result[31];
        Zero = (alu_result == 32'd0);
    end
 
endmodule
