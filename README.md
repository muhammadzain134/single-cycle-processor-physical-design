# Single-Cycle RISC-V Processor – Physical Design (Core Only)

This repository contains the **Physical Design Implementation** of the **Single-Cycle RISC-V Processor Core**.  
The design focuses on the **processor core only** (ALU, Register File, Control Unit, and datapath) and **excludes instruction and data memories** to reduce complexity.

This project demonstrates the **full digital design flow** from RTL to physical layout for the CPU core.

---

## Features

- **Processor Core RTL:**  
  - ALU (ADD, SUB, AND, OR, SLT, etc.)  
  - Register File  
  - Control Unit  
  - Program Counter & datapath  
- **Synthesis:** Gate-level netlist using a standard cell library  
- **Floorplanning & Placement:** Core block arrangement and I/O pin assignment  
- **Routing:** Physical interconnects for core signals  
- **Timing Analysis:** Setup and hold checks for core logic  
- **Simulation:** Functional verification of processor core  

---

## Design Flow

1. **RTL Design:** SystemVerilog implementation of the processor core  
2. **Synthesis:** Generate gate-level netlist from RTL  
3. **Floorplanning:** Arrange functional blocks and assign I/O pins  
4. **Power Planning:** Create power grids and assign power/ground nets  
5. **Placement & Routing:** Physically place cells and route interconnects  
6. **Verification:** Functional and timing correctness  

---
