Extended MIPS single-cycle implementation by implementing two additional instructions using Verilog in ModelSim.

brn, R-type, funct=21, brn $rs, if Status [N] = 1 branches to address found in register $rs

sllv, R-type, func=4, sllv $rd, $rt, $rs, shift register $rt to left by the value in register $rs and store the result in register $rd
