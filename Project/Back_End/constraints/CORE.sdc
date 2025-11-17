set sdc_version 2.0

# ===============================================================
# Clock Definition
# ===============================================================

# Clock defined on internal net after clock pad buffer
create_clock -name CLK -period 20 -waveform {0 10} [get_pins {clk_inst/XC}]

# ===============================================================
# Clock Characteristics
# ===============================================================

set_clock_uncertainty -setup 0.2 [get_clocks CLK]
set_clock_uncertainty -hold  0.01 [get_clocks CLK]

set_clock_transition -max 0.5 [get_clocks CLK]
set_clock_transition -min 0.1 [get_clocks CLK]

# ===============================================================
# Input Constraints
# ===============================================================

# 32-bit instruction inputs
set_input_delay -clock CLK -max 2 [get_pins {
instr_inst0/C instr_inst1/C instr_inst2/C instr_inst3/C instr_inst4/C instr_inst5/C instr_inst6/C instr_inst7/C 
instr_inst8/C instr_inst9/C instr_inst10/C instr_inst11/C instr_inst12/C instr_inst13/C instr_inst14/C instr_inst15/C 
instr_inst16/C instr_inst17/C instr_inst18/C instr_inst19/C instr_inst20/C instr_inst21/C instr_inst22/C instr_inst23/C 
instr_inst24/C instr_inst25/C instr_inst26/C instr_inst27/C instr_inst28/C instr_inst29/C instr_inst30/C instr_inst31/C}]

set_input_delay -clock CLK -min 0.5 [get_pins {
instr_inst0/C instr_inst1/C instr_inst2/C instr_inst3/C instr_inst4/C instr_inst5/C instr_inst6/C instr_inst7/C 
instr_inst8/C instr_inst9/C instr_inst10/C instr_inst11/C instr_inst12/C instr_inst13/C instr_inst14/C instr_inst15/C 
instr_inst16/C instr_inst17/C instr_inst18/C instr_inst19/C instr_inst20/C instr_inst21/C instr_inst22/C instr_inst23/C 
instr_inst24/C instr_inst25/C instr_inst26/C instr_inst27/C instr_inst28/C instr_inst29/C instr_inst30/C instr_inst31/C}]

# 32-bit data read inputs
set_input_delay -clock CLK -max 2 [get_pins {
dataR_inst0/C dataR_inst1/C dataR_inst2/C dataR_inst3/C dataR_inst4/C dataR_inst5/C dataR_inst6/C dataR_inst7/C 
dataR_inst8/C dataR_inst9/C dataR_inst10/C dataR_inst11/C dataR_inst12/C dataR_inst13/C dataR_inst14/C dataR_inst15/C 
dataR_inst16/C dataR_inst17/C dataR_inst18/C dataR_inst19/C dataR_inst20/C dataR_inst21/C dataR_inst22/C dataR_inst23/C 
dataR_inst24/C dataR_inst25/C dataR_inst26/C dataR_inst27/C dataR_inst28/C dataR_inst29/C dataR_inst30/C dataR_inst31/C}]

set_input_delay -clock CLK -min 0.5 [get_pins {
dataR_inst0/C dataR_inst1/C dataR_inst2/C dataR_inst3/C dataR_inst4/C dataR_inst5/C dataR_inst6/C dataR_inst7/C 
dataR_inst8/C dataR_inst9/C dataR_inst10/C dataR_inst11/C dataR_inst12/C dataR_inst13/C dataR_inst14/C dataR_inst15/C 
dataR_inst16/C dataR_inst17/C dataR_inst18/C dataR_inst19/C dataR_inst20/C dataR_inst21/C dataR_inst22/C dataR_inst23/C 
dataR_inst24/C dataR_inst25/C dataR_inst26/C dataR_inst27/C dataR_inst28/C dataR_inst29/C dataR_inst30/C dataR_inst31/C}]

# Reset input
set_input_delay -clock CLK -max 2 [get_pins {rst_inst/C}]
set_input_delay -clock CLK -min 0.5 [get_pins {rst_inst/C}]
#set_false_path -from [get_pins {rst_inst/C}]

# ===============================================================
# Output Constraints
# ===============================================================

