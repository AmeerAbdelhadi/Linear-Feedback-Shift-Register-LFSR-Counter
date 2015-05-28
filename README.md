##Linear Feedback Shift Register (LFSR) Counter##
##Ameer M. Abdelhadi (ameer.abdelhadi@gmail.com)##


##Linear Feedback Shift Register (LFSR) Counter; A periodic counter with random count##


**PLATFORM:** DE2-115 Development board with Cyclone IV

**LICENSE:** BSD 3-Clause ("BSD New" or "BSD Simplified") license


---


### Files and directories in this package ###

  * **README:** This file!
  * **LICENSE:** BSD 3-Clause ("BSD New" or "BSD Simplified") license
  * **lfsr_test.qpf:** Quartus II project file
  * **lfsr_test.qsf:** Quartus II settings file
  * **lfsr_test.sdc:** Synopsys design constraints file; Design constraints and timing assignments
  * **lfsr_test.pin:** Cyclone IV pin assignments
  * **math_utils.vh:** math precompile definitions (macros) and functions
  * **lfsr_utils.vh:** LFSR functions:
    1. lfsr_fb   : returns LFSR's feedback bit to use in LFSR counters
    2. index2lfsr: converts an index (order) to a corresponding LFSR number for generating intial and bounding LFSR numbers
  * **debouncer.v:** Key debouncer/ glitch filter with clock divider using LFSR filter
  * **hex7seg.v:** Hexadecimal 7-segment controller
  * **lfsr_test.v:** Test circuit for LFSR periodic counter; Using DE2-115 Development board / Cyclone IV
  * **lfsr.v:** Linear Feedback Shift Register (LFSR); A periodic random counter with asyncronous reset and upper bound 
  * **output_files/:** A directory containing Altera's logs and reports
