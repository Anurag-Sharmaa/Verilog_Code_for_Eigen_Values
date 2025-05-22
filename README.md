# Verilog_Code_for_Eigen_Values
Maximum Eigenvalue Computation on FPGA
This repository contains Verilog HDL code for computing the maximum eigenvalue of a 4×4 complex matrix using the Power Method, designed for FPGA implementation.

Description
The project implements a digital VLSI architecture that iteratively estimates the dominant eigenvalue using the power method. The design was synthesized and tested on the Nexys 4 DDR FPGA using the Xilinx Vivado toolset.

Methodology
Algorithm: Power method for dominant eigenvalue estimation

Matrix Input: 4×4 complex matrix

Key Operations: Matrix-vector multiplication, normalization, maximum value extraction

HDL Design: Modular Verilog implementation including multiplier, divider, and comparator modules

Verification: Simulation and real-time testing using Integrated Logic Analyzer (ILA)
