# bitstream_auto.tcl
# Automated Bitstream Generation for Twiddle Factor Mapping Analysis

This directory contains TCL scripts and COE files used to automatically generate FPGA bitstreams for analyzing the mapping of Number Theoretic Transform (NTT) twiddle factors to the bitstream of an Artix-7 FPGA (specifically the xc7a35).

## Purpose

The goal is to understand how a 12-bit wide and 128-deep storage space for twiddle factors in Block RAM (BRAM) is represented within the FPGA bitstream. This is achieved by systematically changing the contents of the BRAM initialization file (COE file) and observing the resulting differences in the generated bitstreams.

## Important Notes: Path Configuration

**Before running the `generate_bitstreams.tcl` script, you MUST verify and potentially modify the file paths within the script to match your local setup.**

Specifically, check and update the following variables at the beginning of the script:

-   `coe_dir`: This variable defines the directory where your COE files are located. **Ensure the path `"D:/pqc/bitstream_fault/Bitstream_Fault/BRAM_find_where/COE_FILE_1bit"` is correct on your system.**
-   `ip_file`: This variable specifies the path to your BRAM IP core configuration file (`.xci` file). **Ensure the path `"D:/pqc/bitstream_fault/Bitstream_Fault/BRAM_find_where/vivado/vivado.srcs/sources_1/ip/bram_12_128/bram_12_128.xci"` is correct for your Vivado project.**

**Failure to update these paths will result in errors when the script attempts to locate the COE files and the BRAM IP core.**