# 32-bit program counter outputs
set_output_delay -clock CLK -max 5.0 [get_pins {
pc_inst0/I pc_inst1/I pc_inst2/I pc_inst3/I pc_inst4/I pc_inst5/I pc_inst6/I pc_inst7/I 
pc_inst8/I pc_inst9/I pc_inst10/I pc_inst11/I pc_inst12/I pc_inst13/I pc_inst14/I pc_inst15/I 
pc_inst16/I pc_inst17/I pc_inst18/I pc_inst19/I pc_inst20/I pc_inst21/I pc_inst22/I pc_inst23/I 
pc_inst24/I pc_inst25/I pc_inst26/I pc_inst27/I pc_inst28/I pc_inst29/I pc_inst30/I pc_inst31/I}]
set_output_delay -clock CLK -min 2.0 [get_pins {
pc_inst0/I pc_inst1/I pc_inst2/I pc_inst3/I pc_inst4/I pc_inst5/I pc_inst6/I pc_inst7/I 
pc_inst8/I pc_inst9/I pc_inst10/I pc_inst11/I pc_inst12/I pc_inst13/I pc_inst14/I pc_inst15/I 
pc_inst16/I pc_inst17/I pc_inst18/I pc_inst19/I pc_inst20/I pc_inst21/I pc_inst22/I pc_inst23/I 
pc_inst24/I pc_inst25/I pc_inst26/I pc_inst27/I pc_inst28/I pc_inst29/I pc_inst30/I pc_inst31/I}]

# 32-bit ALU result outputs
set_output_delay -clock CLK -max 5.0 [get_pins {
alu_inst0/I alu_inst1/I alu_inst2/I alu_inst3/I alu_inst4/I alu_inst5/I alu_inst6/I alu_inst7/I 
alu_inst8/I alu_inst9/I alu_inst10/I alu_inst11/I alu_inst12/I alu_inst13/I alu_inst14/I alu_inst15/I 
alu_inst16/I alu_inst17/I alu_inst18/I alu_inst19/I alu_inst20/I alu_inst21/I alu_inst22/I alu_inst23/I 
alu_inst24/I alu_inst25/I alu_inst26/I alu_inst27/I alu_inst28/I alu_inst29/I alu_inst30/I alu_inst31/I}]

set_output_delay -clock CLK -min 2.0 [get_pins {
alu_inst0/I alu_inst1/I alu_inst2/I alu_inst3/I alu_inst4/I alu_inst5/I alu_inst6/I alu_inst7/I 
alu_inst8/I alu_inst9/I alu_inst10/I alu_inst11/I alu_inst12/I alu_inst13/I alu_inst14/I alu_inst15/I 
alu_inst16/I alu_inst17/I alu_inst18/I alu_inst19/I alu_inst20/I alu_inst21/I alu_inst22/I alu_inst23/I 
alu_inst24/I alu_inst25/I alu_inst26/I alu_inst27/I alu_inst28/I alu_inst29/I alu_inst30/I alu_inst31/I}]

# 32-bit DataWM outputs
set_output_delay -clock CLK -max 5.0 [get_pins {
DataWM_inst0/I DataWM_inst1/I DataWM_inst2/I DataWM_inst3/I DataWM_inst4/I DataWM_inst5/I DataWM_inst6/I DataWM_inst7/I DataWM_inst8/I DataWM_inst9/I DataWM_inst10/I DataWM_inst11/I DataWM_inst12/I DataWM_inst13/I DataWM_inst14/I DataWM_inst15/I DataWM_inst16/I DataWM_inst17/I DataWM_inst18/I DataWM_inst19/I DataWM_inst20/I DataWM_inst21/I DataWM_inst22/I DataWM_inst23/I DataWM_inst24/I DataWM_inst25/I DataWM_inst26/I DataWM_inst27/I DataWM_inst28/I DataWM_inst29/I DataWM_inst30/I DataWM_inst31/I}]

set_output_delay -clock CLK -min 2.0 [get_pins {
DataWM_inst0/I DataWM_inst1/I DataWM_inst2/I DataWM_inst3/I DataWM_inst4/I DataWM_inst5/I DataWM_inst6/I DataWM_inst7/I DataWM_inst8/I DataWM_inst9/I DataWM_inst10/I DataWM_inst11/I DataWM_inst12/I DataWM_inst13/I DataWM_inst14/I DataWM_inst15/I DataWM_inst16/I DataWM_inst17/I DataWM_inst18/I DataWM_inst19/I DataWM_inst20/I DataWM_inst21/I DataWM_inst22/I DataWM_inst23/I DataWM_inst24/I DataWM_inst25/I DataWM_inst26/I DataWM_inst27/I DataWM_inst28/I DataWM_inst29/I DataWM_inst30/I DataWM_inst31/I}]

# Single-bit control outputs
set_output_delay -clock CLK -max 5.0 [get_pins {MemWrite_inst/I MemRead_inst/I}]
set_output_delay -clock CLK -min 2.0 [get_pins {MemWrite_inst/I MemRead_inst/I}]

# ===============================================================
# Environmental Constraints
# ===============================================================

# Input transition times at top ports
set_input_transition -max 0.1 [get_ports {instr[*] dataR[*] rst}]
set_input_transition -min 0.1 [get_ports {instr[*] dataR[*] rst}]

# Clock input transition
set_input_transition -max 0.1 [get_ports clk]
set_input_transition -min 0.1 [get_ports clk]

# Output load capacitance (typical pad + PCB trace + next device input)
set_load 50 [get_ports {pc[*] alu_result[*] DataWM[*] MemWrite MemRead}]

