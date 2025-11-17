####################################################################################################
## Environment Setup
####################################################################################################

# Print CPU information (useful for debug/log purposes)
if {[file exists /proc/cpuinfo]} {
    sh grep "model name" /proc/cpuinfo
    sh grep "cpu MHz"    /proc/cpuinfo
}

# Print hostname for log traceability
puts "Hostname : report timing [info hostname]"

# Setup library search path (standard cell libraries, etc.)
# IMPORTANT: Update the path to match your project environment
set_db / .init_lib_search_path /home/cc/Physical_Design/Project/Front_End

# Read the technology library file
read_libs {./65_lp_libs/tcbn65lptc.lib ./Libs/tpzn65lpgv2od3tc.lib}

####################################################################################################
## Design Setup
####################################################################################################

# Define top-level design name (change this to your design top module)
set DESIGN       Top_wrap     

# Set synthesis effort (generic synthesis step)
# Options: high | medium | low
set GEN_EFF      high        

# Set mapping & optimization effort
# Options: high | medium | low
set MAP_OPT_EFF  high        

set_db / .use_scan_seqs_for_non_dft false
####################################################################################################
## Read and Elaborate Design
####################################################################################################

# Read HDL source files (Verilog 2001 in this case)
# IMPORTANT: Update the path if your Verilog source is located elsewhere
read_hdl -v2001 {/home/cc/Physical_Design/Project/Front_End/RTL/Top_wrap.v}
read_hdl -sv {/home/cc/Physical_Design/Project/Front_End/RTL/CORE.sv}
read_hdl -sv {/home/cc/Physical_Design/Project/Front_End/RTL/ALU_control.sv}
read_hdl -sv {/home/cc/Physical_Design/Project/Front_End/RTL/alu_logic.sv}
read_hdl -sv {/home/cc/Physical_Design/Project/Front_End/RTL/branch_unit.sv}
read_hdl -sv {/home/cc/Physical_Design/Project/Front_End/RTL/imm_gen.sv}
read_hdl -sv {/home/cc/Physical_Design/Project/Front_End/RTL/main_control.sv}
read_hdl -sv {/home/cc/Physical_Design/Project/Front_End/RTL/program_counter.sv}
read_hdl -sv {/home/cc/Physical_Design/Project/Front_End/RTL/reg_file.sv}


# Elaborate the top-level module
elaborate $DESIGN

# Check design for unresolved references (ensures all modules are linked correctly)
check_design -unresolved

# Read constraints file (SDC format)
# Contains clock definitions, input/output delays, etc.
read_sdc {/home/cc/Physical_Design/Project/Front_End/constraints/CORE.sdc}


####################################################################################################
## Synthesis Flow
####################################################################################################

# Step 1: Generic Synthesis (technology-independent RTL → generic netlist)
set_db / .syn_generic_effort $GEN_EFF
syn_generic

# Step 2: Technology Mapping (map generic netlist to standard cells from library)
set_db / .syn_map_effort $MAP_OPT_EFF
syn_map

# Step 3: Netlist Optimization (timing, area, power optimizations)
set_db / .syn_opt_effort $MAP_OPT_EFF
syn_opt


####################################################################################################
## Write Outputs
####################################################################################################

# Write synthesized Verilog netlist (mapped to library cells)
write_hdl $DESIGN -mapped   >> ./Netlist/${DESIGN}_map.v

# Write constraints file for backend PnR (to be used in Innovus)
write_sdc $DESIGN           >> ./out/${DESIGN}_map.sdc

# Write delay annotation file (to be used in ModelSim/other simulators)
write_sdf -design $DESIGN   >> ./out/${DESIGN}_map.sdf

# Generate overall synthesis metrics in HTML format
report_metric -format html -file synthesis_report.html


####################################################################################################
## Reports
####################################################################################################

# Generate timing report (with full pin names for clarity)
report timing  -full_pin_names   >> ./RPT/${DESIGN}_timing.rpt

# Generate area report (cell count, area usage, etc.)
report area                     >> ./RPT/${DESIGN}_area.rpt

# Generate gates report (number of gates, breakdown of logic types)
report gates                    >> ./RPT/${DESIGN}_gates.rpt

# Generate power report (power estimation from synthesized netlist)
report power                    >> ./RPT/${DESIGN}_power.rpt

# Generate Quality of Results (QoR) report
# Includes logic levels, fanout, etc.
report qor -levels_of_logic      >> ./RPT/${DESIGN}_qor.rpt


####################################################################################################
## GUI (Optional)
####################################################################################################

# Launch GUI for interactive exploration of design (optional)
gui_show

# Exit tool after script completion (uncomment if running in batch mode)
## quit
